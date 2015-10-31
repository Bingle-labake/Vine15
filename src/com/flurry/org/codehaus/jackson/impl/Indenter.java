package com.flurry.org.codehaus.jackson.impl;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import java.io.IOException;

public abstract interface Indenter
{
  public abstract boolean isInline();

  public abstract void writeIndentation(JsonGenerator paramJsonGenerator, int paramInt)
    throws IOException, JsonGenerationException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.impl.Indenter
 * JD-Core Version:    0.6.2
 */