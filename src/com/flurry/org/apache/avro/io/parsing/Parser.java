package com.flurry.org.apache.avro.io.parsing;

import com.flurry.org.apache.avro.AvroTypeException;
import java.io.IOException;

public class Parser
{
  protected int pos;
  protected Symbol[] stack;
  protected final ActionHandler symbolHandler;

  public Parser(Symbol paramSymbol, ActionHandler paramActionHandler)
    throws IOException
  {
    this.symbolHandler = paramActionHandler;
    this.stack = new Symbol[5];
    this.stack[0] = paramSymbol;
    this.pos = 1;
  }

  private void expandStack()
  {
    Symbol[] arrayOfSymbol = new Symbol[this.stack.length + Math.max(this.stack.length, 1024)];
    System.arraycopy(this.stack, 0, arrayOfSymbol, 0, this.stack.length);
    this.stack = arrayOfSymbol;
  }

  public final Symbol advance(Symbol paramSymbol)
    throws IOException
  {
    while (true)
    {
      Symbol[] arrayOfSymbol = this.stack;
      int i = -1 + this.pos;
      this.pos = i;
      Symbol localSymbol1 = arrayOfSymbol[i];
      if (localSymbol1 == paramSymbol)
        return localSymbol1;
      Symbol.Kind localKind = localSymbol1.kind;
      if (localKind == Symbol.Kind.IMPLICIT_ACTION)
      {
        Symbol localSymbol2 = this.symbolHandler.doAction(paramSymbol, localSymbol1);
        if (localSymbol2 != null)
          return localSymbol2;
      }
      else
      {
        if (localKind == Symbol.Kind.TERMINAL)
          throw new AvroTypeException("Attempt to process a " + paramSymbol + " when a " + localSymbol1 + " was expected.");
        if ((localKind == Symbol.Kind.REPEATER) && (paramSymbol == ((Symbol.Repeater)localSymbol1).end))
          return paramSymbol;
        pushProduction(localSymbol1);
      }
    }
  }

  public int depth()
  {
    return this.pos;
  }

  public Symbol popSymbol()
  {
    Symbol[] arrayOfSymbol = this.stack;
    int i = -1 + this.pos;
    this.pos = i;
    return arrayOfSymbol[i];
  }

  public final void processImplicitActions()
    throws IOException
  {
    while (true)
    {
      if (this.pos <= 1);
      Symbol localSymbol;
      do
      {
        return;
        localSymbol = this.stack[(-1 + this.pos)];
        if (localSymbol.kind == Symbol.Kind.IMPLICIT_ACTION)
        {
          this.pos = (-1 + this.pos);
          this.symbolHandler.doAction(null, localSymbol);
          break;
        }
      }
      while (localSymbol.kind == Symbol.Kind.TERMINAL);
      this.pos = (-1 + this.pos);
      pushProduction(localSymbol);
    }
  }

  public final void processTrailingImplicitActions()
    throws IOException
  {
    while (true)
    {
      if (this.pos < 1);
      Symbol localSymbol;
      do
      {
        return;
        localSymbol = this.stack[(-1 + this.pos)];
      }
      while ((localSymbol.kind != Symbol.Kind.IMPLICIT_ACTION) || (!((Symbol.ImplicitAction)localSymbol).isTrailing));
      this.pos = (-1 + this.pos);
      this.symbolHandler.doAction(null, localSymbol);
    }
  }

  public final void pushProduction(Symbol paramSymbol)
  {
    Symbol[] arrayOfSymbol = paramSymbol.production;
    while (true)
    {
      if (this.pos + arrayOfSymbol.length <= this.stack.length)
      {
        System.arraycopy(arrayOfSymbol, 0, this.stack, this.pos, arrayOfSymbol.length);
        this.pos += arrayOfSymbol.length;
        return;
      }
      expandStack();
    }
  }

  public void pushSymbol(Symbol paramSymbol)
  {
    if (this.pos == this.stack.length)
      expandStack();
    Symbol[] arrayOfSymbol = this.stack;
    int i = this.pos;
    this.pos = (i + 1);
    arrayOfSymbol[i] = paramSymbol;
  }

  public void reset()
  {
    this.pos = 1;
  }

  public Symbol topSymbol()
  {
    return this.stack[(-1 + this.pos)];
  }

  public static abstract interface ActionHandler
  {
    public abstract Symbol doAction(Symbol paramSymbol1, Symbol paramSymbol2)
      throws IOException;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.parsing.Parser
 * JD-Core Version:    0.6.2
 */