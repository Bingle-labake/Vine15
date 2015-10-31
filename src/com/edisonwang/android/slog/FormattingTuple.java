package com.edisonwang.android.slog;

public class FormattingTuple
{
  public static FormattingTuple NULL = new FormattingTuple(null);
  private Object[] argArray;
  private String message;
  private Throwable throwable;

  public FormattingTuple(String paramString)
  {
    this(paramString, null, null);
  }

  public FormattingTuple(String paramString, Object[] paramArrayOfObject, Throwable paramThrowable)
  {
    this.message = paramString;
    this.throwable = paramThrowable;
    if (paramThrowable == null)
    {
      this.argArray = paramArrayOfObject;
      return;
    }
    this.argArray = trimmedCopy(paramArrayOfObject);
  }

  static Object[] trimmedCopy(Object[] paramArrayOfObject)
  {
    if ((paramArrayOfObject == null) || (paramArrayOfObject.length == 0))
      throw new IllegalStateException("non-sensical empty or null argument array");
    int i = -1 + paramArrayOfObject.length;
    Object[] arrayOfObject = new Object[i];
    System.arraycopy(paramArrayOfObject, 0, arrayOfObject, 0, i);
    return arrayOfObject;
  }

  public Object[] getArgArray()
  {
    return this.argArray;
  }

  public String getMessage()
  {
    return this.message;
  }

  public Throwable getThrowable()
  {
    return this.throwable;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.edisonwang.android.slog.FormattingTuple
 * JD-Core Version:    0.6.2
 */