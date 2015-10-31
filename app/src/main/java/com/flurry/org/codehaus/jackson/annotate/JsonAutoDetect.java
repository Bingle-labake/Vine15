package com.flurry.org.codehaus.jackson.annotate;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;

@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.TYPE})
public @interface JsonAutoDetect
{
  public abstract Visibility creatorVisibility();

  public abstract Visibility fieldVisibility();

  public abstract Visibility getterVisibility();

  public abstract Visibility isGetterVisibility();

  public abstract Visibility setterVisibility();

  public abstract JsonMethod[] value();

  public static enum Visibility
  {
    static
    {
      NONE = new Visibility("NONE", 4);
      DEFAULT = new Visibility("DEFAULT", 5);
      Visibility[] arrayOfVisibility = new Visibility[6];
      arrayOfVisibility[0] = ANY;
      arrayOfVisibility[1] = NON_PRIVATE;
      arrayOfVisibility[2] = PROTECTED_AND_PUBLIC;
      arrayOfVisibility[3] = PUBLIC_ONLY;
      arrayOfVisibility[4] = NONE;
      arrayOfVisibility[5] = DEFAULT;
    }

    public boolean isVisible(Member paramMember)
    {
      boolean bool = true;
      switch (JsonAutoDetect.1.$SwitchMap$org$codehaus$jackson$annotate$JsonAutoDetect$Visibility[ordinal()])
      {
      default:
        bool = false;
      case 1:
      case 2:
      case 3:
      case 4:
        do
        {
          do
          {
            return bool;
            return false;
          }
          while (!Modifier.isPrivate(paramMember.getModifiers()));
          return false;
        }
        while (Modifier.isProtected(paramMember.getModifiers()));
      case 5:
      }
      return Modifier.isPublic(paramMember.getModifiers());
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.annotate.JsonAutoDetect
 * JD-Core Version:    0.6.2
 */