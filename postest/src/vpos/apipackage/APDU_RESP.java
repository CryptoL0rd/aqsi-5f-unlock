package vpos.apipackage;

/** APDU response parser, matches PassSDKDemo wire format (516 bytes). */
public class APDU_RESP {
    public byte[] DataOut;
    public short LenOut;
    public byte SWA;
    public byte SWB;

    public APDU_RESP(byte[] resp) {
        this.DataOut = new byte[512];
        this.LenOut = (short) (((resp[1] & 255) * 256) + (resp[0] & 255));
        System.arraycopy(resp, 2, this.DataOut, 0, 512);
        this.SWA = resp[514];
        this.SWB = resp[515];
    }
}
