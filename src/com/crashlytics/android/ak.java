package com.crashlytics.android;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

class ak
{
  private final File a;
  private final Map<String, String> b;

  public ak(File paramFile)
  {
    this(paramFile, Collections.emptyMap());
  }

  public ak(File paramFile, Map<String, String> paramMap)
  {
    this.a = paramFile;
    this.b = new HashMap(paramMap);
    if (this.a.length() == 0L)
      this.b.putAll(al.a);
  }

  public boolean a()
  {
    av.b("Removing report at " + this.a.getPath());
    return this.a.delete();
  }

  public String b()
  {
    return d().getName();
  }

  public String c()
  {
    String str = b();
    return str.substring(0, str.lastIndexOf('.'));
  }

  public File d()
  {
    return this.a;
  }

  public Map<String, String> e()
  {
    return Collections.unmodifiableMap(this.b);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ak
 * JD-Core Version:    0.6.2
 */