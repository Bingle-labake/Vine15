package com.flurry.org.codehaus.jackson.annotate;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.TYPE, java.lang.annotation.ElementType.FIELD, java.lang.annotation.ElementType.METHOD, java.lang.annotation.ElementType.PARAMETER})
public @interface JsonTypeInfo
{
  public abstract Class<?> defaultImpl();

  public abstract As include();

  public abstract String property();

  public abstract Id use();

  public static enum As
  {
    static
    {
      WRAPPER_ARRAY = new As("WRAPPER_ARRAY", 2);
      EXTERNAL_PROPERTY = new As("EXTERNAL_PROPERTY", 3);
      As[] arrayOfAs = new As[4];
      arrayOfAs[0] = PROPERTY;
      arrayOfAs[1] = WRAPPER_OBJECT;
      arrayOfAs[2] = WRAPPER_ARRAY;
      arrayOfAs[3] = EXTERNAL_PROPERTY;
    }
  }

  public static enum Id
  {
    private final String _defaultPropertyName;

    static
    {
      CLASS = new Id("CLASS", 1, "@class");
      MINIMAL_CLASS = new Id("MINIMAL_CLASS", 2, "@c");
      NAME = new Id("NAME", 3, "@type");
      CUSTOM = new Id("CUSTOM", 4, null);
      Id[] arrayOfId = new Id[5];
      arrayOfId[0] = NONE;
      arrayOfId[1] = CLASS;
      arrayOfId[2] = MINIMAL_CLASS;
      arrayOfId[3] = NAME;
      arrayOfId[4] = CUSTOM;
    }

    private Id(String paramString)
    {
      this._defaultPropertyName = paramString;
    }

    public String getDefaultPropertyName()
    {
      return this._defaultPropertyName;
    }
  }

  public static abstract class None
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo
 * JD-Core Version:    0.6.2
 */