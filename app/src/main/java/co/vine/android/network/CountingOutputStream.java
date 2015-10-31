package co.vine.android.network;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

class CountingOutputStream extends FilterOutputStream
{
  private final long mChunk;
  private final long mLength;
  private final ProgressListener mListener;
  private long mNext;
  private long mTransferred;

  public CountingOutputStream(OutputStream paramOutputStream, long paramLong, ProgressListener paramProgressListener)
  {
    super(paramOutputStream);
    this.mListener = paramProgressListener;
    this.mLength = (2L * paramLong);
    this.mTransferred = 0L;
    this.mChunk = (this.mLength / 5L);
    this.mNext = this.mChunk;
  }

  public void write(int paramInt)
    throws IOException
  {
    super.write(paramInt);
    this.mTransferred = (1L + this.mTransferred);
    if (this.mTransferred >= this.mNext)
    {
      super.flush();
      if (this.mListener != null)
        this.mListener.onProgress(this.mTransferred, this.mLength);
      this.mNext += this.mChunk;
    }
  }

  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    super.write(paramArrayOfByte, paramInt1, paramInt2);
    this.mTransferred += paramInt2;
    if (this.mTransferred >= this.mNext)
    {
      super.flush();
      if (this.mListener != null)
        this.mListener.onProgress(this.mTransferred, this.mLength);
      this.mNext += this.mChunk;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.CountingOutputStream
 * JD-Core Version:    0.6.2
 */