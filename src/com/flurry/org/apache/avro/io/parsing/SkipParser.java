package com.flurry.org.apache.avro.io.parsing;

import java.io.IOException;

public class SkipParser extends Parser
{
  private final SkipHandler skipHandler;

  static
  {
    if (!SkipParser.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public SkipParser(Symbol paramSymbol, Parser.ActionHandler paramActionHandler, SkipHandler paramSkipHandler)
    throws IOException
  {
    super(paramSymbol, paramActionHandler);
    this.skipHandler = paramSkipHandler;
  }

  public final void skipRepeater()
    throws IOException
  {
    int i = this.pos;
    Symbol[] arrayOfSymbol = this.stack;
    int j = -1 + this.pos;
    this.pos = j;
    Symbol localSymbol = arrayOfSymbol[j];
    assert (localSymbol.kind == Symbol.Kind.REPEATER);
    pushProduction(localSymbol);
    skipTo(i);
  }

  public final void skipSymbol(Symbol paramSymbol)
    throws IOException
  {
    int i = this.pos;
    pushSymbol(paramSymbol);
    skipTo(i);
  }

  public final void skipTo(int paramInt)
    throws IOException
  {
    while (paramInt < this.pos)
    {
      Symbol localSymbol = this.stack[(-1 + this.pos)];
      if (localSymbol.kind != Symbol.Kind.TERMINAL)
      {
        if ((localSymbol.kind == Symbol.Kind.IMPLICIT_ACTION) || (localSymbol.kind == Symbol.Kind.EXPLICIT_ACTION))
        {
          this.skipHandler.skipAction();
        }
        else
        {
          this.pos = (-1 + this.pos);
          pushProduction(localSymbol);
        }
      }
      else
        this.skipHandler.skipTopSymbol();
    }
  }

  public static abstract interface SkipHandler
  {
    public abstract void skipAction()
      throws IOException;

    public abstract void skipTopSymbol()
      throws IOException;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.parsing.SkipParser
 * JD-Core Version:    0.6.2
 */