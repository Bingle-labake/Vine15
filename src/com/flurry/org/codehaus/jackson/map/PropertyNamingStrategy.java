package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedField;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedParameter;

public abstract class PropertyNamingStrategy
{
  public static final PropertyNamingStrategy CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES = new LowerCaseWithUnderscoresStrategy();

  public String nameForConstructorParameter(MapperConfig<?> paramMapperConfig, AnnotatedParameter paramAnnotatedParameter, String paramString)
  {
    return paramString;
  }

  public String nameForField(MapperConfig<?> paramMapperConfig, AnnotatedField paramAnnotatedField, String paramString)
  {
    return paramString;
  }

  public String nameForGetterMethod(MapperConfig<?> paramMapperConfig, AnnotatedMethod paramAnnotatedMethod, String paramString)
  {
    return paramString;
  }

  public String nameForSetterMethod(MapperConfig<?> paramMapperConfig, AnnotatedMethod paramAnnotatedMethod, String paramString)
  {
    return paramString;
  }

  public static class LowerCaseWithUnderscoresStrategy extends PropertyNamingStrategy.PropertyNamingStrategyBase
  {
    public String translate(String paramString)
    {
      if (paramString == null);
      StringBuilder localStringBuilder;
      int j;
      label124: 
      do
      {
        return paramString;
        int i = paramString.length();
        localStringBuilder = new StringBuilder(i * 2);
        j = 0;
        int k = 0;
        int m = 0;
        if (m < i)
        {
          char c = paramString.charAt(m);
          if ((m > 0) || (c != '_'))
          {
            if (!Character.isUpperCase(c))
              break label124;
            if ((k == 0) && (j > 0) && (localStringBuilder.charAt(j - 1) != '_'))
            {
              localStringBuilder.append('_');
              j++;
            }
            c = Character.toLowerCase(c);
          }
          for (k = 1; ; k = 0)
          {
            localStringBuilder.append(c);
            j++;
            m++;
            break;
          }
        }
      }
      while (j <= 0);
      return localStringBuilder.toString();
    }
  }

  public static abstract class PropertyNamingStrategyBase extends PropertyNamingStrategy
  {
    public String nameForConstructorParameter(MapperConfig<?> paramMapperConfig, AnnotatedParameter paramAnnotatedParameter, String paramString)
    {
      return translate(paramString);
    }

    public String nameForField(MapperConfig<?> paramMapperConfig, AnnotatedField paramAnnotatedField, String paramString)
    {
      return translate(paramString);
    }

    public String nameForGetterMethod(MapperConfig<?> paramMapperConfig, AnnotatedMethod paramAnnotatedMethod, String paramString)
    {
      return translate(paramString);
    }

    public String nameForSetterMethod(MapperConfig<?> paramMapperConfig, AnnotatedMethod paramAnnotatedMethod, String paramString)
    {
      return translate(paramString);
    }

    public abstract String translate(String paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.PropertyNamingStrategy
 * JD-Core Version:    0.6.2
 */