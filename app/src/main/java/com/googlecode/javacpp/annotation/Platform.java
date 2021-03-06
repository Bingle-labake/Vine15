package com.googlecode.javacpp.annotation;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.TYPE, java.lang.annotation.ElementType.METHOD})
public @interface Platform
{
  public abstract String[] cinclude();

  public abstract String[] define();

  public abstract String[] framework();

  public abstract String[] include();

  public abstract String[] includepath();

  public abstract String library();

  public abstract String[] link();

  public abstract String[] linkpath();

  public abstract String[] not();

  public abstract String[] options();

  public abstract String[] preload();

  public abstract String[] preloadpath();

  public abstract String[] value();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.annotation.Platform
 * JD-Core Version:    0.6.2
 */