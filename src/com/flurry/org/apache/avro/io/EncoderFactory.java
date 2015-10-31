package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import java.io.IOException;
import java.io.OutputStream;

public class EncoderFactory
{
  private static final int DEFAULT_BLOCK_BUFFER_SIZE = 65536;
  private static final int DEFAULT_BUFFER_SIZE = 2048;
  private static final EncoderFactory DEFAULT_FACTORY = new DefaultEncoderFactory(null);
  private static final int MAX_BLOCK_BUFFER_SIZE = 1073741824;
  private static final int MIN_BLOCK_BUFFER_SIZE = 64;
  protected int binaryBlockSize = 65536;
  protected int binaryBufferSize = 2048;

  public static EncoderFactory get()
  {
    return DEFAULT_FACTORY;
  }

  public BinaryEncoder binaryEncoder(OutputStream paramOutputStream, BinaryEncoder paramBinaryEncoder)
  {
    if ((paramBinaryEncoder == null) || (!paramBinaryEncoder.getClass().equals(BufferedBinaryEncoder.class)))
      return new BufferedBinaryEncoder(paramOutputStream, this.binaryBufferSize);
    return ((BufferedBinaryEncoder)paramBinaryEncoder).configure(paramOutputStream, this.binaryBufferSize);
  }

  public BinaryEncoder blockingBinaryEncoder(OutputStream paramOutputStream, BinaryEncoder paramBinaryEncoder)
  {
    if ((paramBinaryEncoder == null) || (!paramBinaryEncoder.getClass().equals(BlockingBinaryEncoder.class)))
      return new BlockingBinaryEncoder(paramOutputStream, this.binaryBlockSize, 32);
    return ((BlockingBinaryEncoder)paramBinaryEncoder).configure(paramOutputStream, this.binaryBlockSize, 32);
  }

  public EncoderFactory configureBlockSize(int paramInt)
  {
    if (paramInt < 64)
      paramInt = 64;
    if (paramInt > 1073741824)
      paramInt = 1073741824;
    this.binaryBufferSize = paramInt;
    return this;
  }

  public EncoderFactory configureBufferSize(int paramInt)
  {
    if (paramInt < 32)
      paramInt = 32;
    if (paramInt > 16777216)
      paramInt = 16777216;
    this.binaryBufferSize = paramInt;
    return this;
  }

  public BinaryEncoder directBinaryEncoder(OutputStream paramOutputStream, BinaryEncoder paramBinaryEncoder)
  {
    if ((paramBinaryEncoder == null) || (!paramBinaryEncoder.getClass().equals(DirectBinaryEncoder.class)))
      return new DirectBinaryEncoder(paramOutputStream);
    return ((DirectBinaryEncoder)paramBinaryEncoder).configure(paramOutputStream);
  }

  public int getBlockSize()
  {
    return this.binaryBlockSize;
  }

  public int getBufferSize()
  {
    return this.binaryBufferSize;
  }

  public JsonEncoder jsonEncoder(Schema paramSchema, JsonGenerator paramJsonGenerator)
    throws IOException
  {
    return new JsonEncoder(paramSchema, paramJsonGenerator);
  }

  public JsonEncoder jsonEncoder(Schema paramSchema, OutputStream paramOutputStream)
    throws IOException
  {
    return new JsonEncoder(paramSchema, paramOutputStream);
  }

  public ValidatingEncoder validatingEncoder(Schema paramSchema, Encoder paramEncoder)
    throws IOException
  {
    return new ValidatingEncoder(paramSchema, paramEncoder);
  }

  private static class DefaultEncoderFactory extends EncoderFactory
  {
    public EncoderFactory configureBlockSize(int paramInt)
    {
      throw new AvroRuntimeException("Default EncoderFactory cannot be configured");
    }

    public EncoderFactory configureBufferSize(int paramInt)
    {
      throw new AvroRuntimeException("Default EncoderFactory cannot be configured");
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.EncoderFactory
 * JD-Core Version:    0.6.2
 */