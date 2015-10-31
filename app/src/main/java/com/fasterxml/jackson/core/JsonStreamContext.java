package com.fasterxml.jackson.core;

public abstract class JsonStreamContext
{
  protected static final int TYPE_ARRAY = 1;
  protected static final int TYPE_OBJECT = 2;
  protected static final int TYPE_ROOT;
  protected int _index;
  protected int _type;

  public final int getCurrentIndex()
  {
    if (this._index < 0)
      return 0;
    return this._index;
  }

  public abstract String getCurrentName();

  public final int getEntryCount()
  {
    return 1 + this._index;
  }

  public abstract JsonStreamContext getParent();

  public final String getTypeDesc()
  {
    switch (this._type)
    {
    default:
      return "?";
    case 0:
      return "ROOT";
    case 1:
      return "ARRAY";
    case 2:
    }
    return "OBJECT";
  }

  public final boolean inArray()
  {
    return this._type == 1;
  }

  public final boolean inObject()
  {
    return this._type == 2;
  }

  public final boolean inRoot()
  {
    return this._type == 0;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.JsonStreamContext
 * JD-Core Version:    0.6.2
 */