package vpos.apipackage;

/** JNI class from device libPosApi.so (Ciontek CS10-PCD). */
public class Sys {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_AppInit();
    public static native int Lib_AppExit();
    public static native int Lib_Beep();
    public static native int Lib_Des(byte[] in, byte[] out, byte[] key, int mode);
    public static native int Lib_GetTime(byte[] out);
    public static native int Lib_GetVersion(byte[] out);
    public static native int Lib_KeyEvent();
    public static native int Lib_LedCtrl(byte n, byte st);
    public static native int Lib_LogSwitch(int i);
    public static native int Lib_PowerOff();
    public static native int Lib_PowerOn();
    public static native int Lib_ReadChipID(byte[] out, int len);
    public static native int Lib_ReadSN(byte[] out);
    public static native int Lib_RecvBytes(byte[] out, int len, int timeout);
    public static native int Lib_RecvPacket(byte[] out, int[] len, int timeout);
    public static native int Lib_RsaDecrypt(byte[] in, int inLen, byte[] key, byte[] out, int outLen, byte[] iv);
    public static native int Lib_RsaEncrypt(byte[] in, int inLen, byte[] key, int keyLen, byte[] out);
    public static native int Lib_SecuTamperBit(byte b1, byte b2);
    public static native int Lib_SendBytes(byte[] in, int len);
    public static native int Lib_SendPacket(byte[] in, int len, byte b1, byte b2);
    public static native int Lib_SetEntryMode(byte mode);
    public static native int Lib_SetEntryModeClose();
    public static native int Lib_SetEntryModeOpen();
    public static native int Lib_SetLed(byte led, byte state);
    public static native int Lib_SetLinPixelDis(char c);
    public static native int Lib_SetTime(byte[] in);
    public static native int Lib_Test(byte b);
    public static native int Lib_Update();
    public static native int Lib_UpdateBoot();
    public static native int Lib_WriteSN(byte[] in);
    public static native int Print_Black();
    public static native int Print_Time();
    public static native int Test_uarts();
}
