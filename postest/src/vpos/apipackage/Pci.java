package vpos.apipackage;

public class Pci {
    static { System.loadLibrary("PosApi"); }
    public static native int Lib_PciGetRnd(byte[] out);
    public static native int Lib_PciReadKcv(byte keyType, byte keyNo, byte[] kcv);
    public static native int Lib_PciGetTDES(byte[] in, byte[] out);
    public static native int Lib_PciWritePIN_MKey(byte keyNo, byte keyLen, byte[] keyData, byte mode);
    public static native int Lib_PciWriteMAC_MKey(byte keyNo, byte keyLen, byte[] keyData, byte mode);
    public static native int Lib_PciWriteDES_MKey(byte keyNo, byte keyLen, byte[] keyData, byte mode);
}
