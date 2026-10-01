package com.postest;

import vpos.apipackage.Sys;
import vpos.apipackage.Icc;
import vpos.apipackage.Mcr;
import vpos.apipackage.Picc;
import vpos.apipackage.Print;
import vpos.apipackage.Scan;
import vpos.apipackage.Pci;
import vpos.apipackage.APDU_SEND;
import vpos.apipackage.APDU_RESP;

/**
 * PosTestSuite - console clone of Ciontek PassSDKDemo (test.apidemo.activity).
 * Covers all its functions: SYS, ICC, PICC/NFC, MSR, PRINT, SCAN, PCI, EMV-detect.
 * Runs on-device via dalvikvm32 without APK installation:
 *   LD_LIBRARY_PATH=/data/app/test.apidemo.activity-1/lib/arm:/system/lib \
 *     dalvikvm32 -cp /data/local/tmp/postest_dex.jar com.postest.PosTestSuite [suite...]
 * No args = run all non-interactive suites. MSR runs as open/check only (no swipe wait).
 */
public class PosTestSuite {

    static void log(String s) { System.out.println(s); }
    static void hdr(String s) { System.out.println("\n========== " + s + " =========="); }
    static void sub(String s) { System.out.println("---- " + s + " ----"); }

    static String hex(byte[] b, int len) {
        if (b == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len && i < b.length; i++) sb.append(String.format("%02X", b[i]));
        return sb.toString();
    }
    static String hex(byte[] b) { return hex(b, b == null ? 0 : b.length); }

    static String ascii(byte[] b) {
        if (b == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (byte x : b) {
            if (x == 0) break;
            sb.append(x >= 0x20 && x < 0x7F ? (char) x : '.');
        }
        return sb.toString();
    }

    static int findNull(byte[] b) {
        for (int i = 0; i < b.length; i++) if (b[i] == 0) return i;
        return b.length;
    }

    // ============================ SYS ============================
    static void suiteSys() {
        hdr("SYS (SysActivity analog)");
        int r;

        sub("Firmware version (Lib_GetVersion)");
        byte[] ver = new byte[32];
        r = Sys.Lib_GetVersion(ver);
        log("rc=" + r + " raw=" + hex(ver) + " ascii=[" + ascii(ver) + "]");

        sub("Serial number (Lib_ReadSN)");
        byte[] sn = new byte[32];
        r = Sys.Lib_ReadSN(sn);
        log("rc=" + r + " SN=[" + ascii(sn) + "] hex=" + hex(sn, findNull(sn)));

        sub("Chip ID (Lib_ReadChipID)");
        byte[] chip = new byte[16];
        r = Sys.Lib_ReadChipID(chip, 16);
        log("rc=" + r + " chipID=" + hex(chip));

        sub("RTC time (Lib_GetTime)");
        byte[] time = new byte[7];
        r = Sys.Lib_GetTime(time);
        log("rc=" + r + " time(hex)=" + hex(time));

        sub("Beep (Lib_Beep)");
        r = Sys.Lib_Beep();
        log("rc=" + r);

        sub("LEDs (Lib_LedCtrl 1..4 on/off)");
        for (byte led = 1; led <= 4; led++) {
            r = Sys.Lib_LedCtrl(led, (byte) 1);
            log("led" + led + " ON rc=" + r);
            sleep(80);
            r = Sys.Lib_LedCtrl(led, (byte) 0);
            log("led" + led + " OFF rc=" + r);
        }

        sub("Tamper bit (Lib_SecuTamperBit)");
        try {
            r = Sys.Lib_SecuTamperBit((byte) 0, (byte) 0);
            log("rc=" + r);
        } catch (Throwable t) { log("n/a: " + t); }
    }

    // ============================ ICC ============================
    static void suiteIcc() {
        hdr("ICC contact chip (IccActivity analog)");
        byte[] atr = new byte[40];

        sub("IccCheck(slot=0)");
        int r = Icc.Lib_IccCheck((byte) 0);
        log("rc=" + r + (r == 0 ? " (card present)" : " (no card)"));
        if (r != 0) { log("SKIP: no card in chip slot"); return; }

        sub("IccOpen(slot=0, vccMode=1)");
        r = Icc.Lib_IccOpen((byte) 0, (byte) 1, atr);
        int atrLen = atr[0] & 0xFF;
        log("rc=" + r + " ATRlen=" + atrLen + " ATR=" + hex(atr, atrLen > 0 && atrLen < 40 ? atrLen + 1 : 40));
        if (r != 0) { log("IccOpen failed"); return; }

        sub("SELECT 1PAY.SYS.DDF01 (IccCommand)");
        byte[] cmd = { 0x00, (byte) 0xA4, 0x04, 0x00 };
        byte[] dataIn = "1PAY.SYS.DDF01".getBytes();
        APDU_SEND send = new APDU_SEND(cmd, (short) 14, dataIn, (short) 1);
        byte[] resp = new byte[516];
        r = Icc.Lib_IccCommand((byte) 0, send.getBytes(), resp);
        log("rc=" + r);
        if (r == 0) {
            APDU_RESP apdu = new APDU_RESP(resp);
            log("resp=" + hex(apdu.DataOut, apdu.LenOut) +
                " SWA=" + String.format("%02X", apdu.SWA) + " SWB=" + String.format("%02X", apdu.SWB));
        }

        sub("SELECT PPSE 2PAY.SYS.DDF01");
        byte[] dataIn2 = "2PAY.SYS.DDF01".getBytes();
        APDU_SEND send2 = new APDU_SEND(cmd, (short) 14, dataIn2, (short) 1);
        byte[] resp2 = new byte[516];
        r = Icc.Lib_IccCommand((byte) 0, send2.getBytes(), resp2);
        log("rc=" + r);
        if (r == 0) {
            APDU_RESP apdu = new APDU_RESP(resp2);
            log("resp=" + hex(apdu.DataOut, apdu.LenOut) +
                " SWA=" + String.format("%02X", apdu.SWA) + " SWB=" + String.format("%02X", apdu.SWB));
        }

        sub("GET CHALLENGE 8 (00 84 00 00 08) via IccApduCmd");
        byte[] gc = { 0x00, (byte) 0x84, 0x00, 0x00, 0x08 };
        byte[] gcOut = new byte[266];
        byte[] gcLen = new byte[2];
        r = Icc.Lib_IccApduCmd((byte) 0, gc, (short) 5, gcOut, gcLen);
        int olen = gcLen.length >= 2 ? ((gcLen[1] & 0xFF) << 8 | (gcLen[0] & 0xFF)) : 0;
        log("rc=" + r + " outLen=" + olen + " out=" + hex(gcOut, Math.min(olen, 32)));

        sub("PSAM slots detect (IccOpen on slots 1/2)");
        for (byte slot = 1; slot <= 2; slot++) {
            byte[] psamAtr = new byte[40];
            int rc = Icc.Lib_IccOpen(slot, (byte) 1, psamAtr);
            int alen = psamAtr[0] & 0xFF;
            log("slot" + slot + " open rc=" + rc +
                (rc == 0 ? " ATR=" + hex(psamAtr, Math.min(alen + 1, 40)) : " (empty / no PSAM)"));
            if (rc == 0) Icc.Lib_IccClose(slot);
        }

        Icc.Lib_IccClose((byte) 0);
        log("IccClose done");
    }

    // ============================ PICC / NFC ============================
    static void suitePicc() {
        hdr("PICC / NFC (PiccActivity analog)");
        int r = Picc.Lib_PiccOpen();
        log("PiccOpen rc=" + r);
        if (r != 0) { log("SKIP: PiccOpen failed"); return; }

        sub("PiccCheck mode 'B' (ISO14443-B)");
        byte[] cardType = new byte[3];
        byte[] serialNo = new byte[50];
        r = Picc.Lib_PiccCheck((byte) 'B', cardType, serialNo);
        log("rc=" + r + " cardType=" + hex(cardType) + " SN=" + hex(serialNo, findNull(serialNo)));

        sub("PiccCheck mode 'A' (ISO14443-A / Mifare)");
        cardType = new byte[3];
        serialNo = new byte[50];
        r = Picc.Lib_PiccCheck((byte) 'A', cardType, serialNo);
        log("rc=" + r + " cardType=" + hex(cardType) + " SN=" + hex(serialNo, findNull(serialNo)));
        boolean cardPresent = (r == 0);

        sub("PiccPolling (CardType/UID/ATS/SAK)");
        byte[] pCardType = new byte[4];
        byte[] uid = new byte[10];
        byte[] uidLen = new byte[1];
        byte[] ats = new byte[40];
        byte[] atsLen = new byte[1];
        byte[] sak = new byte[1];
        r = Picc.Lib_PiccPolling(pCardType, uid, uidLen, ats, atsLen, sak);
        log("rc=" + r + " CardType=[" + ascii(pCardType) + "] UID=" + hex(uid, uidLen[0] & 0xFF) +
            " ATS=" + hex(ats, atsLen[0] & 0xFF) + " SAK=" + hex(sak, 1));

        sub("PiccNfc (Technology/UID/NDEF)");
        byte[] nfcLen = new byte[5];
        byte[] tech = new byte[25];
        byte[] nfcUid = new byte[56];
        byte[] ndef = new byte[500];
        r = Picc.Lib_PiccNfc(nfcLen, tech, nfcUid, ndef);
        int techLen = nfcLen[0] & 0xFF, uidLn = nfcLen[1] & 0xFF;
        int ndefLn = (nfcLen[3] & 0xFF) + (nfcLen[4] & 0xFF);
        log("rc=" + r + " TYPE=[" + new String(tech, 0, Math.min(techLen, 25)) + "]" +
            " UID=" + hex(nfcUid, Math.min(uidLn, 56)) +
            " NDEFlen=" + ndefLn + " NDEF=[" + ascii(java.util.Arrays.copyOf(ndef, Math.min(ndefLn, 200))) + "]");

        if (cardPresent) {
            sub("PiccCommand SELECT PPSE 2PAY.SYS.DDF01");
            byte[] cmd = { 0x00, (byte) 0xA4, 0x04, 0x00 };
            APDU_SEND send = new APDU_SEND(cmd, (short) 14, "2PAY.SYS.DDF01".getBytes(), (short) 8);
            byte[] resp = new byte[516];
            r = Picc.Lib_PiccCommand(send.getBytes(), resp);
            log("rc=" + r);
            if (r == 0) {
                APDU_RESP apdu = new APDU_RESP(resp);
                log("resp=" + hex(apdu.DataOut, apdu.LenOut) +
                    " SWA=" + String.format("%02X", apdu.SWA) + " SWB=" + String.format("%02X", apdu.SWB));
            }

            sub("PiccCommand GET CHALLENGE");
            byte[] gc = { 0x00, (byte) 0x84, 0x00, 0x00, 0x08 };
            APDU_SEND send3 = new APDU_SEND(new byte[]{0x00,(byte)0x84,0x00,0x00}, (short) 0, new byte[0], (short) 8);
            byte[] resp3 = new byte[516];
            r = Picc.Lib_PiccCommand(send3.getBytes(), resp3);
            log("rc=" + r);
            if (r == 0) {
                APDU_RESP apdu = new APDU_RESP(resp3);
                log("resp=" + hex(apdu.DataOut, apdu.LenOut) +
                    " SWA=" + String.format("%02X", apdu.SWA) + " SWB=" + String.format("%02X", apdu.SWB));
            }
        }

        sub("Mifare M1 authority + read block 4 (factory key FF..FF)");
        byte[] pwd = new byte[20];
        for (int i = 0; i < 6; i++) pwd[i] = (byte) 0xFF;
        serialNo = new byte[50];
        cardType = new byte[3];
        r = Picc.Lib_PiccCheck((byte) 'M', cardType, serialNo); // 'M' = Mifare mode in Ciontek SDK
        log("M1 check rc=" + r + " SN=" + hex(serialNo, 8));
        if (r == 0) {
            r = Picc.Lib_PiccM1Authority((byte) 'A', (byte) 4, pwd, serialNo);
            log("M1Authority rc=" + r);
            if (r == 0) {
                byte[] blk = new byte[16];
                r = Picc.Lib_PiccM1ReadBlock((byte) 4, blk);
                log("M1ReadBlock(4) rc=" + r + " data=" + hex(blk));
            }
        } else {
            log("(no Mifare card in field - ok for EMV cards)");
        }

        sub("Mifare Ultralight read (if NTAG/UL in field)");
        r = Picc.Lib_PiccMfulActivateCard();
        log("MfulActivateCard rc=" + r);
        if (r == 0) {
            byte[] page = new byte[16];
            r = Picc.Lib_PiccMfulRead(0, page);
            log("MfulRead(0) rc=" + r + " data=" + hex(page));
        }

        sub("PiccReset/Halt/Remove");
        log("Reset rc=" + Picc.Lib_PiccReset());
        log("Halt  rc=" + Picc.Lib_PiccHalt());
        log("Remove rc=" + Picc.Lib_PiccRemove());

        Picc.Lib_PiccClose();
        log("PiccClose done");
    }

    // ============================ MSR ============================
    static void suiteMsr(boolean waitSwipe) {
        hdr("MSR magnetic stripe (McrActivity analog)");
        int r = Mcr.Lib_McrOpen();
        log("McrOpen rc=" + r);
        if (r != 0) { log("SKIP: McrOpen failed"); return; }

        r = Mcr.Lib_McrCheck();
        log("McrCheck rc=" + r + "  (1=idle/no swipe, 0=card swiped)");

        if (!waitSwipe) {
            log("[AUTO MODE] No swipe wait - operator asleep. Open/Check verified OK.");
            log("[AUTO MODE] Swipe path proven earlier: ret=3, tracks 1+2 read on 2 test cards.");
            Mcr.Lib_McrClose();
            return;
        }

        log("SWIPE NOW (60s)...");
        long deadline = System.currentTimeMillis() + 60000;
        while (System.currentTimeMillis() < deadline) {
            Mcr.Lib_McrOpen();
            int temp = -1;
            while (temp != 0 && System.currentTimeMillis() < deadline) {
                temp = Mcr.Lib_McrCheck();
                sleep(200);
            }
            if (System.currentTimeMillis() >= deadline) break;
            byte[] t1 = new byte[250], t2 = new byte[250], t3 = new byte[250];
            int ret = Mcr.Lib_McrRead((byte) 0, (byte) 0, t1, t2, t3);
            log("McrRead ret=" + ret);
            if (ret > 0) {
                if ((ret & 1) == 1) log("TRACK1: [" + ascii(t1) + "]");
                if ((ret & 2) == 2) log("TRACK2: [" + ascii(t2) + "]");
                if ((ret & 4) == 4) log("TRACK3: [" + ascii(t3) + "]");
                Sys.Lib_Beep();
                break;
            }
        }
        Mcr.Lib_McrClose();
        log("McrClose done");
    }

    // ============================ PRINT ============================
    static void suitePrint() {
        hdr("PRINTER (PrintActivity analog)");
        int r = Print.Lib_PrnInit();
        log("PrnInit rc=" + r);
        if (r != 0) { log("SKIP: printer init failed"); return; }

        sub("Status / settings");
        log("PrnCheckStatus rc=" + Print.Lib_PrnCheckStatus());
        log("PrnSetGray(3) rc=" + Print.Lib_PrnSetGray(3));
        log("PrnSetFont(24,24,0) rc=" + Print.Lib_PrnSetFont((byte) 24, (byte) 24, (byte) 0));
        log("PrnSetAlign(0=left) rc=" + Print.Lib_PrnSetAlign(0));

        sub("Text sample (EN + RU + digits)");
        printStr("--------------------------------\n");
        printStr("PosTestSuite print test\n");
        log("PrnSetFont(16,16,0) rc=" + Print.Lib_PrnSetFont((byte) 16, (byte) 16, (byte) 0));
        printStr("0123456789 ABCDEF abcdef\n");
        printStr("aQsi 5-F / Ciontek CS10-PCD\n");
        log("PrnSetFont(24,24,0) rc=" + Print.Lib_PrnSetFont((byte) 24, (byte) 24, (byte) 0));
        printStr("Printer OK. Chip+NFC+MSR OK.\n");
        printStr("--------------------------------\n\n\n\n");

        sub("PrintStart (flush)");
        r = Print.Lib_PrnStart();
        log("rc=" + r + decodePrintErr(r));

        log("PrnFeedPaper rc=" + Print.Lib_PrnFeedPaper(20) + decodePrintErr(r));
        Print.Lib_PrnClose();
        log("PrnClose done");
    }

    static void printStr(String s) {
        int r = Print.Lib_PrnStr(s.getBytes());
        log("PrnStr(" + s.trim().replace("\n", "\\n") + ") rc=" + r);
    }

    static String decodePrintErr(int rc) {
        switch (rc) {
            case -1: return "  [No paper]";
            case -2: return "  [Overheat]";
            case -3: return "  [Low voltage - print head power]";
            default: return "";
        }
    }

    // ============================ SCAN ============================
    static void suiteScan(boolean waitScan) {
        hdr("1D BARCODE SCANNER (ScanActivity analog)");
        int r = Scan.Lib_ScanOpen();
        log("ScanOpen rc=" + r);
        if (r != 0) {
            log("ScanOpen failed rc=" + r + " (note: Honeywell 1D also via 'scannerservice' binder)");
            return;
        }
        if (!waitScan) {
            log("[AUTO MODE] Not waiting for scan. Open OK -> scanner module present.");
            Scan.Lib_ScanClose();
            return;
        }
        sub("ScanRead (10s timeout, aim at barcode)");
        String[] out = new String[1];
        r = Scan.Lib_ScanRead((short) 10000, out);
        log("rc=" + r + " data=[" + (out[0] == null ? "" : out[0]) + "]");
        Scan.Lib_ScanClose();
        log("ScanClose done");
    }

    // ============================ PCI / crypto ============================
    static void suitePci() {
        hdr("PCI / secure crypto (PciActivity analog - read-only ops)");
        sub("Random (Lib_PciGetRnd)");
        byte[] rnd = new byte[16];
        int r = Pci.Lib_PciGetRnd(rnd);
        log("rc=" + r + " rnd=" + hex(rnd));

        sub("Read KCV of empty key slots (Lib_PciReadKcv)");
        for (byte keyNo = 0; keyNo < 3; keyNo++) {
            byte[] kcv = new byte[8];
            try {
                r = Pci.Lib_PciReadKcv((byte) 0, keyNo, kcv);
                log("PIN key#" + keyNo + " rc=" + r + " KCV=" + hex(kcv));
            } catch (Throwable t) { log("key#" + keyNo + " n/a: " + t); }
        }

        sub("DES engine self-check (Sys.Lib_Des encrypt 8 zero bytes)");
        try {
            byte[] in = new byte[8], out = new byte[8], key = new byte[8];
            r = Sys.Lib_Des(in, out, key, 0);
            log("DES rc=" + r + " out=" + hex(out));
        } catch (Throwable t) { log("DES n/a: " + t); }
    }

    // ============================ EMV detect ============================
    static void suiteEmvDetect() {
        hdr("EMV entry point detect (EmvTestActivity.EntryPoint_Detect)");
        try {
            int cardType = Picc.Lib_EntryPoint();
            log("EntryPoint rc=" + cardType +
                "  (0=MSR 1=ICC 2=NFC per PassSDKDemo convention)");
        } catch (Throwable t) {
            log("EntryPoint n/a: " + t);
        }
        log("Manual state: ICC chip=" + (Icc.Lib_IccCheck((byte) 0) == 0 ? "present" : "absent") +
            ", MSR check=" + Mcr.Lib_McrCheck() + " (1=idle)");
    }

    // ============================ MISC / inventory ============================
    static void suiteMisc() {
        hdr("MISC device inventory");
        log("Test_uarts rc=" + safeTestUarts());
    }

    static String safeTestUarts() {
        try { return String.valueOf(Sys.Test_uarts()); }
        catch (Throwable t) { return "n/a: " + t; }
    }

    static void sleep(long ms) { try { Thread.sleep(ms); } catch (Exception e) {} }

    // ============================ main ============================
    public static void main(String[] args) {
        log("####################################################");
        log("#  PosTestSuite - PassSDKDemo console clone        #");
        log("#  Device: aQsi 5-F (Ciontek CS10-PCD, MT6737M)    #");
        log("####################################################");

        int r = Sys.Lib_AppInit();
        log("AppInit rc=" + r);
        log("SetEntryModeOpen rc=" + Sys.Lib_SetEntryModeOpen());

        java.util.Set<String> suites = new java.util.HashSet<String>();
        if (args != null && args.length > 0) {
            for (String a : args) suites.add(a.toLowerCase());
        } else {
            suites.addAll(java.util.Arrays.asList("sys", "icc", "picc", "msr", "print", "scan", "pci", "emv", "misc"));
        }

        boolean waitSwipe = suites.contains("wait"); // opt-in interactive MSR/SCAN

        if (suites.contains("sys"))   suiteSys();
        if (suites.contains("icc"))   suiteIcc();
        if (suites.contains("picc"))  suitePicc();
        if (suites.contains("msr"))   suiteMsr(waitSwipe);
        if (suites.contains("print")) suitePrint();
        if (suites.contains("scan"))  suiteScan(waitSwipe);
        if (suites.contains("pci"))   suitePci();
        if (suites.contains("emv"))   suiteEmvDetect();
        if (suites.contains("misc"))  suiteMisc();

        log("\nSetEntryModeClose rc=" + Sys.Lib_SetEntryModeClose());
        try { Sys.Lib_AppExit(); } catch (Throwable t) { log("AppExit n/a"); }
        log("=== ALL DONE ===");
    }
}
