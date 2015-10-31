package com.flurry.android;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class bs
{
  private int dO;
  private String dP;
  private Map<String, String> dQ;
  private long dR;
  private boolean dS;
  private long dT;

  public bs(int paramInt, String paramString, Map<String, String> paramMap, long paramLong, boolean paramBoolean)
  {
    this.dO = paramInt;
    this.dP = paramString;
    this.dQ = paramMap;
    this.dR = paramLong;
    this.dS = paramBoolean;
  }

  public final void c(long paramLong)
  {
    this.dT = (paramLong - this.dR);
    db.c("FlurryAgent", "Ended event '" + this.dP + "' (" + this.dR + ") after " + this.dT + "ms");
  }

  public final void d(Map<String, String> paramMap)
  {
    if ((this.dQ == null) || (this.dQ.size() == 0))
      this.dQ = paramMap;
    while (true)
    {
      return;
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (this.dQ.containsKey(localEntry.getKey()))
        {
          this.dQ.remove(localEntry.getKey());
          this.dQ.put(localEntry.getKey(), localEntry.getValue());
        }
        else
        {
          this.dQ.put(localEntry.getKey(), localEntry.getValue());
        }
      }
    }
  }

  public final void e(Map<String, String> paramMap)
  {
    this.dQ = paramMap;
  }

  // ERROR //
  public final byte[] getBytes()
  {
    // Byte code:
    //   0: new 119	java/io/ByteArrayOutputStream
    //   3: dup
    //   4: invokespecial 120	java/io/ByteArrayOutputStream:<init>	()V
    //   7: astore_1
    //   8: new 122	java/io/DataOutputStream
    //   11: dup
    //   12: aload_1
    //   13: invokespecial 125	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   16: astore_2
    //   17: aload_2
    //   18: aload_0
    //   19: getfield 23	com/flurry/android/bs:dO	I
    //   22: invokevirtual 129	java/io/DataOutputStream:writeShort	(I)V
    //   25: aload_2
    //   26: aload_0
    //   27: getfield 25	com/flurry/android/bs:dP	Ljava/lang/String;
    //   30: invokevirtual 133	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   33: aload_0
    //   34: getfield 27	com/flurry/android/bs:dQ	Ljava/util/Map;
    //   37: ifnonnull +41 -> 78
    //   40: aload_2
    //   41: iconst_0
    //   42: invokevirtual 129	java/io/DataOutputStream:writeShort	(I)V
    //   45: aload_2
    //   46: aload_0
    //   47: getfield 29	com/flurry/android/bs:dR	J
    //   50: invokevirtual 136	java/io/DataOutputStream:writeLong	(J)V
    //   53: aload_2
    //   54: aload_0
    //   55: getfield 35	com/flurry/android/bs:dT	J
    //   58: invokevirtual 136	java/io/DataOutputStream:writeLong	(J)V
    //   61: aload_2
    //   62: invokevirtual 139	java/io/DataOutputStream:flush	()V
    //   65: aload_1
    //   66: invokevirtual 142	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   69: astore 9
    //   71: aload_2
    //   72: invokestatic 148	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   75: aload 9
    //   77: areturn
    //   78: aload_2
    //   79: aload_0
    //   80: getfield 27	com/flurry/android/bs:dQ	Ljava/util/Map;
    //   83: invokeinterface 72 1 0
    //   88: invokevirtual 129	java/io/DataOutputStream:writeShort	(I)V
    //   91: aload_0
    //   92: getfield 27	com/flurry/android/bs:dQ	Ljava/util/Map;
    //   95: invokeinterface 76 1 0
    //   100: invokeinterface 82 1 0
    //   105: astore 7
    //   107: aload 7
    //   109: invokeinterface 88 1 0
    //   114: ifeq -69 -> 45
    //   117: aload 7
    //   119: invokeinterface 92 1 0
    //   124: checkcast 94	java/util/Map$Entry
    //   127: astore 8
    //   129: aload_2
    //   130: aload 8
    //   132: invokeinterface 97 1 0
    //   137: checkcast 150	java/lang/String
    //   140: invokestatic 154	com/flurry/android/bd:sanitize	(Ljava/lang/String;)Ljava/lang/String;
    //   143: invokevirtual 133	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   146: aload_2
    //   147: aload 8
    //   149: invokeinterface 108 1 0
    //   154: checkcast 150	java/lang/String
    //   157: invokestatic 154	com/flurry/android/bd:sanitize	(Ljava/lang/String;)Ljava/lang/String;
    //   160: invokevirtual 133	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   163: goto -56 -> 107
    //   166: astore 4
    //   168: aload_2
    //   169: astore 5
    //   171: iconst_0
    //   172: newarray byte
    //   174: astore 6
    //   176: aload 5
    //   178: invokestatic 148	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   181: aload 6
    //   183: areturn
    //   184: astore 11
    //   186: aconst_null
    //   187: astore_2
    //   188: aload 11
    //   190: astore_3
    //   191: aload_2
    //   192: invokestatic 148	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   195: aload_3
    //   196: athrow
    //   197: astore_3
    //   198: goto -7 -> 191
    //   201: astore_3
    //   202: aload 5
    //   204: astore_2
    //   205: goto -14 -> 191
    //   208: astore 10
    //   210: aconst_null
    //   211: astore 5
    //   213: goto -42 -> 171
    //
    // Exception table:
    //   from	to	target	type
    //   17	45	166	java/io/IOException
    //   45	71	166	java/io/IOException
    //   78	107	166	java/io/IOException
    //   107	163	166	java/io/IOException
    //   0	17	184	finally
    //   17	45	197	finally
    //   45	71	197	finally
    //   78	107	197	finally
    //   107	163	197	finally
    //   171	176	201	finally
    //   0	17	208	java/io/IOException
  }

  public final Map<String, String> getParameters()
  {
    return this.dQ;
  }

  public final boolean w(String paramString)
  {
    return (this.dS) && (this.dT == 0L) && (this.dP.equals(paramString));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bs
 * JD-Core Version:    0.6.2
 */