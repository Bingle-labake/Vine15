package com.googlecode.javacpp;

public abstract class FunctionPointer extends Pointer
{
  protected FunctionPointer()
  {
  }

  protected FunctionPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.FunctionPointer
 * JD-Core Version:    0.6.2
 */