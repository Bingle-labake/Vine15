package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.Schema.Field.Order;
import com.flurry.org.apache.avro.generic.GenericDatumReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class BinaryData
{
  private static final ThreadLocal<Decoders> DECODERS = new ThreadLocal()
  {
    protected BinaryData.Decoders initialValue()
    {
      return new BinaryData.Decoders();
    }
  };
  private static final ThreadLocal<HashData> HASH_DATA = new ThreadLocal()
  {
    protected BinaryData.HashData initialValue()
    {
      return new BinaryData.HashData();
    }
  };

  private static int compare(Decoders paramDecoders, Schema paramSchema)
    throws IOException
  {
    BinaryDecoder localBinaryDecoder1 = paramDecoders.d1;
    BinaryDecoder localBinaryDecoder2 = paramDecoders.d2;
    switch (3.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new AvroRuntimeException("Unexpected schema to compare!");
    case 1:
      Iterator localIterator = paramSchema.getFields().iterator();
      while (localIterator.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator.next();
        if (localField.order() == Schema.Field.Order.IGNORE)
        {
          GenericDatumReader.skip(localField.schema(), localBinaryDecoder1);
          GenericDatumReader.skip(localField.schema(), localBinaryDecoder2);
        }
        else
        {
          int i6 = compare(paramDecoders, localField.schema());
          if (i6 != 0)
          {
            if (localField.order() != Schema.Field.Order.DESCENDING);
            while (true)
            {
              return i6;
              i6 = -i6;
            }
          }
        }
      }
      return 0;
    case 2:
    case 3:
      int i4 = localBinaryDecoder1.readInt();
      int i5 = localBinaryDecoder2.readInt();
      if (i4 == i5)
        return 0;
      if (i4 > i5)
        return 1;
      return -1;
    case 4:
      long l7 = localBinaryDecoder1.readLong();
      long l8 = localBinaryDecoder2.readLong();
      if (l7 == l8)
        return 0;
      if (l7 > l8)
        return 1;
      return -1;
    case 5:
      long l1 = 0L;
      long l2 = 0L;
      long l3 = 0L;
      long l4 = 0L;
      long l5 = 0L;
      if (l2 == 0L)
      {
        l2 = localBinaryDecoder1.readLong();
        if (l2 < 0L)
        {
          l2 = -l2;
          localBinaryDecoder1.readLong();
        }
        l4 += l2;
      }
      if (l3 == 0L)
      {
        l3 = localBinaryDecoder2.readLong();
        if (l3 < 0L)
        {
          l3 = -l3;
          localBinaryDecoder2.readLong();
        }
        l5 += l3;
      }
      if ((l2 == 0L) || (l3 == 0L))
      {
        if (l4 == l5)
          return 0;
        if (l4 > l5)
          return 1;
        return -1;
      }
      long l6 = Math.min(l4, l5);
      while (l1 < l6)
      {
        int i3 = compare(paramDecoders, paramSchema.getElementType());
        if (i3 != 0)
          return i3;
        l1 += 1L;
        l2 -= 1L;
        l3 -= 1L;
      }
    case 6:
      throw new AvroRuntimeException("Can't compare maps!");
    case 7:
      int i1 = localBinaryDecoder1.readInt();
      int i2 = localBinaryDecoder2.readInt();
      if (i1 == i2)
        return compare(paramDecoders, (Schema)paramSchema.getTypes().get(i1));
      return i1 - i2;
    case 8:
      int m = paramSchema.getFixedSize();
      int n = compareBytes(paramDecoders.b1.getBuf(), paramDecoders.b1.getPos(), m, paramDecoders.b2.getBuf(), paramDecoders.b2.getPos(), m);
      paramDecoders.d1.skipFixed(m);
      paramDecoders.d2.skipFixed(m);
      return n;
    case 9:
    case 10:
      int i = localBinaryDecoder1.readInt();
      int j = localBinaryDecoder2.readInt();
      int k = compareBytes(paramDecoders.b1.getBuf(), paramDecoders.b1.getPos(), i, paramDecoders.b2.getBuf(), paramDecoders.b2.getPos(), j);
      paramDecoders.d1.skipFixed(i);
      paramDecoders.d2.skipFixed(j);
      return k;
    case 11:
      float f1 = localBinaryDecoder1.readFloat();
      float f2 = localBinaryDecoder2.readFloat();
      if (f1 == f2)
        return 0;
      if (f1 > f2)
        return 1;
      return -1;
    case 12:
      double d1 = localBinaryDecoder1.readDouble();
      double d2 = localBinaryDecoder2.readDouble();
      if (d1 == d2)
        return 0;
      if (d1 > d2)
        return 1;
      return -1;
    case 13:
      boolean bool = localBinaryDecoder1.readBoolean();
      if (bool == localBinaryDecoder2.readBoolean())
        return 0;
      if (bool)
        return 1;
      return -1;
    case 14:
    }
    return 0;
  }

  public static int compare(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3, int paramInt4, Schema paramSchema)
  {
    Decoders localDecoders = (Decoders)DECODERS.get();
    localDecoders.set(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3, paramInt4);
    try
    {
      int i = compare(localDecoders, paramSchema);
      return i;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  public static int compare(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2, Schema paramSchema)
  {
    return compare(paramArrayOfByte1, paramInt1, paramArrayOfByte1.length - paramInt1, paramArrayOfByte2, paramInt2, paramArrayOfByte2.length - paramInt2, paramSchema);
  }

  public static int compareBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3, int paramInt4)
  {
    int i = paramInt1 + paramInt2;
    int j = paramInt3 + paramInt4;
    int k = paramInt1;
    for (int m = paramInt3; (k < i) && (m < j); m++)
    {
      int n = 0xFF & paramArrayOfByte1[k];
      int i1 = 0xFF & paramArrayOfByte2[m];
      if (n != i1)
        return n - i1;
      k++;
    }
    return paramInt2 - paramInt4;
  }

  public static int encodeBoolean(boolean paramBoolean, byte[] paramArrayOfByte, int paramInt)
  {
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      paramArrayOfByte[paramInt] = i;
      return 1;
    }
  }

  public static int encodeDouble(double paramDouble, byte[] paramArrayOfByte, int paramInt)
  {
    long l = Double.doubleToRawLongBits(paramDouble);
    int i = (int)(l & 0xFFFFFFFF);
    int j = (int)(0xFFFFFFFF & l >>> 32);
    paramArrayOfByte[paramInt] = ((byte)(i & 0xFF));
    paramArrayOfByte[(paramInt + 4)] = ((byte)(j & 0xFF));
    paramArrayOfByte[(paramInt + 5)] = ((byte)(0xFF & j >>> 8));
    paramArrayOfByte[(paramInt + 1)] = ((byte)(0xFF & i >>> 8));
    paramArrayOfByte[(paramInt + 2)] = ((byte)(0xFF & i >>> 16));
    paramArrayOfByte[(paramInt + 6)] = ((byte)(0xFF & j >>> 16));
    paramArrayOfByte[(paramInt + 7)] = ((byte)(0xFF & j >>> 24));
    paramArrayOfByte[(paramInt + 3)] = ((byte)(0xFF & i >>> 24));
    return 8;
  }

  public static int encodeFloat(float paramFloat, byte[] paramArrayOfByte, int paramInt)
  {
    int i = Float.floatToRawIntBits(paramFloat);
    paramArrayOfByte[paramInt] = ((byte)(i & 0xFF));
    int j = 1 + 1;
    paramArrayOfByte[(paramInt + 1)] = ((byte)(0xFF & i >>> 8));
    int k = j + 1;
    paramArrayOfByte[(paramInt + 2)] = ((byte)(0xFF & i >>> 16));
    (k + 1);
    paramArrayOfByte[(paramInt + 3)] = ((byte)(0xFF & i >>> 24));
    return 4;
  }

  public static int encodeInt(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    int i = paramInt1 << 1 ^ paramInt1 >> 31;
    int j = paramInt2;
    int m;
    if ((i & 0xFFFFFF80) != 0)
    {
      m = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = ((byte)(0xFF & (i | 0x80)));
      i >>>= 7;
      if (i <= 127)
        break label147;
      paramInt2 = m + 1;
      paramArrayOfByte[m] = ((byte)(0xFF & (i | 0x80)));
      i >>>= 7;
      if (i > 127)
      {
        m = paramInt2 + 1;
        paramArrayOfByte[paramInt2] = ((byte)(0xFF & (i | 0x80)));
        i >>>= 7;
        if (i <= 127)
          break label147;
        paramInt2 = m + 1;
        paramArrayOfByte[m] = ((byte)(0xFF & (i | 0x80)));
        i >>>= 7;
      }
    }
    while (true)
    {
      int k = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = ((byte)i);
      return k - j;
      label147: paramInt2 = m;
    }
  }

  public static int encodeLong(long paramLong, byte[] paramArrayOfByte, int paramInt)
  {
    long l = paramLong << 1 ^ paramLong >> 63;
    int i = paramInt;
    int k;
    int m;
    if ((0xFFFFFF80 & l) != 0L)
    {
      k = paramInt + 1;
      paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & (0x80 | l)));
      l >>>= 7;
      if (l <= 127L)
        break label364;
      paramInt = k + 1;
      paramArrayOfByte[k] = ((byte)(int)(0xFF & (0x80 | l)));
      l >>>= 7;
      if (l > 127L)
      {
        k = paramInt + 1;
        paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & (0x80 | l)));
        l >>>= 7;
        if (l <= 127L)
          break label364;
        paramInt = k + 1;
        paramArrayOfByte[k] = ((byte)(int)(0xFF & (0x80 | l)));
        l >>>= 7;
        if (l > 127L)
        {
          k = paramInt + 1;
          paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & (0x80 | l)));
          l >>>= 7;
          if (l <= 127L)
            break label364;
          paramInt = k + 1;
          paramArrayOfByte[k] = ((byte)(int)(0xFF & (0x80 | l)));
          l >>>= 7;
          if (l > 127L)
          {
            k = paramInt + 1;
            paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & (0x80 | l)));
            l >>>= 7;
            if (l <= 127L)
              break label364;
            paramInt = k + 1;
            paramArrayOfByte[k] = ((byte)(int)(0xFF & (0x80 | l)));
            l >>>= 7;
            if (l > 127L)
            {
              m = paramInt + 1;
              paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & (0x80 | l)));
              l >>>= 7;
            }
          }
        }
      }
    }
    label364: for (paramInt = m; ; paramInt = k)
    {
      int j = paramInt + 1;
      paramArrayOfByte[paramInt] = ((byte)(int)l);
      return j - i;
    }
  }

  private static int hashBytes(int paramInt1, HashData paramHashData, int paramInt2, boolean paramBoolean)
    throws IOException
  {
    int i = paramInt1;
    byte[] arrayOfByte = paramHashData.bytes.getBuf();
    int j = paramHashData.bytes.getPos();
    int k = j + paramInt2;
    if (paramBoolean)
      for (int n = k - 1; n >= j; n--)
        i = i * 31 + arrayOfByte[n];
    for (int m = j; m < k; m++)
      i = i * 31 + arrayOfByte[m];
    paramHashData.decoder.skipFixed(paramInt2);
    return i;
  }

  private static int hashCode(HashData paramHashData, Schema paramSchema)
    throws IOException
  {
    BinaryDecoder localBinaryDecoder = paramHashData.decoder;
    int i = 3.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()];
    int j = 0;
    Iterator localIterator;
    switch (i)
    {
    default:
      throw new AvroRuntimeException("Unexpected schema to hashCode!");
    case 1:
      j = 1;
      localIterator = paramSchema.getFields().iterator();
    case 2:
    case 3:
      while (localIterator.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator.next();
        if (localField.order() == Schema.Field.Order.IGNORE)
        {
          GenericDatumReader.skip(localField.schema(), localBinaryDecoder);
        }
        else
        {
          j = j * 31 + hashCode(paramHashData, localField.schema());
          continue;
          j = localBinaryDecoder.readInt();
        }
      }
    case 14:
      return j;
    case 11:
      return Float.floatToIntBits(localBinaryDecoder.readFloat());
    case 4:
      long l4 = localBinaryDecoder.readLong();
      return (int)(l4 ^ l4 >>> 32);
    case 12:
      long l3 = Double.doubleToLongBits(localBinaryDecoder.readDouble());
      return (int)(l3 ^ l3 >>> 32);
    case 5:
      Schema localSchema = paramSchema.getElementType();
      j = 1;
      for (long l1 = localBinaryDecoder.readArrayStart(); l1 != 0L; l1 = localBinaryDecoder.arrayNext())
        for (long l2 = 0L; l2 < l1; l2 += 1L)
          j = j * 31 + hashCode(paramHashData, localSchema);
    case 6:
      throw new AvroRuntimeException("Can't hashCode maps!");
    case 7:
      return hashCode(paramHashData, (Schema)paramSchema.getTypes().get(localBinaryDecoder.readInt()));
    case 8:
      return hashBytes(1, paramHashData, paramSchema.getFixedSize(), false);
    case 9:
      return hashBytes(0, paramHashData, localBinaryDecoder.readInt(), false);
    case 10:
      return hashBytes(1, paramHashData, localBinaryDecoder.readInt(), true);
    case 13:
    }
    if (localBinaryDecoder.readBoolean());
    for (int k = 1231; ; k = 1237)
      return k;
  }

  public static int hashCode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, Schema paramSchema)
  {
    HashData localHashData = (HashData)HASH_DATA.get();
    localHashData.set(paramArrayOfByte, paramInt1, paramInt2);
    try
    {
      int i = hashCode(localHashData, paramSchema);
      return i;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  public static int skipLong(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramInt + 1;
    int j = paramArrayOfByte[paramInt];
    while ((j & 0x80) != 0)
    {
      int k = i + 1;
      j = paramArrayOfByte[i];
      i = k;
    }
    return i;
  }

  private static class Decoders
  {
    private final BinaryDecoder.BufferAccessor b1 = this.d1.getBufferAccessor();
    private final BinaryDecoder.BufferAccessor b2 = this.d2.getBufferAccessor();
    private final BinaryDecoder d1 = new BinaryDecoder(new byte[0], 0, 0);
    private final BinaryDecoder d2 = new BinaryDecoder(new byte[0], 0, 0);

    public void set(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3, int paramInt4)
    {
      this.d1.configure(paramArrayOfByte1, paramInt1, paramInt2);
      this.d2.configure(paramArrayOfByte2, paramInt3, paramInt4);
    }
  }

  private static class HashData
  {
    private final BinaryDecoder.BufferAccessor bytes = this.decoder.getBufferAccessor();
    private final BinaryDecoder decoder = new BinaryDecoder(new byte[0], 0, 0);

    public void set(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      this.decoder.configure(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.BinaryData
 * JD-Core Version:    0.6.2
 */