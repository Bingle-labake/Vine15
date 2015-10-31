package com.google.android.gms.internal;

import android.database.CharArrayBuffer;

public final class ax
{
  public static void b(String paramString, CharArrayBuffer paramCharArrayBuffer)
  {
    if ((paramCharArrayBuffer.data == null) || (paramCharArrayBuffer.data.length < paramString.length()))
      paramCharArrayBuffer.data = paramString.toCharArray();
    while (true)
    {
      paramCharArrayBuffer.sizeCopied = paramString.length();
      return;
      paramString.getChars(0, paramString.length(), paramCharArrayBuffer.data, 0);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ax
 * JD-Core Version:    0.6.2
 */