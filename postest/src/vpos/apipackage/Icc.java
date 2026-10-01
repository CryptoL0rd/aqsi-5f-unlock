package vpos.apipackage;

public class Icc {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_IccApduCmd(byte slot, byte[] in, short inLen, byte[] out, byte[] outLen);
    public static native int Lib_IccCheck(byte slot);
    public static native int Lib_IccClose(byte slot);
    public static native int Lib_IccCommand(byte slot, byte[] apduSend, byte[] apduResp);
    public static native int Lib_IccDetectSYN(byte slot);
    public static native int Lib_IccDetect_4428(byte slot);
    public static native int Lib_IccOpen(byte slot, byte vccMode, byte[] atr);
    public static native int Lib_IccSelectEtu(byte slot);
}
