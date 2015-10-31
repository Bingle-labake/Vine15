package com.fasterxml.jackson.core.sym;

public final class Name2 extends Name
{
  final int mQuad1;
  final int mQuad2;

  Name2(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    super(paramString, paramInt1);
    this.mQuad1 = paramInt2;
    this.mQuad2 = paramInt3;
  }

  public boolean equals(int paramInt)
  {
    return false;
  }

  public boolean equals(int paramInt1, int paramInt2)
  {
    return (paramInt1 == this.mQuad1) && (paramInt2 == this.mQuad2);
  }

  public boolean equals(int[] paramArrayOfInt, int paramInt)
  {
    return (paramInt == 2) && (paramArrayOfInt[0] == this.mQuad1) && (paramArrayOfInt[1] == this.mQuad2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.sym.Name2
 * JD-Core Version:    0.6.2
 */