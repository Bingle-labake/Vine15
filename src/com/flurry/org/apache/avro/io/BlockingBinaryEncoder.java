package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Schema.Type;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;

public class BlockingBinaryEncoder extends BufferedBinaryEncoder
{
  private static final int STACK_STEP = 10;
  private BlockedValue[] blockStack;
  private byte[] buf;
  private byte[] headerBuffer = new byte[12];
  private int pos;
  private int stackTop = -1;

  static
  {
    if (!BlockingBinaryEncoder.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  BlockingBinaryEncoder(OutputStream paramOutputStream, int paramInt1, int paramInt2)
  {
    super(paramOutputStream, paramInt2);
    this.buf = new byte[paramInt1];
    this.pos = 0;
    this.blockStack = new BlockedValue[0];
    expandStack();
    BlockedValue[] arrayOfBlockedValue = this.blockStack;
    int i = 1 + this.stackTop;
    this.stackTop = i;
    BlockedValue localBlockedValue = arrayOfBlockedValue[i];
    localBlockedValue.type = null;
    localBlockedValue.state = BlockingBinaryEncoder.BlockedValue.State.ROOT;
    localBlockedValue.lastFullItem = 0;
    localBlockedValue.start = 0;
    localBlockedValue.items = 1;
    assert (check());
  }

  private boolean check()
  {
    assert (this.buf != null);
    assert (this.pos >= 0);
    assert (this.pos <= this.buf.length) : (this.pos + " " + this.buf.length);
    assert (this.blockStack != null);
    Object localObject = null;
    for (int i = 0; i <= this.stackTop; i++)
    {
      BlockedValue localBlockedValue = this.blockStack[i];
      localBlockedValue.check((BlockedValue)localObject, this.pos);
      localObject = localBlockedValue;
    }
    return true;
  }

  private void compact()
    throws IOException
  {
    assert (check());
    BlockedValue localBlockedValue1 = null;
    for (int i = 1; ; i++)
      if (i <= this.stackTop)
      {
        localBlockedValue1 = this.blockStack[i];
        if (localBlockedValue1.state != BlockingBinaryEncoder.BlockedValue.State.REGULAR);
      }
      else
      {
        if (($assertionsDisabled) || (localBlockedValue1 != null))
          break;
        throw new AssertionError();
      }
    super.writeFixed(this.buf, 0, localBlockedValue1.start);
    if (1 < localBlockedValue1.items)
    {
      super.writeInt(-(-1 + localBlockedValue1.items));
      super.writeInt(localBlockedValue1.lastFullItem - localBlockedValue1.start);
      super.writeFixed(this.buf, localBlockedValue1.start, localBlockedValue1.lastFullItem - localBlockedValue1.start);
      localBlockedValue1.start = localBlockedValue1.lastFullItem;
      localBlockedValue1.items = 1;
    }
    super.writeInt(1);
    BlockedValue localBlockedValue2;
    if (i + 1 <= this.stackTop)
    {
      localBlockedValue2 = this.blockStack[(i + 1)];
      if (localBlockedValue2 != null)
        break label287;
    }
    label287: for (int j = this.pos; ; j = localBlockedValue2.start)
    {
      super.writeFixed(this.buf, localBlockedValue1.lastFullItem, j - localBlockedValue1.lastFullItem);
      System.arraycopy(this.buf, j, this.buf, 0, this.pos - j);
      for (int k = i + 1; k <= this.stackTop; k++)
      {
        BlockedValue localBlockedValue3 = this.blockStack[k];
        localBlockedValue3.start -= j;
        localBlockedValue3.lastFullItem -= j;
      }
      localBlockedValue2 = null;
      break;
    }
    this.pos -= j;
    assert (localBlockedValue1.items == 1);
    localBlockedValue1.lastFullItem = 0;
    localBlockedValue1.start = 0;
    localBlockedValue1.state = BlockingBinaryEncoder.BlockedValue.State.OVERFLOW;
    assert (check());
  }

  private void doWriteBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 < this.buf.length)
    {
      ensureBounds(paramInt2);
      System.arraycopy(paramArrayOfByte, paramInt1, this.buf, this.pos, paramInt2);
      this.pos = (paramInt2 + this.pos);
      return;
    }
    ensureBounds(this.buf.length);
    assert ((this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.ROOT) || (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.OVERFLOW));
    write(paramArrayOfByte, paramInt1, paramInt2);
  }

  private void endBlockedValue()
    throws IOException
  {
    while (true)
    {
      assert (check());
      BlockedValue localBlockedValue = this.blockStack[this.stackTop];
      assert (localBlockedValue.state != BlockingBinaryEncoder.BlockedValue.State.ROOT);
      if (localBlockedValue.state == BlockingBinaryEncoder.BlockedValue.State.OVERFLOW)
        finishOverflow();
      assert (localBlockedValue.state == BlockingBinaryEncoder.BlockedValue.State.REGULAR);
      int j;
      if (localBlockedValue.items > 0)
      {
        j = this.pos - localBlockedValue.start;
        if ((localBlockedValue.start != 0) || (this.blockStack[(-1 + this.stackTop)].state == BlockingBinaryEncoder.BlockedValue.State.REGULAR))
          break label210;
        super.writeInt(-localBlockedValue.items);
        super.writeInt(j);
      }
      while (true)
      {
        this.stackTop = (-1 + this.stackTop);
        ensureBounds(1);
        byte[] arrayOfByte = this.buf;
        int i = this.pos;
        this.pos = (i + 1);
        arrayOfByte[i] = 0;
        if (($assertionsDisabled) || (check()))
          break label321;
        throw new AssertionError();
        label210: int k = 0 + BinaryData.encodeInt(-localBlockedValue.items, this.headerBuffer, 0);
        int m = k + BinaryData.encodeInt(j, this.headerBuffer, k);
        if (this.buf.length < m + this.pos)
          break;
        this.pos = (m + this.pos);
        int n = localBlockedValue.start;
        System.arraycopy(this.buf, n, this.buf, n + m, j);
        System.arraycopy(this.headerBuffer, 0, this.buf, n, m);
      }
      compact();
    }
    label321: if (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.ROOT)
      flush();
  }

  private void ensureBounds(int paramInt)
    throws IOException
  {
    while (this.buf.length < paramInt + this.pos)
      if (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.REGULAR)
      {
        compact();
      }
      else
      {
        super.writeFixed(this.buf, 0, this.pos);
        this.pos = 0;
      }
  }

  private void expandStack()
  {
    int i = this.blockStack.length;
    this.blockStack = ((BlockedValue[])Arrays.copyOf(this.blockStack, 10 + this.blockStack.length));
    for (int j = i; j < this.blockStack.length; j++)
      this.blockStack[j] = new BlockedValue();
  }

  private void finishOverflow()
    throws IOException
  {
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    if (localBlockedValue.state != BlockingBinaryEncoder.BlockedValue.State.OVERFLOW)
      throw new IllegalStateException("Not an overflow block");
    assert (check());
    super.writeFixed(this.buf, 0, this.pos);
    this.pos = 0;
    localBlockedValue.state = BlockingBinaryEncoder.BlockedValue.State.REGULAR;
    localBlockedValue.lastFullItem = 0;
    localBlockedValue.start = 0;
    localBlockedValue.items = 0;
    assert (check());
  }

  private void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.ROOT)
      super.writeFixed(paramArrayOfByte, paramInt1, paramInt2);
    while ((!$assertionsDisabled) && (!check()))
    {
      throw new AssertionError();
      assert (check());
      while (this.buf.length < paramInt2 + this.pos)
        if (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.REGULAR)
        {
          compact();
        }
        else
        {
          super.writeFixed(this.buf, 0, this.pos);
          this.pos = 0;
          if (this.buf.length <= paramInt2)
          {
            super.writeFixed(paramArrayOfByte, paramInt1, paramInt2);
            paramInt2 = 0;
          }
        }
      System.arraycopy(paramArrayOfByte, paramInt1, this.buf, this.pos, paramInt2);
      this.pos = (paramInt2 + this.pos);
    }
  }

  public int bytesBuffered()
  {
    return this.pos + super.bytesBuffered();
  }

  BlockingBinaryEncoder configure(OutputStream paramOutputStream, int paramInt1, int paramInt2)
  {
    super.configure(paramOutputStream, paramInt2);
    this.pos = 0;
    this.stackTop = 0;
    if ((this.buf == null) || (this.buf.length != paramInt1))
      this.buf = new byte[paramInt1];
    assert (check());
    return this;
  }

  public void flush()
    throws IOException
  {
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    if (localBlockedValue.state == BlockingBinaryEncoder.BlockedValue.State.ROOT)
    {
      super.writeFixed(this.buf, 0, this.pos);
      this.pos = 0;
    }
    while (true)
    {
      super.flush();
      if (($assertionsDisabled) || (check()))
        break;
      throw new AssertionError();
      while (localBlockedValue.state != BlockingBinaryEncoder.BlockedValue.State.OVERFLOW)
        compact();
    }
  }

  public void setItemCount(long paramLong)
    throws IOException
  {
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    assert ((localBlockedValue.type == Schema.Type.ARRAY) || (localBlockedValue.type == Schema.Type.MAP));
    assert (localBlockedValue.itemsLeftToWrite == 0L);
    localBlockedValue.itemsLeftToWrite = paramLong;
    assert (check());
  }

  public void startItem()
    throws IOException
  {
    if (this.blockStack[this.stackTop].state == BlockingBinaryEncoder.BlockedValue.State.OVERFLOW)
      finishOverflow();
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    localBlockedValue.items = (1 + localBlockedValue.items);
    localBlockedValue.lastFullItem = this.pos;
    localBlockedValue.itemsLeftToWrite -= 1L;
    assert (check());
  }

  public void writeArrayEnd()
    throws IOException
  {
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    if (localBlockedValue.type != Schema.Type.ARRAY)
      throw new AvroTypeException("Called writeArrayEnd outside of an array.");
    if (localBlockedValue.itemsLeftToWrite != 0L)
      throw new AvroTypeException("Failed to write expected number of array elements.");
    endBlockedValue();
    assert (check());
  }

  public void writeArrayStart()
    throws IOException
  {
    if (1 + this.stackTop == this.blockStack.length)
      expandStack();
    BlockedValue[] arrayOfBlockedValue = this.blockStack;
    int i = 1 + this.stackTop;
    this.stackTop = i;
    BlockedValue localBlockedValue = arrayOfBlockedValue[i];
    localBlockedValue.type = Schema.Type.ARRAY;
    localBlockedValue.state = BlockingBinaryEncoder.BlockedValue.State.REGULAR;
    int j = this.pos;
    localBlockedValue.lastFullItem = j;
    localBlockedValue.start = j;
    localBlockedValue.items = 0;
    assert (check());
  }

  public void writeBoolean(boolean paramBoolean)
    throws IOException
  {
    ensureBounds(1);
    this.pos += BinaryData.encodeBoolean(paramBoolean, this.buf, this.pos);
  }

  public void writeDouble(double paramDouble)
    throws IOException
  {
    ensureBounds(8);
    this.pos += BinaryData.encodeDouble(paramDouble, this.buf, this.pos);
  }

  public void writeFixed(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    doWriteBytes(paramArrayOfByte, paramInt1, paramInt2);
  }

  public void writeFloat(float paramFloat)
    throws IOException
  {
    ensureBounds(4);
    this.pos += BinaryData.encodeFloat(paramFloat, this.buf, this.pos);
  }

  public void writeIndex(int paramInt)
    throws IOException
  {
    ensureBounds(5);
    this.pos += BinaryData.encodeInt(paramInt, this.buf, this.pos);
  }

  public void writeInt(int paramInt)
    throws IOException
  {
    ensureBounds(5);
    this.pos += BinaryData.encodeInt(paramInt, this.buf, this.pos);
  }

  public void writeLong(long paramLong)
    throws IOException
  {
    ensureBounds(10);
    this.pos += BinaryData.encodeLong(paramLong, this.buf, this.pos);
  }

  public void writeMapEnd()
    throws IOException
  {
    BlockedValue localBlockedValue = this.blockStack[this.stackTop];
    if (localBlockedValue.type != Schema.Type.MAP)
      throw new AvroTypeException("Called writeMapEnd outside of a map.");
    if (localBlockedValue.itemsLeftToWrite != 0L)
      throw new AvroTypeException("Failed to read write expected number of array elements.");
    endBlockedValue();
    assert (check());
  }

  public void writeMapStart()
    throws IOException
  {
    if (1 + this.stackTop == this.blockStack.length)
      expandStack();
    BlockedValue[] arrayOfBlockedValue = this.blockStack;
    int i = 1 + this.stackTop;
    this.stackTop = i;
    BlockedValue localBlockedValue = arrayOfBlockedValue[i];
    localBlockedValue.type = Schema.Type.MAP;
    localBlockedValue.state = BlockingBinaryEncoder.BlockedValue.State.REGULAR;
    int j = this.pos;
    localBlockedValue.lastFullItem = j;
    localBlockedValue.start = j;
    localBlockedValue.items = 0;
    assert (check());
  }

  protected void writeZero()
    throws IOException
  {
    ensureBounds(1);
    byte[] arrayOfByte = this.buf;
    int i = this.pos;
    this.pos = (i + 1);
    arrayOfByte[i] = 0;
  }

  private static class BlockedValue
  {
    public int items = 1;
    public long itemsLeftToWrite;
    public int lastFullItem = 0;
    public int start = 0;
    public State state = State.ROOT;
    public Schema.Type type = null;

    static
    {
      if (!BlockingBinaryEncoder.class.desiredAssertionStatus());
      for (boolean bool = true; ; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }

    public boolean check(BlockedValue paramBlockedValue, int paramInt)
    {
      assert ((this.state != State.ROOT) || (this.type == null));
      assert ((this.state == State.ROOT) || (this.type == Schema.Type.ARRAY) || (this.type == Schema.Type.MAP));
      assert (this.items >= 0);
      assert ((this.items != 0) || (this.start == paramInt));
      assert ((1 < this.items) || (this.start == this.lastFullItem));
      assert ((this.items <= 1) || (this.start <= this.lastFullItem));
      assert (this.lastFullItem <= paramInt);
      switch (BlockingBinaryEncoder.1.$SwitchMap$org$apache$avro$io$BlockingBinaryEncoder$BlockedValue$State[this.state.ordinal()])
      {
      default:
      case 1:
      case 2:
      case 3:
      }
      do
      {
        do
        {
          do
          {
            return false;
            assert (this.start == 0);
          }
          while (($assertionsDisabled) || (paramBlockedValue == null));
          throw new AssertionError();
          assert (this.start >= 0);
          assert (paramBlockedValue.lastFullItem <= this.start);
        }
        while (($assertionsDisabled) || (1 <= paramBlockedValue.items));
        throw new AssertionError();
        assert (this.start == 0);
        assert (this.items == 1);
      }
      while (($assertionsDisabled) || (paramBlockedValue.state == State.ROOT) || (paramBlockedValue.state == State.OVERFLOW));
      throw new AssertionError();
    }

    public static enum State
    {
      static
      {
        REGULAR = new State("REGULAR", 1);
        OVERFLOW = new State("OVERFLOW", 2);
        State[] arrayOfState = new State[3];
        arrayOfState[0] = ROOT;
        arrayOfState[1] = REGULAR;
        arrayOfState[2] = OVERFLOW;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.BlockingBinaryEncoder
 * JD-Core Version:    0.6.2
 */