package vpos.apipackage;

public class Picc {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_EntryPoint();
    public static native int Lib_PiccApduCmd(byte[] in, short inLen, byte[] out, byte[] outLen);
    public static native int Lib_PiccCheck(byte mode, byte[] cardType, byte[] serialNo);
    public static native int Lib_PiccClose();
    public static native int Lib_PiccCommand(byte[] apduSend, byte[] apduResp);
    public static native int Lib_PiccHalt();
    public static native int Lib_PiccM1Authority(byte type, byte blkNo, byte[] pwd, byte[] serialNo);
    public static native int Lib_PiccM1Operate(byte type, byte blkNo, byte[] value, byte updateBlkNo);
    public static native int Lib_PiccM1ReadBlock(byte blkNo, byte[] blkValue);
    public static native int Lib_PiccM1ReadValue(int blkNo, byte[] value);
    public static native int Lib_PiccM1WriteBlock(byte blkNo, byte[] blkValue);
    public static native int Lib_PiccM1WriteValue(int blkNo, byte[] value);
    public static native int Lib_PiccMfulActivateCard();
    public static native int Lib_PiccMfulRead(int page, byte[] out);
    public static native int Lib_PiccMfulWrite(int page, byte[] in);
    public static native int Lib_PiccMfulReadCnt(int page, byte[] out);
    public static native int Lib_PiccMfulReadSign(int page, byte[] out);
    public static native int Lib_PiccNfc(byte[] nfcDataLen, byte[] technology, byte[] uid, byte[] ndefMsg);
    public static native int Lib_PiccOpen();
    public static native int Lib_PiccPoll(byte b, byte[] cardType, byte[] uid, byte[] uidLen, byte[] ats, byte[] atsLen, byte[] sak);
    public static native int Lib_PiccPolling(byte[] cardType, byte[] uid, byte[] uidLen, byte[] ats, byte[] atsLen, byte[] sak);
    public static native int Lib_PiccRemove();
    public static native int Lib_PiccReset();
}
