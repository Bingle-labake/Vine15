package com.flurry.org.codehaus.jackson.map.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public final class ArrayBuilders
{
  BooleanBuilder _booleanBuilder = null;
  ByteBuilder _byteBuilder = null;
  DoubleBuilder _doubleBuilder = null;
  FloatBuilder _floatBuilder = null;
  IntBuilder _intBuilder = null;
  LongBuilder _longBuilder = null;
  ShortBuilder _shortBuilder = null;

  public static <T> List<T> addToList(List<T> paramList, T paramT)
  {
    if (paramList == null)
      paramList = new ArrayList();
    paramList.add(paramT);
    return paramList;
  }

  public static <T> Iterable<T> arrayAsIterable(T[] paramArrayOfT)
  {
    return new ArrayIterator(paramArrayOfT);
  }

  public static <T> Iterator<T> arrayAsIterator(T[] paramArrayOfT)
  {
    return new ArrayIterator(paramArrayOfT);
  }

  public static <T> HashSet<T> arrayToSet(T[] paramArrayOfT)
  {
    HashSet localHashSet = new HashSet();
    if (paramArrayOfT != null)
    {
      int i = paramArrayOfT.length;
      for (int j = 0; j < i; j++)
        localHashSet.add(paramArrayOfT[j]);
    }
    return localHashSet;
  }

  public static <T> T[] insertInList(T[] paramArrayOfT, T paramT)
  {
    int i = paramArrayOfT.length;
    Object[] arrayOfObject = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), i + 1);
    if (i > 0)
      System.arraycopy(paramArrayOfT, 0, arrayOfObject, 1, i);
    arrayOfObject[0] = paramT;
    return arrayOfObject;
  }

  public static <T> T[] insertInListNoDup(T[] paramArrayOfT, T paramT)
  {
    int i = paramArrayOfT.length;
    for (int j = 0; j < i; j++)
      if (paramArrayOfT[j] == paramT)
      {
        if (j == 0)
          return paramArrayOfT;
        Object[] arrayOfObject2 = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), i);
        System.arraycopy(paramArrayOfT, 0, arrayOfObject2, 1, j);
        paramArrayOfT[0] = paramT;
        return arrayOfObject2;
      }
    Object[] arrayOfObject1 = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), i + 1);
    if (i > 0)
      System.arraycopy(paramArrayOfT, 0, arrayOfObject1, 1, i);
    arrayOfObject1[0] = paramT;
    return arrayOfObject1;
  }

  public BooleanBuilder getBooleanBuilder()
  {
    if (this._booleanBuilder == null)
      this._booleanBuilder = new BooleanBuilder();
    return this._booleanBuilder;
  }

  public ByteBuilder getByteBuilder()
  {
    if (this._byteBuilder == null)
      this._byteBuilder = new ByteBuilder();
    return this._byteBuilder;
  }

  public DoubleBuilder getDoubleBuilder()
  {
    if (this._doubleBuilder == null)
      this._doubleBuilder = new DoubleBuilder();
    return this._doubleBuilder;
  }

  public FloatBuilder getFloatBuilder()
  {
    if (this._floatBuilder == null)
      this._floatBuilder = new FloatBuilder();
    return this._floatBuilder;
  }

  public IntBuilder getIntBuilder()
  {
    if (this._intBuilder == null)
      this._intBuilder = new IntBuilder();
    return this._intBuilder;
  }

  public LongBuilder getLongBuilder()
  {
    if (this._longBuilder == null)
      this._longBuilder = new LongBuilder();
    return this._longBuilder;
  }

  public ShortBuilder getShortBuilder()
  {
    if (this._shortBuilder == null)
      this._shortBuilder = new ShortBuilder();
    return this._shortBuilder;
  }

  private static final class ArrayIterator<T>
    implements Iterator<T>, Iterable<T>
  {
    private final T[] _array;
    private int _index;

    public ArrayIterator(T[] paramArrayOfT)
    {
      this._array = paramArrayOfT;
      this._index = 0;
    }

    public boolean hasNext()
    {
      return this._index < this._array.length;
    }

    public Iterator<T> iterator()
    {
      return this;
    }

    public T next()
    {
      if (this._index >= this._array.length)
        throw new NoSuchElementException();
      Object[] arrayOfObject = this._array;
      int i = this._index;
      this._index = (i + 1);
      return arrayOfObject[i];
    }

    public void remove()
    {
      throw new UnsupportedOperationException();
    }
  }

  public static final class BooleanBuilder extends PrimitiveArrayBuilder<boolean[]>
  {
    public final boolean[] _constructArray(int paramInt)
    {
      return new boolean[paramInt];
    }
  }

  public static final class ByteBuilder extends PrimitiveArrayBuilder<byte[]>
  {
    public final byte[] _constructArray(int paramInt)
    {
      return new byte[paramInt];
    }
  }

  public static final class DoubleBuilder extends PrimitiveArrayBuilder<double[]>
  {
    public final double[] _constructArray(int paramInt)
    {
      return new double[paramInt];
    }
  }

  public static final class FloatBuilder extends PrimitiveArrayBuilder<float[]>
  {
    public final float[] _constructArray(int paramInt)
    {
      return new float[paramInt];
    }
  }

  public static final class IntBuilder extends PrimitiveArrayBuilder<int[]>
  {
    public final int[] _constructArray(int paramInt)
    {
      return new int[paramInt];
    }
  }

  public static final class LongBuilder extends PrimitiveArrayBuilder<long[]>
  {
    public final long[] _constructArray(int paramInt)
    {
      return new long[paramInt];
    }
  }

  public static final class ShortBuilder extends PrimitiveArrayBuilder<short[]>
  {
    public final short[] _constructArray(int paramInt)
    {
      return new short[paramInt];
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.ArrayBuilders
 * JD-Core Version:    0.6.2
 */