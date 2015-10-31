package co.vine.android.recorder;

public class FFmpegInvoke
{
  private String mPath;

  public FFmpegInvoke(String paramString)
  {
    this.mPath = paramString;
  }

  private native int run(String paramString, String[] paramArrayOfString);

  public native void YUVtoRBG(int[] paramArrayOfInt, byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public int run(String[] paramArrayOfString)
  {
    return run(this.mPath, paramArrayOfString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.FFmpegInvoke
 * JD-Core Version:    0.6.2
 */