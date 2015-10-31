package com.facebook.internal;

import android.content.Context;
import com.facebook.LoggingBehavior;
import com.facebook.Settings;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidParameterException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public final class FileLruCache
{
  private static final String HEADER_CACHEKEY_KEY = "key";
  private static final String HEADER_CACHE_CONTENT_TAG_KEY = "tag";
  static final String TAG = FileLruCache.class.getSimpleName();
  private static final AtomicLong bufferIndex = new AtomicLong();
  private final File directory;
  private boolean isTrimPending;
  private final Limits limits;
  private final Object lock;
  private final String tag;

  public FileLruCache(Context paramContext, String paramString, Limits paramLimits)
  {
    this.tag = paramString;
    this.limits = paramLimits;
    this.directory = new File(paramContext.getCacheDir(), paramString);
    this.lock = new Object();
    this.directory.mkdirs();
    BufferFile.deleteAll(this.directory);
  }

  private void postTrim()
  {
    synchronized (this.lock)
    {
      if (!this.isTrimPending)
      {
        this.isTrimPending = true;
        Settings.getExecutor().execute(new Runnable()
        {
          public void run()
          {
            FileLruCache.this.trim();
          }
        });
      }
      return;
    }
  }

  private void renameToTargetAndTrim(String paramString, File paramFile)
  {
    if (!paramFile.renameTo(new File(this.directory, Utility.md5hash(paramString))))
      paramFile.delete();
    postTrim();
  }

  // ERROR //
  private void trim()
  {
    // Byte code:
    //   0: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   3: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   6: ldc 125
    //   8: invokestatic 131	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   11: new 133	java/util/PriorityQueue
    //   14: dup
    //   15: invokespecial 134	java/util/PriorityQueue:<init>	()V
    //   18: astore 4
    //   20: lconst_0
    //   21: lstore 5
    //   23: lconst_0
    //   24: lstore 7
    //   26: aload_0
    //   27: getfield 58	com/facebook/internal/FileLruCache:directory	Ljava/io/File;
    //   30: invokestatic 138	com/facebook/internal/FileLruCache$BufferFile:excludeBufferFiles	()Ljava/io/FilenameFilter;
    //   33: invokevirtual 142	java/io/File:listFiles	(Ljava/io/FilenameFilter;)[Ljava/io/File;
    //   36: astore 9
    //   38: aload 9
    //   40: arraylength
    //   41: istore 10
    //   43: iconst_0
    //   44: istore 11
    //   46: iload 11
    //   48: iload 10
    //   50: if_icmpge +102 -> 152
    //   53: aload 9
    //   55: iload 11
    //   57: aaload
    //   58: astore 12
    //   60: new 144	com/facebook/internal/FileLruCache$ModifiedFile
    //   63: dup
    //   64: aload 12
    //   66: invokespecial 146	com/facebook/internal/FileLruCache$ModifiedFile:<init>	(Ljava/io/File;)V
    //   69: astore 13
    //   71: aload 4
    //   73: aload 13
    //   75: invokevirtual 150	java/util/PriorityQueue:add	(Ljava/lang/Object;)Z
    //   78: pop
    //   79: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   82: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   85: new 152	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   92: ldc 155
    //   94: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: aload 13
    //   99: invokevirtual 163	com/facebook/internal/FileLruCache$ModifiedFile:getModified	()J
    //   102: invokestatic 169	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   105: invokevirtual 172	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   108: ldc 174
    //   110: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   113: aload 13
    //   115: invokevirtual 177	com/facebook/internal/FileLruCache$ModifiedFile:getFile	()Ljava/io/File;
    //   118: invokevirtual 180	java/io/File:getName	()Ljava/lang/String;
    //   121: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   127: invokestatic 131	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   130: lload 5
    //   132: aload 12
    //   134: invokevirtual 186	java/io/File:length	()J
    //   137: ladd
    //   138: lstore 5
    //   140: lload 7
    //   142: lconst_1
    //   143: ladd
    //   144: lstore 7
    //   146: iinc 11 1
    //   149: goto -103 -> 46
    //   152: lload 5
    //   154: aload_0
    //   155: getfield 45	com/facebook/internal/FileLruCache:limits	Lcom/facebook/internal/FileLruCache$Limits;
    //   158: invokevirtual 192	com/facebook/internal/FileLruCache$Limits:getByteCount	()I
    //   161: i2l
    //   162: lcmp
    //   163: ifgt +17 -> 180
    //   166: lload 7
    //   168: aload_0
    //   169: getfield 45	com/facebook/internal/FileLruCache:limits	Lcom/facebook/internal/FileLruCache$Limits;
    //   172: invokevirtual 195	com/facebook/internal/FileLruCache$Limits:getFileCount	()I
    //   175: i2l
    //   176: lcmp
    //   177: ifle +97 -> 274
    //   180: aload 4
    //   182: invokevirtual 199	java/util/PriorityQueue:remove	()Ljava/lang/Object;
    //   185: checkcast 144	com/facebook/internal/FileLruCache$ModifiedFile
    //   188: invokevirtual 177	com/facebook/internal/FileLruCache$ModifiedFile:getFile	()Ljava/io/File;
    //   191: astore 15
    //   193: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   196: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   199: new 152	java/lang/StringBuilder
    //   202: dup
    //   203: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   206: ldc 201
    //   208: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   211: aload 15
    //   213: invokevirtual 180	java/io/File:getName	()Ljava/lang/String;
    //   216: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   222: invokestatic 131	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   225: lload 5
    //   227: aload 15
    //   229: invokevirtual 186	java/io/File:length	()J
    //   232: lsub
    //   233: lstore 5
    //   235: lload 7
    //   237: lconst_1
    //   238: lsub
    //   239: lstore 7
    //   241: aload 15
    //   243: invokevirtual 115	java/io/File:delete	()Z
    //   246: pop
    //   247: goto -95 -> 152
    //   250: astore_1
    //   251: aload_0
    //   252: getfield 60	com/facebook/internal/FileLruCache:lock	Ljava/lang/Object;
    //   255: astore_2
    //   256: aload_2
    //   257: monitorenter
    //   258: aload_0
    //   259: iconst_0
    //   260: putfield 86	com/facebook/internal/FileLruCache:isTrimPending	Z
    //   263: aload_0
    //   264: getfield 60	com/facebook/internal/FileLruCache:lock	Ljava/lang/Object;
    //   267: invokevirtual 204	java/lang/Object:notifyAll	()V
    //   270: aload_2
    //   271: monitorexit
    //   272: aload_1
    //   273: athrow
    //   274: aload_0
    //   275: getfield 60	com/facebook/internal/FileLruCache:lock	Ljava/lang/Object;
    //   278: astore 17
    //   280: aload 17
    //   282: monitorenter
    //   283: aload_0
    //   284: iconst_0
    //   285: putfield 86	com/facebook/internal/FileLruCache:isTrimPending	Z
    //   288: aload_0
    //   289: getfield 60	com/facebook/internal/FileLruCache:lock	Ljava/lang/Object;
    //   292: invokevirtual 204	java/lang/Object:notifyAll	()V
    //   295: aload 17
    //   297: monitorexit
    //   298: return
    //   299: astore 18
    //   301: aload 17
    //   303: monitorexit
    //   304: aload 18
    //   306: athrow
    //   307: astore_3
    //   308: aload_2
    //   309: monitorexit
    //   310: aload_3
    //   311: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   0	20	250	finally
    //   26	43	250	finally
    //   53	140	250	finally
    //   152	180	250	finally
    //   180	235	250	finally
    //   241	247	250	finally
    //   283	298	299	finally
    //   301	304	299	finally
    //   258	272	307	finally
    //   308	310	307	finally
  }

  public void clearForTest()
    throws IOException
  {
    File[] arrayOfFile = this.directory.listFiles();
    int i = arrayOfFile.length;
    for (int j = 0; j < i; j++)
      arrayOfFile[j].delete();
  }

  public InputStream get(String paramString)
    throws IOException
  {
    return get(paramString, null);
  }

  // ERROR //
  public InputStream get(String paramString1, String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: new 47	java/io/File
    //   3: dup
    //   4: aload_0
    //   5: getfield 58	com/facebook/internal/FileLruCache:directory	Ljava/io/File;
    //   8: aload_1
    //   9: invokestatic 108	com/facebook/internal/Utility:md5hash	(Ljava/lang/String;)Ljava/lang/String;
    //   12: invokespecial 56	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   15: astore_3
    //   16: new 217	java/io/FileInputStream
    //   19: dup
    //   20: aload_3
    //   21: invokespecial 218	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   24: astore 4
    //   26: new 220	java/io/BufferedInputStream
    //   29: dup
    //   30: aload 4
    //   32: sipush 8192
    //   35: invokespecial 223	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;I)V
    //   38: astore 5
    //   40: aload 5
    //   42: invokestatic 229	com/facebook/internal/FileLruCache$StreamHeader:readHeader	(Ljava/io/InputStream;)Lorg/json/JSONObject;
    //   45: astore 7
    //   47: aload 7
    //   49: ifnonnull +18 -> 67
    //   52: iconst_0
    //   53: ifne +8 -> 61
    //   56: aload 5
    //   58: invokevirtual 232	java/io/BufferedInputStream:close	()V
    //   61: aconst_null
    //   62: areturn
    //   63: astore 15
    //   65: aconst_null
    //   66: areturn
    //   67: aload 7
    //   69: ldc 8
    //   71: invokevirtual 237	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   74: astore 8
    //   76: aload 8
    //   78: ifnull +16 -> 94
    //   81: aload 8
    //   83: aload_1
    //   84: invokevirtual 242	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   87: istore 9
    //   89: iload 9
    //   91: ifne +14 -> 105
    //   94: iconst_0
    //   95: ifne +8 -> 103
    //   98: aload 5
    //   100: invokevirtual 232	java/io/BufferedInputStream:close	()V
    //   103: aconst_null
    //   104: areturn
    //   105: aload 7
    //   107: ldc 11
    //   109: aconst_null
    //   110: invokevirtual 245	org/json/JSONObject:optString	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   113: astore 10
    //   115: aload_2
    //   116: ifnonnull +8 -> 124
    //   119: aload 10
    //   121: ifnonnull +20 -> 141
    //   124: aload_2
    //   125: ifnull +27 -> 152
    //   128: aload_2
    //   129: aload 10
    //   131: invokevirtual 242	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   134: istore 11
    //   136: iload 11
    //   138: ifne +14 -> 152
    //   141: iconst_0
    //   142: ifne +8 -> 150
    //   145: aload 5
    //   147: invokevirtual 232	java/io/BufferedInputStream:close	()V
    //   150: aconst_null
    //   151: areturn
    //   152: new 247	java/util/Date
    //   155: dup
    //   156: invokespecial 248	java/util/Date:<init>	()V
    //   159: invokevirtual 251	java/util/Date:getTime	()J
    //   162: lstore 12
    //   164: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   167: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   170: new 152	java/lang/StringBuilder
    //   173: dup
    //   174: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   177: ldc 253
    //   179: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   182: lload 12
    //   184: invokestatic 169	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   187: invokevirtual 172	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   190: ldc 255
    //   192: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   195: aload_3
    //   196: invokevirtual 180	java/io/File:getName	()Ljava/lang/String;
    //   199: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   202: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   205: invokestatic 131	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   208: aload_3
    //   209: lload 12
    //   211: invokevirtual 259	java/io/File:setLastModified	(J)Z
    //   214: pop
    //   215: iconst_1
    //   216: ifne +8 -> 224
    //   219: aload 5
    //   221: invokevirtual 232	java/io/BufferedInputStream:close	()V
    //   224: aload 5
    //   226: areturn
    //   227: astore 6
    //   229: iconst_0
    //   230: ifne +8 -> 238
    //   233: aload 5
    //   235: invokevirtual 232	java/io/BufferedInputStream:close	()V
    //   238: aload 6
    //   240: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   16	26	63	java/io/IOException
    //   40	47	227	finally
    //   67	76	227	finally
    //   81	89	227	finally
    //   105	115	227	finally
    //   128	136	227	finally
    //   152	215	227	finally
  }

  public InputStream interceptAndPut(String paramString, InputStream paramInputStream)
    throws IOException
  {
    return new CopyingInputStream(paramInputStream, openPutStream(paramString));
  }

  OutputStream openPutStream(String paramString)
    throws IOException
  {
    return openPutStream(paramString, null);
  }

  // ERROR //
  public OutputStream openPutStream(final String paramString1, String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 58	com/facebook/internal/FileLruCache:directory	Ljava/io/File;
    //   4: invokestatic 281	com/facebook/internal/FileLruCache$BufferFile:newFile	(Ljava/io/File;)Ljava/io/File;
    //   7: astore_3
    //   8: aload_3
    //   9: invokevirtual 115	java/io/File:delete	()Z
    //   12: pop
    //   13: aload_3
    //   14: invokevirtual 284	java/io/File:createNewFile	()Z
    //   17: ifne +34 -> 51
    //   20: new 207	java/io/IOException
    //   23: dup
    //   24: new 152	java/lang/StringBuilder
    //   27: dup
    //   28: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   31: ldc_w 286
    //   34: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: aload_3
    //   38: invokevirtual 289	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   41: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   47: invokespecial 292	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   50: athrow
    //   51: new 294	java/io/FileOutputStream
    //   54: dup
    //   55: aload_3
    //   56: invokespecial 295	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   59: astore 5
    //   61: new 297	java/io/BufferedOutputStream
    //   64: dup
    //   65: new 299	com/facebook/internal/FileLruCache$CloseCallbackOutputStream
    //   68: dup
    //   69: aload 5
    //   71: new 301	com/facebook/internal/FileLruCache$1
    //   74: dup
    //   75: aload_0
    //   76: aload_1
    //   77: aload_3
    //   78: invokespecial 303	com/facebook/internal/FileLruCache$1:<init>	(Lcom/facebook/internal/FileLruCache;Ljava/lang/String;Ljava/io/File;)V
    //   81: invokespecial 306	com/facebook/internal/FileLruCache$CloseCallbackOutputStream:<init>	(Ljava/io/OutputStream;Lcom/facebook/internal/FileLruCache$StreamCloseCallback;)V
    //   84: sipush 8192
    //   87: invokespecial 309	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;I)V
    //   90: astore 6
    //   92: new 234	org/json/JSONObject
    //   95: dup
    //   96: invokespecial 310	org/json/JSONObject:<init>	()V
    //   99: astore 7
    //   101: aload 7
    //   103: ldc 8
    //   105: aload_1
    //   106: invokevirtual 314	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   109: pop
    //   110: aload_2
    //   111: invokestatic 318	com/facebook/internal/Utility:isNullOrEmpty	(Ljava/lang/String;)Z
    //   114: ifne +12 -> 126
    //   117: aload 7
    //   119: ldc 11
    //   121: aload_2
    //   122: invokevirtual 314	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   125: pop
    //   126: aload 6
    //   128: aload 7
    //   130: invokestatic 322	com/facebook/internal/FileLruCache$StreamHeader:writeHeader	(Ljava/io/OutputStream;Lorg/json/JSONObject;)V
    //   133: iconst_1
    //   134: ifne +8 -> 142
    //   137: aload 6
    //   139: invokevirtual 323	java/io/BufferedOutputStream:close	()V
    //   142: aload 6
    //   144: areturn
    //   145: astore 12
    //   147: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   150: iconst_5
    //   151: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   154: new 152	java/lang/StringBuilder
    //   157: dup
    //   158: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   161: ldc_w 325
    //   164: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: aload 12
    //   169: invokevirtual 172	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   172: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   175: invokestatic 328	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V
    //   178: new 207	java/io/IOException
    //   181: dup
    //   182: aload 12
    //   184: invokevirtual 331	java/io/FileNotFoundException:getMessage	()Ljava/lang/String;
    //   187: invokespecial 292	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   190: athrow
    //   191: astore 9
    //   193: getstatic 123	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   196: iconst_5
    //   197: getstatic 32	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   200: new 152	java/lang/StringBuilder
    //   203: dup
    //   204: invokespecial 153	java/lang/StringBuilder:<init>	()V
    //   207: ldc_w 333
    //   210: invokevirtual 159	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: aload 9
    //   215: invokevirtual 172	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   218: invokevirtual 183	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   221: invokestatic 328	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V
    //   224: new 207	java/io/IOException
    //   227: dup
    //   228: aload 9
    //   230: invokevirtual 334	org/json/JSONException:getMessage	()Ljava/lang/String;
    //   233: invokespecial 292	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   236: athrow
    //   237: astore 8
    //   239: iconst_0
    //   240: ifne +8 -> 248
    //   243: aload 6
    //   245: invokevirtual 323	java/io/BufferedOutputStream:close	()V
    //   248: aload 8
    //   250: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   51	61	145	java/io/FileNotFoundException
    //   92	126	191	org/json/JSONException
    //   126	133	191	org/json/JSONException
    //   92	126	237	finally
    //   126	133	237	finally
    //   193	237	237	finally
  }

  long sizeInBytesForTest()
  {
    long l;
    synchronized (this.lock)
    {
      while (true)
      {
        boolean bool = this.isTrimPending;
        if (!bool)
          break;
        try
        {
          this.lock.wait();
        }
        catch (InterruptedException localInterruptedException)
        {
        }
      }
      File[] arrayOfFile = this.directory.listFiles();
      l = 0L;
      int i = arrayOfFile.length;
      int j = 0;
      if (j < i)
      {
        l += arrayOfFile[j].length();
        j++;
      }
    }
    return l;
  }

  public String toString()
  {
    return "{FileLruCache: tag:" + this.tag + " file:" + this.directory.getName() + "}";
  }

  private static class BufferFile
  {
    private static final String FILE_NAME_PREFIX = "buffer";
    private static final FilenameFilter filterExcludeBufferFiles = new FilenameFilter()
    {
      public boolean accept(File paramAnonymousFile, String paramAnonymousString)
      {
        return !paramAnonymousString.startsWith("buffer");
      }
    };
    private static final FilenameFilter filterExcludeNonBufferFiles = new FilenameFilter()
    {
      public boolean accept(File paramAnonymousFile, String paramAnonymousString)
      {
        return paramAnonymousString.startsWith("buffer");
      }
    };

    static void deleteAll(File paramFile)
    {
      File[] arrayOfFile = paramFile.listFiles(excludeNonBufferFiles());
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++)
        arrayOfFile[j].delete();
    }

    static FilenameFilter excludeBufferFiles()
    {
      return filterExcludeBufferFiles;
    }

    static FilenameFilter excludeNonBufferFiles()
    {
      return filterExcludeNonBufferFiles;
    }

    static File newFile(File paramFile)
    {
      return new File(paramFile, "buffer" + Long.valueOf(FileLruCache.bufferIndex.incrementAndGet()).toString());
    }
  }

  private static class CloseCallbackOutputStream extends OutputStream
  {
    final FileLruCache.StreamCloseCallback callback;
    final OutputStream innerStream;

    CloseCallbackOutputStream(OutputStream paramOutputStream, FileLruCache.StreamCloseCallback paramStreamCloseCallback)
    {
      this.innerStream = paramOutputStream;
      this.callback = paramStreamCloseCallback;
    }

    public void close()
      throws IOException
    {
      try
      {
        this.innerStream.close();
        return;
      }
      finally
      {
        this.callback.onClose();
      }
    }

    public void flush()
      throws IOException
    {
      this.innerStream.flush();
    }

    public void write(int paramInt)
      throws IOException
    {
      this.innerStream.write(paramInt);
    }

    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      this.innerStream.write(paramArrayOfByte);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      this.innerStream.write(paramArrayOfByte, paramInt1, paramInt2);
    }
  }

  private static final class CopyingInputStream extends InputStream
  {
    final InputStream input;
    final OutputStream output;

    CopyingInputStream(InputStream paramInputStream, OutputStream paramOutputStream)
    {
      this.input = paramInputStream;
      this.output = paramOutputStream;
    }

    public int available()
      throws IOException
    {
      return this.input.available();
    }

    public void close()
      throws IOException
    {
      try
      {
        this.input.close();
        return;
      }
      finally
      {
        this.output.close();
      }
    }

    public void mark(int paramInt)
    {
      throw new UnsupportedOperationException();
    }

    public boolean markSupported()
    {
      return false;
    }

    public int read()
      throws IOException
    {
      int i = this.input.read();
      if (i >= 0)
        this.output.write(i);
      return i;
    }

    public int read(byte[] paramArrayOfByte)
      throws IOException
    {
      int i = this.input.read(paramArrayOfByte);
      if (i > 0)
        this.output.write(paramArrayOfByte, 0, i);
      return i;
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int i = this.input.read(paramArrayOfByte, paramInt1, paramInt2);
      if (i > 0)
        this.output.write(paramArrayOfByte, paramInt1, i);
      return i;
    }

    public void reset()
    {
      try
      {
        throw new UnsupportedOperationException();
      }
      finally
      {
      }
    }

    public long skip(long paramLong)
      throws IOException
    {
      byte[] arrayOfByte = new byte[1024];
      int i;
      for (long l = 0L; ; l += i)
        if (l < paramLong)
        {
          i = read(arrayOfByte, 0, (int)Math.min(paramLong - l, arrayOfByte.length));
          if (i >= 0);
        }
        else
        {
          return l;
        }
    }
  }

  public static final class Limits
  {
    private int byteCount = 1048576;
    private int fileCount = 1024;

    int getByteCount()
    {
      return this.byteCount;
    }

    int getFileCount()
    {
      return this.fileCount;
    }

    void setByteCount(int paramInt)
    {
      if (paramInt < 0)
        throw new InvalidParameterException("Cache byte-count limit must be >= 0");
      this.byteCount = paramInt;
    }

    void setFileCount(int paramInt)
    {
      if (paramInt < 0)
        throw new InvalidParameterException("Cache file count limit must be >= 0");
      this.fileCount = paramInt;
    }
  }

  private static final class ModifiedFile
    implements Comparable<ModifiedFile>
  {
    private final File file;
    private final long modified;

    ModifiedFile(File paramFile)
    {
      this.file = paramFile;
      this.modified = paramFile.lastModified();
    }

    public int compareTo(ModifiedFile paramModifiedFile)
    {
      if (getModified() < paramModifiedFile.getModified())
        return -1;
      if (getModified() > paramModifiedFile.getModified())
        return 1;
      return getFile().compareTo(paramModifiedFile.getFile());
    }

    public boolean equals(Object paramObject)
    {
      return ((paramObject instanceof ModifiedFile)) && (compareTo((ModifiedFile)paramObject) == 0);
    }

    File getFile()
    {
      return this.file;
    }

    long getModified()
    {
      return this.modified;
    }
  }

  private static abstract interface StreamCloseCallback
  {
    public abstract void onClose();
  }

  private static final class StreamHeader
  {
    private static final int HEADER_VERSION;

    static JSONObject readHeader(InputStream paramInputStream)
      throws IOException
    {
      if (paramInputStream.read() != 0)
        return null;
      int i = 0;
      for (int j = 0; j < 3; j++)
      {
        int n = paramInputStream.read();
        if (n == -1)
        {
          Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: stream.read returned -1 while reading header size");
          return null;
        }
        i = (i << 8) + (n & 0xFF);
      }
      byte[] arrayOfByte = new byte[i];
      int k = 0;
      while (k < arrayOfByte.length)
      {
        int m = paramInputStream.read(arrayOfByte, k, arrayOfByte.length - k);
        if (m < 1)
        {
          Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: stream.read stopped at " + Integer.valueOf(k) + " when expected " + arrayOfByte.length);
          return null;
        }
        k += m;
      }
      JSONTokener localJSONTokener = new JSONTokener(new String(arrayOfByte));
      try
      {
        Object localObject = localJSONTokener.nextValue();
        if (!(localObject instanceof JSONObject))
        {
          Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: expected JSONObject, got " + localObject.getClass().getCanonicalName());
          return null;
        }
        JSONObject localJSONObject = (JSONObject)localObject;
        return localJSONObject;
      }
      catch (JSONException localJSONException)
      {
        throw new IOException(localJSONException.getMessage());
      }
    }

    static void writeHeader(OutputStream paramOutputStream, JSONObject paramJSONObject)
      throws IOException
    {
      byte[] arrayOfByte = paramJSONObject.toString().getBytes();
      paramOutputStream.write(0);
      paramOutputStream.write(0xFF & arrayOfByte.length >> 16);
      paramOutputStream.write(0xFF & arrayOfByte.length >> 8);
      paramOutputStream.write(0xFF & arrayOfByte.length >> 0);
      paramOutputStream.write(arrayOfByte);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.internal.FileLruCache
 * JD-Core Version:    0.6.2
 */