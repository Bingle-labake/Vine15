package com.flurry.org.codehaus.jackson.map.annotate;

import com.flurry.org.codehaus.jackson.annotate.JacksonAnnotation;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.METHOD, java.lang.annotation.ElementType.FIELD, java.lang.annotation.ElementType.TYPE, java.lang.annotation.ElementType.PARAMETER})
public @interface JsonSerialize
{
  public abstract Class<?> as();

  public abstract Class<?> contentAs();

  public abstract Class<? extends JsonSerializer<?>> contentUsing();

  public abstract Inclusion include();

  public abstract Class<?> keyAs();

  public abstract Class<? extends JsonSerializer<?>> keyUsing();

  public abstract Typing typing();

  public abstract Class<? extends JsonSerializer<?>> using();

  public static enum Inclusion
  {
    static
    {
      NON_DEFAULT = new Inclusion("NON_DEFAULT", 2);
      NON_EMPTY = new Inclusion("NON_EMPTY", 3);
      Inclusion[] arrayOfInclusion = new Inclusion[4];
      arrayOfInclusion[0] = ALWAYS;
      arrayOfInclusion[1] = NON_NULL;
      arrayOfInclusion[2] = NON_DEFAULT;
      arrayOfInclusion[3] = NON_EMPTY;
    }
  }

  public static enum Typing
  {
    static
    {
      Typing[] arrayOfTyping = new Typing[2];
      arrayOfTyping[0] = DYNAMIC;
      arrayOfTyping[1] = STATIC;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize
 * JD-Core Version:    0.6.2
 */