package com.facebook;

public enum LoggingBehavior
{
  static
  {
    INCLUDE_ACCESS_TOKENS = new LoggingBehavior("INCLUDE_ACCESS_TOKENS", 1);
    INCLUDE_RAW_RESPONSES = new LoggingBehavior("INCLUDE_RAW_RESPONSES", 2);
    CACHE = new LoggingBehavior("CACHE", 3);
    DEVELOPER_ERRORS = new LoggingBehavior("DEVELOPER_ERRORS", 4);
    LoggingBehavior[] arrayOfLoggingBehavior = new LoggingBehavior[5];
    arrayOfLoggingBehavior[0] = REQUESTS;
    arrayOfLoggingBehavior[1] = INCLUDE_ACCESS_TOKENS;
    arrayOfLoggingBehavior[2] = INCLUDE_RAW_RESPONSES;
    arrayOfLoggingBehavior[3] = CACHE;
    arrayOfLoggingBehavior[4] = DEVELOPER_ERRORS;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.LoggingBehavior
 * JD-Core Version:    0.6.2
 */