package co.vine.android.util;

import java.io.File;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.entity.FileEntity;

public class MeasureOutputStream extends FileEntity
{
  private final VineProgressListener mProgressListener;

  public MeasureOutputStream(File paramFile, String paramString, VineProgressListener paramVineProgressListener)
  {
    super(paramFile, paramString);
    this.mProgressListener = paramVineProgressListener;
  }

  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    super.writeTo(new CountingOutputStream(paramOutputStream, this.mProgressListener));
  }

  public static class CountingOutputStream extends FilterOutputStream
  {
    private final VineProgressEvent mProgressEvent;
    private final VineProgressListener mProgressListener;

    public CountingOutputStream(OutputStream paramOutputStream, VineProgressListener paramVineProgressListener)
    {
      super();
      this.mProgressListener = paramVineProgressListener;
      this.mProgressEvent = new VineProgressEvent(1);
    }

    public void write(int paramInt)
      throws IOException
    {
      this.out.write(paramInt);
      this.mProgressEvent.setBytesTransfered(1);
      if (this.mProgressListener != null)
        this.mProgressListener.progressChanged(this.mProgressEvent);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      this.out.write(paramArrayOfByte, paramInt1, paramInt2);
      this.mProgressEvent.setBytesTransfered(paramInt2);
      if (this.mProgressListener != null)
        this.mProgressListener.progressChanged(this.mProgressEvent);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MeasureOutputStream
 * JD-Core Version:    0.6.2
 */