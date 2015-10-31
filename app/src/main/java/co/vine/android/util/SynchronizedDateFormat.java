package co.vine.android.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class SynchronizedDateFormat extends SimpleDateFormat
{
  private static final long serialVersionUID = 6612933786679648650L;

  public SynchronizedDateFormat()
  {
  }

  public SynchronizedDateFormat(String paramString)
  {
    super(paramString);
  }

  public SynchronizedDateFormat(String paramString, Locale paramLocale)
  {
    super(paramString, paramLocale);
  }

  public void applyPattern(String paramString)
  {
    try
    {
      super.applyPattern(paramString);
      return;
    }
    finally
    {
    }
  }

  public Date parse(String paramString)
    throws ParseException
  {
    try
    {
      Date localDate = super.parse(paramString);
      return localDate;
    }
    finally
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.SynchronizedDateFormat
 * JD-Core Version:    0.6.2
 */