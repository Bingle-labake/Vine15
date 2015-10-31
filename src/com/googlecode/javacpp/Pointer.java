package com.googlecode.javacpp;

import java.lang.ref.PhantomReference;
import java.lang.ref.ReferenceQueue;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class Pointer
{
  private static final ReferenceQueue<Pointer> referenceQueue = new ReferenceQueue();
  protected long address = 0L;
  protected int capacity = 0;
  private Deallocator deallocator = null;
  protected int limit = 0;
  protected int position = 0;

  public Pointer()
  {
  }

  public Pointer(final Pointer paramPointer)
  {
    if (paramPointer != null)
    {
      this.address = paramPointer.address;
      this.position = paramPointer.position;
      this.limit = paramPointer.limit;
      this.capacity = paramPointer.capacity;
      if (paramPointer.deallocator != null)
        this.deallocator = new Deallocator()
        {
          public void deallocate()
          {
            paramPointer.deallocate();
          }
        };
    }
  }

  public Pointer(final Buffer paramBuffer)
  {
    if (paramBuffer != null)
      allocate(paramBuffer);
    if (!isNull())
    {
      this.position = paramBuffer.position();
      this.limit = paramBuffer.limit();
      this.capacity = paramBuffer.capacity();
      this.deallocator = new Deallocator()
      {
        Buffer bb = paramBuffer;

        public void deallocate()
        {
          this.bb = null;
        }
      };
    }
  }

  private native void allocate(Buffer paramBuffer);

  private native ByteBuffer asDirectBuffer();

  public static void deallocateReferences()
  {
    while (true)
    {
      DeallocatorReference localDeallocatorReference = (DeallocatorReference)referenceQueue.poll();
      if (localDeallocatorReference == null)
        break;
      localDeallocatorReference.clear();
      localDeallocatorReference.remove();
    }
  }

  public static native Pointer memchr(Pointer paramPointer, int paramInt, long paramLong);

  public static native int memcmp(Pointer paramPointer1, Pointer paramPointer2, long paramLong);

  public static native Pointer memcpy(Pointer paramPointer1, Pointer paramPointer2, long paramLong);

  public static native Pointer memmove(Pointer paramPointer1, Pointer paramPointer2, long paramLong);

  public static native Pointer memset(Pointer paramPointer, int paramInt, long paramLong);

  protected static <P extends Pointer> P withDeallocator(P paramP)
  {
    return paramP.deallocator(new CustomDeallocator(paramP));
  }

  public Buffer asBuffer()
  {
    return asByteBuffer();
  }

  public ByteBuffer asByteBuffer()
  {
    if (isNull())
      return null;
    if ((this.limit > 0) && (this.limit < this.position))
      throw new IllegalArgumentException("limit < position: (" + this.limit + " < " + this.position + ")");
    int i = sizeof();
    int j = this.position;
    int k = this.limit;
    this.position = (i * j);
    if (k <= 0);
    for (int m = j + 1; ; m = k)
    {
      this.limit = (m * i);
      ByteBuffer localByteBuffer = asDirectBuffer().order(ByteOrder.nativeOrder());
      this.position = j;
      this.limit = k;
      return localByteBuffer;
    }
  }

  public int capacity()
  {
    return this.capacity;
  }

  public <P extends Pointer> P capacity(int paramInt)
  {
    this.limit = paramInt;
    this.capacity = paramInt;
    return this;
  }

  public void deallocate()
  {
    this.deallocator.deallocate();
    this.address = 0L;
  }

  protected Deallocator deallocator()
  {
    return this.deallocator;
  }

  protected <P extends Pointer> P deallocator(Deallocator paramDeallocator)
  {
    if (this.deallocator != null)
    {
      this.deallocator.deallocate();
      this.deallocator = null;
    }
    deallocateReferences();
    if ((paramDeallocator != null) && (!paramDeallocator.equals(null)))
    {
      this.deallocator = paramDeallocator;
      if (!(paramDeallocator instanceof DeallocatorReference))
        break label59;
    }
    label59: for (DeallocatorReference localDeallocatorReference = (DeallocatorReference)paramDeallocator; ; localDeallocatorReference = new DeallocatorReference(this, paramDeallocator))
    {
      localDeallocatorReference.add();
      return this;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    Pointer localPointer;
    do
    {
      return true;
      if (paramObject == null)
        return isNull();
      if (paramObject.getClass() != getClass())
        return false;
      localPointer = (Pointer)paramObject;
    }
    while ((this.address == localPointer.address) && (this.position == localPointer.position));
    return false;
  }

  public <P extends Pointer> P fill(int paramInt)
  {
    if ((this.limit > 0) && (this.limit < this.position))
      throw new IllegalArgumentException("limit < position: (" + this.limit + " < " + this.position + ")");
    int i = sizeof();
    if (this.limit <= 0);
    for (int j = 1; ; j = this.limit - this.position)
    {
      int k = i * j;
      this.position = (i * this.position);
      memset(this, paramInt, k);
      this.position /= i;
      return this;
    }
  }

  public int hashCode()
  {
    return (int)this.address;
  }

  void init(long paramLong1, int paramInt, long paramLong2)
  {
    this.address = paramLong1;
    this.position = 0;
    this.limit = paramInt;
    this.capacity = paramInt;
    deallocator(new NativeDeallocator(this, paramLong2));
  }

  public boolean isNull()
  {
    return this.address == 0L;
  }

  public int limit()
  {
    return this.limit;
  }

  public <P extends Pointer> P limit(int paramInt)
  {
    this.limit = paramInt;
    return this;
  }

  public int offsetof(String paramString)
  {
    int i = -1;
    try
    {
      Class localClass = getClass();
      if (localClass != Pointer.class)
      {
        int j = Loader.offsetof(localClass, paramString);
        i = j;
      }
      return i;
    }
    catch (NullPointerException localNullPointerException)
    {
    }
    return i;
  }

  public int position()
  {
    return this.position;
  }

  public <P extends Pointer> P position(int paramInt)
  {
    this.position = paramInt;
    return this;
  }

  public <P extends Pointer> P put(Pointer paramPointer)
  {
    if ((paramPointer.limit > 0) && (paramPointer.limit < paramPointer.position))
      throw new IllegalArgumentException("limit < position: (" + paramPointer.limit + " < " + paramPointer.position + ")");
    int i = sizeof();
    int j = paramPointer.sizeof();
    if (paramPointer.limit <= 0);
    for (int k = 1; ; k = paramPointer.limit - paramPointer.position)
    {
      int m = j * k;
      this.position = (i * this.position);
      paramPointer.position = (j * paramPointer.position);
      memcpy(this, paramPointer, m);
      this.position /= i;
      paramPointer.position /= j;
      return this;
    }
  }

  public void setNull()
  {
    this.address = 0L;
  }

  public int sizeof()
  {
    Class localClass = getClass();
    if ((localClass == Pointer.class) || (localClass == BytePointer.class))
      return 1;
    return offsetof("sizeof");
  }

  public String toString()
  {
    return getClass().getName() + "[address=0x" + Long.toHexString(this.address) + ",position=" + this.position + ",limit=" + this.limit + ",capacity=" + this.capacity + ",deallocator=" + this.deallocator + "]";
  }

  public <P extends Pointer> P zero()
  {
    return fill(0);
  }

  protected static class CustomDeallocator extends Pointer.DeallocatorReference
    implements Pointer.Deallocator
  {
    Method method = null;
    Pointer pointer = null;

    public CustomDeallocator(Pointer paramPointer)
    {
      super(null);
      this.deallocator = this;
      Class localClass = paramPointer.getClass();
      Method[] arrayOfMethod = localClass.getDeclaredMethods();
      int i = arrayOfMethod.length;
      for (int j = 0; ; j++)
        if (j < i)
        {
          Method localMethod = arrayOfMethod[j];
          Class[] arrayOfClass = localMethod.getParameterTypes();
          if ((Modifier.isStatic(localMethod.getModifiers())) && (localMethod.getReturnType().equals(Void.TYPE)) && (localMethod.getName().equals("deallocate")) && (arrayOfClass.length == 1) && (Pointer.class.isAssignableFrom(arrayOfClass[0])))
          {
            localMethod.setAccessible(true);
            this.method = localMethod;
          }
        }
        else
        {
          if (this.method != null)
            break;
          throw new RuntimeException(new NoSuchMethodException("static void " + localClass.getCanonicalName() + ".deallocate(" + Pointer.class.getCanonicalName() + ")"));
        }
      try
      {
        Constructor localConstructor = localClass.getConstructor(new Class[] { Pointer.class });
        localConstructor.setAccessible(true);
        this.pointer = ((Pointer)localConstructor.newInstance(new Object[] { paramPointer }));
        return;
      }
      catch (Exception localException)
      {
        throw new RuntimeException(localException);
      }
    }

    public void deallocate()
    {
      try
      {
        Method localMethod = this.method;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = this.pointer;
        localMethod.invoke(null, arrayOfObject);
        this.pointer.setNull();
        return;
      }
      catch (Exception localException)
      {
        throw new RuntimeException(localException);
      }
    }
  }

  protected static abstract interface Deallocator
  {
    public abstract void deallocate();
  }

  private static class DeallocatorReference extends PhantomReference<Pointer>
  {
    static DeallocatorReference head = null;
    Pointer.Deallocator deallocator;
    DeallocatorReference next = null;
    DeallocatorReference prev = null;

    DeallocatorReference(Pointer paramPointer, Pointer.Deallocator paramDeallocator)
    {
      super(Pointer.referenceQueue);
      this.deallocator = paramDeallocator;
    }

    final void add()
    {
      try
      {
        if (head == null)
          head = this;
        while (true)
        {
          return;
          this.next = head;
          DeallocatorReference localDeallocatorReference = this.next;
          head = this;
          localDeallocatorReference.prev = this;
        }
      }
      finally
      {
      }
    }

    public void clear()
    {
      super.clear();
      this.deallocator.deallocate();
    }

    final void remove()
    {
      while (true)
      {
        try
        {
          if ((this.prev == this) && (this.next == this))
            return;
          if (this.prev == null)
          {
            head = this.next;
            if (this.next != null)
              this.next.prev = this.prev;
            this.next = this;
            this.prev = this;
            return;
          }
        }
        finally
        {
        }
        this.prev.next = this.next;
      }
    }
  }

  protected static class NativeDeallocator extends Pointer.DeallocatorReference
    implements Pointer.Deallocator
  {
    private long allocatedAddress;
    private long deallocatorAddress;

    NativeDeallocator(Pointer paramPointer, long paramLong)
    {
      super(null);
      this.deallocator = this;
      this.allocatedAddress = paramPointer.address;
      this.deallocatorAddress = paramLong;
    }

    private native void deallocate(long paramLong1, long paramLong2);

    public void deallocate()
    {
      if ((this.allocatedAddress != 0L) && (this.deallocatorAddress != 0L))
      {
        deallocate(this.allocatedAddress, this.deallocatorAddress);
        this.deallocatorAddress = 0L;
        this.allocatedAddress = 0L;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.Pointer
 * JD-Core Version:    0.6.2
 */