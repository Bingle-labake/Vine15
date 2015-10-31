package co.vine.android.network;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class MultipartInputStream extends InputStream
{
  private InputStream mCurrStream;
  private final ArrayList<MultipartEntity.Entity> mEntities;
  private int mNextEntity;

  public MultipartInputStream(ArrayList<MultipartEntity.Entity> paramArrayList)
  {
    this.mEntities = paramArrayList;
    this.mNextEntity = 0;
  }

  public void close()
    throws IOException
  {
    if (this.mCurrStream != null)
    {
      this.mCurrStream.close();
      this.mCurrStream = null;
    }
  }

  public int read()
    throws IOException
  {
    byte[] arrayOfByte = new byte[1];
    if (read(arrayOfByte, 0, 1) == 1)
      return arrayOfByte[0];
    return -1;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = 0;
    int j = this.mNextEntity;
    for (InputStream localInputStream = this.mCurrStream; ; localInputStream = null)
    {
      if (i < paramInt2)
      {
        if (localInputStream == null)
        {
          localInputStream = ((MultipartEntity.Entity)this.mEntities.get(j)).getInputStream();
          this.mCurrStream = localInputStream;
        }
        while (true)
        {
          int k = localInputStream.read(paramArrayOfByte, paramInt1 + i, paramInt2 - i);
          if (k == -1)
            break;
          i += k;
        }
        if ((i != paramInt2) && (j != -1 + this.mEntities.size()));
      }
      else
      {
        return i;
      }
      j++;
      this.mNextEntity = j;
      localInputStream.close();
      this.mCurrStream = null;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.MultipartInputStream
 * JD-Core Version:    0.6.2
 */