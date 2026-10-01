package vpos.apipackage;

public class Mcr {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_McrCheck();
    public static native int Lib_McrClose();
    public static native int Lib_McrOpen();
    public static native int Lib_McrRead(byte keyNo, byte mode, byte[] t1, byte[] t2, byte[] t3);
    public static native int Lib_McrReset();
}
