package com.posgui;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * PosGUI - manual hardware tester for aQsi 5-F (Ciontek CS10-PCD).
 * Uses vpos.apipackage JNI via reflection (PosApiHelper) to avoid direct compile dep.
 * All tests run on background threads; results appended to on-screen log.
 */
public class MainActivity extends Activity {

    private TextView logView;
    private ScrollView logScroll;
    private Handler ui = new Handler(Looper.getMainLooper());

    // PosApiHelper reflection handles
    private Object helper;          // PosApiHelper instance
    private Class<?> clsHelper;
    private boolean helperOk = false;

    // ============================ lifecycle ============================
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        logView = findViewById(R.id.log);
        logScroll = findViewById(R.id.logScroll);
        findViewById(R.id.btnClear).setOnClickListener(v -> logView.setText(""));

        initHelper();
        buildButtons();
        log("PosGUI ready. libPosApi " + (helperOk ? "LOADED" : "NOT FOUND"));
    }

    private void initHelper() {
        try {
            clsHelper = Class.forName("vpos.apipackage.PosApiHelper");
            Method getInstance = clsHelper.getMethod("getInstance");
            helper = getInstance.invoke(null);
            helperOk = helper != null;
        } catch (Throwable t) {
            log("initHelper error: " + t);
        }
    }

    private void buildButtons() {
        LinearLayout box = findViewById(R.id.buttons);
        addBtn(box, "SYS info (ver/SN/ChipID/time)", this::testSys);
        addBtn(box, "Beep", this::testBeep);
        addBtn(box, "LEDs blink 1-4", this::testLeds);
        addBtn(box, "ICC chip card (ATR + SELECT)", this::testIcc);
        addBtn(box, "NFC / PICC (UID + EMV PPSE)", this::testPicc);
        addBtn(box, "Mifare M1 read block 4", this::testMifare);
        addBtn(box, "MSR swipe (30s)", this::testMsr);
        addBtn(box, "Print sample", this::testPrint);
        addBtn(box, "Scan 1D barcode (10s)", this::testScan);
        addBtn(box, "PCI crypto (rnd + DES + KCV)", this::testPci);
        addBtn(box, "EMV entry point detect", this::testEmvDetect);
        addBtn(box, "ALL (non-interactive)", this::testAll);
    }

    private void addBtn(LinearLayout box, String text, Runnable r) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setOnClickListener(v -> runBg(r));
        box.addView(b);
    }

    // ============================ infra ============================
    private void runBg(Runnable r) {
        new Thread(() -> {
            try { r.run(); } catch (Throwable t) { log("ERROR: " + t); }
        }).start();
    }

    private void log(String s) {
        ui.post(() -> {
            logView.append(s + "\n");
            // scroll the ScrollView to bottom after layout
            logScroll.post(() -> logScroll.fullScroll(View.FOCUS_DOWN));
        });
    }

    private void sleep(long ms) { try { Thread.sleep(ms); } catch (Exception e) {} }

    private String hex(byte[] b) { return hex(b, b == null ? 0 : b.length); }
    private String hex(byte[] b, int len) {
        if (b == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len && i < b.length; i++) sb.append(String.format("%02X", b[i]));
        return sb.toString();
    }
    private String ascii(byte[] b) {
        if (b == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (byte x : b) { if (x == 0) break; sb.append(x >= 0x20 && x < 0x7F ? (char) x : '.'); }
        return sb.toString();
    }
    private int findNull(byte[] b) { for (int i = 0; i < b.length; i++) if (b[i] == 0) return i; return b.length; }

    // ============================ reflection call helper ============================
    private int call(String name, Class<?>[] sig, Object... args) {
        if (!helperOk) return -9999;
        try {
            Method m = clsHelper.getMethod(name, sig);
            Object r = m.invoke(helper, args);
            return r instanceof Integer ? (Integer) r : -9998;
        } catch (Throwable t) {
            log("call " + name + " err: " + t.getMessage());
            return -9997;
        }
    }
    private int call0(String name) { return call(name, new Class<?>[]{}); }

    // ============================ tests ============================

    private void testSys() {
        log("\n=== SYS ===");
        byte[] ver = new byte[32];
        int r = call("SysGetVersion", new Class<?>[]{byte[].class}, (Object) ver);
        log("GetVersion rc=" + r + " hex=" + hex(ver, 8));

        byte[] sn = new byte[32];
        r = call("SysReadSN", new Class<?>[]{byte[].class}, (Object) sn);
        log("SN rc=" + r + " [" + ascii(sn) + "]");

        byte[] chip = new byte[16];
        r = call("SysReadChipID", new Class<?>[]{byte[].class, int.class}, (Object) chip, 16);
        log("ChipID rc=" + r + " " + hex(chip));
    }

    private void testBeep() {
        log("\n=== BEEP ===");
        log("rc=" + call0("SysBeep"));
    }

    private void testLeds() {
        log("\n=== LEDs ===");
        for (int led = 1; led <= 4; led++) {
            int on = call("SysSetLedMode", new Class<?>[]{int.class, int.class}, led, 1);
            sleep(150);
            int off = call("SysSetLedMode", new Class<?>[]{int.class, int.class}, led, 0);
            log("LED" + led + " on=" + on + " off=" + off);
        }
    }

    private void testIcc() {
        log("\n=== ICC chip ===");
        int r = call("IccCheck", new Class<?>[]{byte.class}, (byte) 0);
        log("IccCheck rc=" + r + (r == 0 ? " (card present)" : " (no card)"));
        if (r != 0) { log("Insert chip card and retry"); return; }

        byte[] atr = new byte[40];
        r = call("IccOpen", new Class<?>[]{byte.class, byte.class, byte[].class}, (byte) 0, (byte) 1, atr);
        int alen = atr[0] & 0xFF;
        log("IccOpen rc=" + r + " ATR=" + hex(atr, Math.min(alen + 1, 40)));
        if (r != 0) return;

        // SELECT 1PAY
        byte[] resp = new byte[516];
        byte[] cmd = {0, (byte) 0xA4, 4, 0};
        byte[] din = "1PAY.SYS.DDF01".getBytes();
        byte[] apdu = buildApdu(cmd, din, (short) 1);
        r = call("IccCommand", new Class<?>[]{byte.class, byte[].class, byte[].class}, (byte) 0, apdu, resp);
        log("SELECT 1PAY rc=" + r + " SW=" + sw(resp));

        // SELECT 2PAY
        din = "2PAY.SYS.DDF01".getBytes();
        apdu = buildApdu(cmd, din, (short) 1);
        resp = new byte[516];
        r = call("IccCommand", new Class<?>[]{byte.class, byte[].class, byte[].class}, (byte) 0, apdu, resp);
        log("SELECT 2PAY rc=" + r + " SW=" + sw(resp));

        call("IccClose", new Class<?>[]{byte.class}, (byte) 0);
        log("IccClose done");
    }

    private void testPicc() {
        log("\n=== NFC / PICC ===");
        int r = call0("PiccOpen");
        log("PiccOpen rc=" + r);
        if (r != 0) return;

        byte[] cardType = new byte[3];
        byte[] serialNo = new byte[50];
        r = call("PiccCheck", new Class<?>[]{byte.class, byte[].class, byte[].class}, (byte) 'A', cardType, serialNo);
        log("PiccCheck('A') rc=" + r + " SN=" + hex(serialNo, findNull(serialNo)));
        boolean present = (r == 0);

        if (present) {
            byte[] cmd = {0, (byte) 0xA4, 4, 0};
            byte[] din = "2PAY.SYS.DDF01".getBytes();
            byte[] apdu = buildApdu(cmd, din, (short) 8);
            byte[] resp = new byte[516];
            r = call("PiccCommand", new Class<?>[]{byte[].class, byte[].class}, apdu, resp);
            log("SELECT PPSE rc=" + r + " SW=" + sw(resp) +
                (r == 0 ? "\n  FCI=" + hex(resp, Math.min(respLen(resp), 40)) : ""));
        }

        call0("PiccClose");
        log("PiccClose done");
    }

    private void testMifare() {
        log("\n=== Mifare M1 ===");
        int r = call0("PiccOpen");
        if (r != 0) { log("PiccOpen rc=" + r); return; }
        byte[] cardType = new byte[3];
        byte[] serialNo = new byte[50];
        r = call("PiccCheck", new Class<?>[]{byte.class, byte[].class, byte[].class}, (byte) 'M', cardType, serialNo);
        log("M1 check rc=" + r + " SN=" + hex(serialNo, 8));
        if (r == 0) {
            byte[] pwd = new byte[20];
            for (int i = 0; i < 6; i++) pwd[i] = (byte) 0xFF;
            r = call("PiccM1Authority", new Class<?>[]{byte.class, byte.class, byte[].class, byte[].class},
                    (byte) 'A', (byte) 4, pwd, serialNo);
            log("M1Auth rc=" + r);
            if (r == 0) {
                byte[] blk = new byte[16];
                r = call("PiccM1ReadBlock", new Class<?>[]{byte.class, byte[].class}, (byte) 4, blk);
                log("M1ReadBlock(4) rc=" + r + " data=" + hex(blk));
            }
        }
        call0("PiccClose");
    }

    private void testMsr() {
        log("\n=== MSR swipe (30s) ===");
        int r = call0("McrOpen");
        log("McrOpen rc=" + r);
        if (r != 0) return;
        log("SWIPE NOW...");

        long deadline = System.currentTimeMillis() + 30000;
        boolean ok = false;
        while (System.currentTimeMillis() < deadline && !ok) {
            call0("McrOpen");
            int temp = -1;
            while (temp != 0 && System.currentTimeMillis() < deadline) {
                temp = call0("McrCheck");
                sleep(200);
            }
            if (System.currentTimeMillis() >= deadline) break;
            byte[] t1 = new byte[250], t2 = new byte[250], t3 = new byte[250];
            int ret = call("McrRead", new Class<?>[]{byte.class, byte.class, byte[].class, byte[].class, byte[].class},
                    (byte) 0, (byte) 0, t1, t2, t3);
            log("McrRead ret=" + ret);
            if (ret > 0) {
                if ((ret & 1) == 1) log("TRACK1: " + ascii(t1));
                if ((ret & 2) == 2) log("TRACK2: " + ascii(t2));
                if ((ret & 4) == 4) log("TRACK3: " + ascii(t3));
                call0("SysBeep");
                ok = true;
            }
        }
        if (!ok) log("timeout, no swipe");
        call0("McrClose");
    }

    private void testPrint() {
        log("\n=== PRINT ===");
        int r = call0("PrintInit");
        log("PrintInit rc=" + r);
        if (r != 0) { log("printer init failed"); return; }
        log("SetGray rc=" + call("PrintSetGray", new Class<?>[]{int.class}, 3));
        log("SetFont rc=" + call("PrintSetFont", new Class<?>[]{byte.class, byte.class, byte.class},
                (byte) 24, (byte) 24, (byte) 0));
        printLine("--------------------------------");
        printLine("PosGUI print test");
        printLine("aQsi 5-F / CS10-PCD");
        printLine("0123456789 ABCDEF");
        printLine("--------------------------------\n\n");
        r = call0("PrintStart");
        log("PrintStart rc=" + r + (r == -3 ? " [low voltage]" : r == -1 ? " [no paper]" : r == -2 ? " [overheat]" : ""));
        call0("PrintClose");
    }

    private void printLine(String s) {
        call("PrintStr", new Class<?>[]{String.class}, s + "\n");
    }

    private void testScan() {
        log("\n=== SCAN 1D (10s) ===");
        try {
            Class<?> scanCls = Class.forName("vpos.apipackage.Scan");
            Method open = scanCls.getMethod("Lib_ScanOpen");
            Method read = scanCls.getMethod("Lib_ScanRead", short.class, String[].class);
            Method close = scanCls.getMethod("Lib_ScanClose");
            int r = (Integer) open.invoke(null);
            log("ScanOpen rc=" + r);
            if (r != 0) { log("scanner busy/n/a via libPosApi (use binder scannerservice)"); return; }
            log("Point at barcode...");
            String[] out = new String[1];
            Object res = read.invoke(null, (short) 10000, out);
            log("ScanRead rc=" + res + " data=[" + (out[0] == null ? "" : out[0]) + "]");
            close.invoke(null);
        } catch (Throwable t) { log("Scan err: " + t.getMessage()); }
    }

    private void testPci() {
        log("\n=== PCI crypto ===");
        byte[] rnd = new byte[16];
        int r = call("PciGetRnd", new Class<?>[]{byte[].class}, (Object) rnd);
        log("GetRnd rc=" + r + " " + hex(rnd, 8));

        // DES self-test via Sys.Lib_Des through reflection is awkward; use helper Des if present
        try {
            Method m = clsHelper.getMethod("Des", byte[].class, byte[].class, byte[].class, int.class);
            byte[] in = new byte[8], out = new byte[8], key = new byte[8];
            Object res = m.invoke(helper, in, out, key, 0);
            log("DES rc=" + res + " out=" + hex(out) + " (expect 8CA64DE9C1B123A7)");
        } catch (Throwable t) { log("DES n/a: " + t.getMessage()); }

        for (byte k = 0; k < 2; k++) {
            byte[] kcv = new byte[8];
            r = call("PciReadKcv", new Class<?>[]{byte.class, byte.class, byte[].class}, (byte) 0, k, kcv);
            log("KCV key" + k + " rc=" + r + " " + hex(kcv));
        }
    }

    private void testEmvDetect() {
        log("\n=== EMV detect (20s) ===");
        int r = call0("EntryPoint_Open");
        log("EntryPoint_Open rc=" + r);
        log("Present card to any reader...");

        long deadline = System.currentTimeMillis() + 20000;
        int cardType = -1;
        while (System.currentTimeMillis() < deadline) {
            cardType = call0("EntryPoint_Detect");
            if (cardType >= 0 && cardType != 8) break;   // real card detected
            if (cardType == 8) { sleep(300); continue; }  // no card yet
            sleep(300);
        }
        call0("EntryPoint_Close");

        log("EntryPoint_Detect rc=" + cardType + " -> " + decodeCardType(cardType));
    }

    private String decodeCardType(int t) {
        switch (t) {
            case 0: return "MSR (magnetic stripe)";
            case 1: return "ICC (contact chip)";
            case 2: return "NFC contactless (Paypass/MC)";
            case 3: return "NFC contactless (payWave/UnionPay)";
            case 8: return "no card";
            case -1: return "timeout / cancelled";
            default: return "unknown";
        }
    }

    private void testAll() {
        testSys();
        testBeep();
        testIcc();
        testPicc();
        testPci();
        testEmvDetect();
        testPrint();
        log("\n=== ALL DONE ===");
    }

    // ============================ APDU utils ============================
    private byte[] buildApdu(byte[] cmd, byte[] dataIn, short le) {
        byte[] buf = new byte[520];
        System.arraycopy(cmd, 0, buf, 0, cmd.length);
        buf[4] = (byte) (dataIn.length / 256);
        buf[5] = (byte) (dataIn.length % 256);
        System.arraycopy(dataIn, 0, buf, 6, dataIn.length);
        buf[518] = (byte) (le / 256);
        buf[519] = (byte) (le % 256);
        return buf;
    }

    private String sw(byte[] resp) {
        return String.format("%02X%02X", resp[514], resp[515]);
    }

    private int respLen(byte[] resp) {
        return ((resp[1] & 0xFF) << 8 | (resp[0] & 0xFF)) + 2;
    }
}
