package vpos.apipackage;

public class Print {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_PrnBmp(byte[] bmp);
    public static native int Lib_PrnCheckStatus();
    public static native int Lib_PrnClose();
    public static native int Lib_PrnContinuous(int level);
    public static native int Lib_PrnConventional(int level);
    public static native int Lib_PrnFeedPaper(int step);
    public static native int Lib_PrnGetFont(byte[] h, byte[] w, byte[] zoom);
    public static native int Lib_PrnInit();
    public static native int Lib_PrnIsCharge(int i);
    public static native int Lib_PrnLogo(byte[] logo);
    public static native int Lib_PrnSetAlign(int align);
    public static native int Lib_PrnSetCharSpace(int i);
    public static native int Lib_PrnSetEnvironment(int a, int b, int c, int d);
    public static native int Lib_PrnSetFont(byte height, byte width, byte zoom);
    public static native int Lib_PrnSetGray(int level);
    public static native int Lib_PrnSetLeftIndent(int i);
    public static native int Lib_PrnSetLeftSpace(int i);
    public static native int Lib_PrnSetLineSpace(int i);
    public static native int Lib_PrnSetSpace(byte x, byte y);
    public static native int Lib_PrnSetSpeed(int i);
    public static native int Lib_PrnSetVoltage(int v);
    public static native int Lib_PrnStart();
    public static native int Lib_PrnStep(int i);
    public static native int Lib_PrnStr(byte[] str);
}
