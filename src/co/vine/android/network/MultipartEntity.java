package co.vine.android.network;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import co.vine.android.util.Util;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.message.BasicHeader;

public class MultipartEntity extends AbstractHttpEntity
{
  public static final String BOUNDARY = "--vineaADFASDFADSFAFD";
  public static final String BOUNDARY_NAME = "vineaADFASDFADSFAFD";
  private static final int BUFF_SIZE = 4096;
  public static final String CRLF = "\r\n";
  public static final String DASH_DASH = "--";
  private static final String UTF8 = "UTF-8";
  private int mApproxStreamLength;
  private final Context mContext;
  private final ArrayList<Entity> mEntities;
  private int mLength;
  private final ProgressListener mListener;

  public MultipartEntity(Context paramContext, ProgressListener paramProgressListener)
  {
    this.mListener = paramProgressListener;
    this.contentType = new BasicHeader("Content-Type", "multipart/form-data; boundary=vineaADFASDFADSFAFD");
    this.mEntities = new ArrayList();
    this.mContext = paramContext.getApplicationContext();
  }

  public void addFile(String paramString1, String paramString2, Uri paramUri)
    throws IOException
  {
    byte[] arrayOfByte1 = ("--vineaADFASDFADSFAFD" + "\r\n" + "Content-Disposition: form-data; name=\"" + paramString1 + "\"; filename=\"" + paramString2 + "\"" + "\r\n" + "Content-Type: image/jpeg" + "\r\n" + "Content-Transfer-Encoding: binary" + "\r\n" + "\r\n").getBytes("UTF-8");
    byte[] arrayOfByte2 = "\r\n".getBytes("UTF-8");
    ArrayList localArrayList = this.mEntities;
    localArrayList.add(new ByteArrayEntity(arrayOfByte1));
    localArrayList.add(new UriEntity(this.mContext, paramUri));
    localArrayList.add(new ByteArrayEntity(arrayOfByte2));
    this.mApproxStreamLength = ((int)(this.mApproxStreamLength + (1024.0F * Util.getFileSize(this.mContext, paramUri) + arrayOfByte1.length + arrayOfByte2.length)));
  }

  public void addString(String paramString1, String paramString2)
  {
    byte[] arrayOfByte = ("--vineaADFASDFADSFAFD" + "\r\n" + "Content-Disposition: form-data; name=\"" + paramString1 + "\"" + "\r\n" + "\r\n" + paramString2 + "\r\n").getBytes();
    this.mApproxStreamLength += arrayOfByte.length;
    this.mLength += arrayOfByte.length;
    this.mEntities.add(new ByteArrayEntity(arrayOfByte));
  }

  public void end()
    throws IOException
  {
    this.mEntities.add(new ByteArrayEntity("--vineaADFASDFADSFAFD--\r\n".getBytes("UTF-8")));
  }

  public InputStream getContent()
    throws IOException
  {
    return new MultipartInputStream(this.mEntities);
  }

  public long getContentLength()
  {
    return this.mLength;
  }

  public boolean isRepeatable()
  {
    return true;
  }

  public boolean isStreaming()
  {
    return false;
  }

  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    CountingOutputStream localCountingOutputStream = new CountingOutputStream(paramOutputStream, this.mApproxStreamLength, this.mListener);
    Iterator localIterator = this.mEntities.iterator();
    while (localIterator.hasNext())
      ((Entity)localIterator.next()).writeTo(localCountingOutputStream);
  }

  public static class ByteArrayEntity
    implements MultipartEntity.Entity
  {
    private final byte[] mValue;

    public ByteArrayEntity(byte[] paramArrayOfByte)
    {
      this.mValue = paramArrayOfByte;
    }

    public InputStream getInputStream()
      throws IOException
    {
      return new ByteArrayInputStream(this.mValue);
    }

    public void writeTo(OutputStream paramOutputStream)
      throws IOException
    {
      paramOutputStream.write(this.mValue);
    }
  }

  public static abstract interface Entity
  {
    public abstract InputStream getInputStream()
      throws IOException;

    public abstract void writeTo(OutputStream paramOutputStream)
      throws IOException;
  }

  public static class UriEntity
    implements MultipartEntity.Entity
  {
    private final Context mContext;
    private final Uri mUri;

    public UriEntity(Context paramContext, Uri paramUri)
    {
      this.mUri = paramUri;
      this.mContext = paramContext;
    }

    public InputStream getInputStream()
      throws IOException
    {
      return this.mContext.getContentResolver().openInputStream(this.mUri);
    }

    public void writeTo(OutputStream paramOutputStream)
      throws IOException
    {
      InputStream localInputStream = this.mContext.getContentResolver().openInputStream(this.mUri);
      byte[] arrayOfByte = new byte[4096];
      while (true)
      {
        int i = localInputStream.read(arrayOfByte);
        if (i <= 0)
          break;
        paramOutputStream.write(arrayOfByte, 0, i);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.MultipartEntity
 * JD-Core Version:    0.6.2
 */