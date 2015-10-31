package co.vine.android.util.image;

import android.content.Context;
import android.graphics.Bitmap;
import co.vine.android.network.HttpResult;
import co.vine.android.util.UrlResourceCache;
import co.vine.android.util.Util;
import com.edisonwang.android.slog.SLog;
import com.vandalsoftware.io.DiskLruCache;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class PhotoImagesCache extends UrlResourceCache<ImageKey, UrlImage, ImageUtils.BitmapInfo>
{
  private static final String DISK_CACHE_NAME = "photos";
  private static final int INDEX_IMAGE_BYTES = 0;
  private static final int[] LOCK = new int[0];
  private static final int MAX_EXTERNAL_DISK_CACHE_SIZE = 104857600;
  private static final int MAX_INTERNAL_DISK_CACHE_SIZE = 10485760;
  private static final int VALUE_COUNT = 1;
  private static final int VERSION = 2;
  private static DiskLruCache sDiskCache;
  private static boolean sIsCacheInitialized = false;
  private final ArrayList<PhotoImagesListener> mListeners;
  private final int mMaxImageSize;

  public PhotoImagesCache(Context paramContext, int paramInt1, int paramInt2)
  {
    super(paramContext, paramInt2);
    this.mMaxImageSize = paramInt1;
    this.mListeners = new ArrayList();
  }

  static File getCacheDir()
  {
    synchronized (LOCK)
    {
      if (sDiskCache != null)
      {
        File localFile = sDiskCache.getDirectory();
        return localFile;
      }
      return null;
    }
  }

  private static DiskLruCache getDiskLruCache(Context paramContext)
  {
    synchronized (LOCK)
    {
      boolean bool = sIsCacheInitialized;
      if (bool);
    }
    try
    {
      File localFile = Util.getExternalCacheDir(paramContext);
      DiskLruCache localDiskLruCache2;
      if (localFile != null)
        localDiskLruCache2 = DiskLruCache.open(new File(localFile, "photos"), 2, 1, 104857600L);
      DiskLruCache localDiskLruCache3;
      for (localObject2 = localDiskLruCache2; ; localObject2 = localDiskLruCache3)
      {
        sDiskCache = (DiskLruCache)localObject2;
        sIsCacheInitialized = true;
        DiskLruCache localDiskLruCache1 = sDiskCache;
        return localDiskLruCache1;
        localDiskLruCache3 = DiskLruCache.open(new File(paramContext.getCacheDir(), "photos"), 2, 1, 10485760L);
      }
      localObject1 = finally;
      throw localObject1;
    }
    catch (IOException localIOException)
    {
      while (true)
        Object localObject2 = null;
    }
  }

  public void addListener(PhotoImagesListener paramPhotoImagesListener)
  {
    this.mListeners.add(paramPhotoImagesListener);
  }

  public UrlImage get(long paramLong, ImageKey paramImageKey)
  {
    return (UrlImage)super.get(paramLong, paramImageKey, paramImageKey.url, true);
  }

  public Bitmap getBitmap(long paramLong, ImageKey paramImageKey)
  {
    UrlImage localUrlImage = (UrlImage)get(paramLong, paramImageKey, paramImageKey.url, true);
    if (localUrlImage != null)
      return localUrlImage.bitmap;
    return null;
  }

  protected UrlImage instantiateResource(ImageKey paramImageKey, String paramString, ImageUtils.BitmapInfo paramBitmapInfo)
  {
    return new UrlImage(paramString, paramBitmapInfo);
  }

  // ERROR //
  protected UrlImage loadResource(long paramLong, ImageKey paramImageKey, String paramString)
  {
    // Byte code:
    //   0: aload 4
    //   2: invokestatic 129	co/vine/android/util/Util:md5Digest	(Ljava/lang/String;)Ljava/lang/String;
    //   5: astore 5
    //   7: aload 5
    //   9: ifnonnull +5 -> 14
    //   12: aconst_null
    //   13: areturn
    //   14: aconst_null
    //   15: astore 6
    //   17: aconst_null
    //   18: astore 7
    //   20: aconst_null
    //   21: astore 8
    //   23: getstatic 34	co/vine/android/util/image/PhotoImagesCache:LOCK	[I
    //   26: astore 9
    //   28: aload 9
    //   30: monitorenter
    //   31: aload_0
    //   32: getfield 133	co/vine/android/util/image/PhotoImagesCache:mContext	Landroid/content/Context;
    //   35: invokestatic 135	co/vine/android/util/image/PhotoImagesCache:getDiskLruCache	(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;
    //   38: astore 11
    //   40: aload 11
    //   42: ifnull +161 -> 203
    //   45: aload 11
    //   47: invokevirtual 139	com/vandalsoftware/io/DiskLruCache:isClosed	()Z
    //   50: istore 12
    //   52: iload 12
    //   54: ifne +149 -> 203
    //   57: aload 11
    //   59: aload 5
    //   61: invokevirtual 142	com/vandalsoftware/io/DiskLruCache:get	(Ljava/lang/String;)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;
    //   64: astore 16
    //   66: aload 16
    //   68: astore 6
    //   70: aload 6
    //   72: ifnonnull +27 -> 99
    //   75: aload 6
    //   77: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   80: aconst_null
    //   81: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   84: aconst_null
    //   85: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   88: aload 9
    //   90: monitorexit
    //   91: aconst_null
    //   92: areturn
    //   93: aload 9
    //   95: monitorexit
    //   96: aload 10
    //   98: athrow
    //   99: aload 6
    //   101: iconst_0
    //   102: invokevirtual 152	com/vandalsoftware/io/DiskLruCache$Snapshot:getInputStream	(I)Ljava/io/InputStream;
    //   105: astore 17
    //   107: aload 17
    //   109: astore 7
    //   111: aload 7
    //   113: ifnonnull +22 -> 135
    //   116: aload 6
    //   118: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   121: aload 7
    //   123: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   126: aconst_null
    //   127: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   130: aload 9
    //   132: monitorexit
    //   133: aconst_null
    //   134: areturn
    //   135: new 154	java/io/BufferedInputStream
    //   138: dup
    //   139: aload 7
    //   141: sipush 4096
    //   144: invokespecial 157	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;I)V
    //   147: astore 18
    //   149: aload_0
    //   150: aload_3
    //   151: aload 4
    //   153: aload 18
    //   155: invokevirtual 161	co/vine/android/util/image/PhotoImagesCache:obtainResource	(Lco/vine/android/util/image/ImageKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/image/UrlImage;
    //   158: astore 20
    //   160: aload 6
    //   162: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   165: aload 7
    //   167: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   170: aload 18
    //   172: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   175: aload 9
    //   177: monitorexit
    //   178: aload 20
    //   180: areturn
    //   181: astore 10
    //   183: goto -90 -> 93
    //   186: astore 15
    //   188: aload 6
    //   190: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   193: aload 7
    //   195: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   198: aload 8
    //   200: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   203: aload 9
    //   205: monitorexit
    //   206: aconst_null
    //   207: areturn
    //   208: aload 6
    //   210: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   213: aload 7
    //   215: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   218: aload 14
    //   220: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   223: aload 13
    //   225: athrow
    //   226: astore 13
    //   228: aload 18
    //   230: astore 14
    //   232: goto -24 -> 208
    //   235: astore 19
    //   237: aload 18
    //   239: astore 8
    //   241: goto -53 -> 188
    //   244: astore 10
    //   246: goto -153 -> 93
    //   249: astore 13
    //   251: aconst_null
    //   252: astore 14
    //   254: goto -46 -> 208
    //
    // Exception table:
    //   from	to	target	type
    //   160	178	181	finally
    //   57	66	186	java/io/IOException
    //   99	107	186	java/io/IOException
    //   135	149	186	java/io/IOException
    //   149	160	226	finally
    //   149	160	235	java/io/IOException
    //   31	40	244	finally
    //   45	52	244	finally
    //   75	91	244	finally
    //   93	96	244	finally
    //   116	133	244	finally
    //   188	203	244	finally
    //   203	206	244	finally
    //   208	226	244	finally
    //   57	66	249	finally
    //   99	107	249	finally
    //   135	149	249	finally
  }

  protected UrlImage obtainResource(ImageKey paramImageKey, String paramString, InputStream paramInputStream)
  {
    int i;
    if (paramImageKey.requestResize)
      i = paramImageKey.width;
    for (int j = paramImageKey.height; ; j = this.mMaxImageSize)
    {
      localUrlImage1 = instantiateResource(paramImageKey, paramString, ImageUtils.resizeBitmap(this.mContext, paramInputStream, i, j));
      if (localUrlImage1.isValid())
        break label165;
      SLog.e("Decoding error!!! Memory Low? Clear all bitmaps now!");
      ArrayList localArrayList = new ArrayList(snapShot().values());
      clear();
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        UrlImage localUrlImage2 = (UrlImage)localIterator.next();
        if (localUrlImage2.bitmap != null)
        {
          localUrlImage2.bitmap.recycle();
          localUrlImage2.bitmap = null;
        }
      }
      i = this.mMaxImageSize;
    }
    UrlImage localUrlImage1 = instantiateResource(paramImageKey, paramString, ImageUtils.resizeBitmap(this.mContext, paramInputStream, i, j));
    label165: return localUrlImage1;
  }

  protected void onResourceError(ImageKey paramImageKey, HttpResult paramHttpResult)
  {
  }

  protected void onResourceLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    for (int i = -1 + this.mListeners.size(); i >= 0; i--)
      ((PhotoImagesListener)this.mListeners.get(i)).onPhotoImageLoaded(this, paramHashMap);
  }

  public Bitmap peekBitmap(ImageKey paramImageKey)
  {
    UrlImage localUrlImage = (UrlImage)super.peek(paramImageKey);
    if (localUrlImage != null)
      return localUrlImage.bitmap;
    return null;
  }

  public void removeListener(PhotoImagesListener paramPhotoImagesListener)
  {
    this.mListeners.remove(paramPhotoImagesListener);
  }

  // ERROR //
  protected UrlImage saveResource(long paramLong, ImageKey paramImageKey, String paramString, InputStream paramInputStream)
  {
    // Byte code:
    //   0: aload 4
    //   2: invokestatic 129	co/vine/android/util/Util:md5Digest	(Ljava/lang/String;)Ljava/lang/String;
    //   5: astore 6
    //   7: aload 6
    //   9: ifnonnull +13 -> 22
    //   12: aload_0
    //   13: aload_3
    //   14: aload 4
    //   16: aload 5
    //   18: invokevirtual 161	co/vine/android/util/image/PhotoImagesCache:obtainResource	(Lco/vine/android/util/image/ImageKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/image/UrlImage;
    //   21: areturn
    //   22: aconst_null
    //   23: astore 7
    //   25: aconst_null
    //   26: astore 8
    //   28: getstatic 34	co/vine/android/util/image/PhotoImagesCache:LOCK	[I
    //   31: astore 9
    //   33: aload 9
    //   35: monitorenter
    //   36: aload_0
    //   37: getfield 133	co/vine/android/util/image/PhotoImagesCache:mContext	Landroid/content/Context;
    //   40: invokestatic 135	co/vine/android/util/image/PhotoImagesCache:getDiskLruCache	(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;
    //   43: astore 11
    //   45: aload 11
    //   47: ifnull +226 -> 273
    //   50: aload 11
    //   52: invokevirtual 139	com/vandalsoftware/io/DiskLruCache:isClosed	()Z
    //   55: istore 12
    //   57: iload 12
    //   59: ifne +214 -> 273
    //   62: iconst_0
    //   63: istore 13
    //   65: aload 11
    //   67: aload 6
    //   69: invokevirtual 263	com/vandalsoftware/io/DiskLruCache:edit	(Ljava/lang/String;)Lcom/vandalsoftware/io/DiskLruCache$Editor;
    //   72: astore 7
    //   74: aload 7
    //   76: ifnull +118 -> 194
    //   79: new 265	java/io/BufferedOutputStream
    //   82: dup
    //   83: aload 7
    //   85: iconst_0
    //   86: invokevirtual 271	com/vandalsoftware/io/DiskLruCache$Editor:newOutputStream	(I)Ljava/io/OutputStream;
    //   89: sipush 4096
    //   92: invokespecial 274	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;I)V
    //   95: astore 18
    //   97: aload_0
    //   98: aload_3
    //   99: aload 4
    //   101: new 276	co/vine/android/util/PipingInputStream
    //   104: dup
    //   105: aload 5
    //   107: aload 18
    //   109: invokespecial 279	co/vine/android/util/PipingInputStream:<init>	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   112: invokevirtual 161	co/vine/android/util/image/PhotoImagesCache:obtainResource	(Lco/vine/android/util/image/ImageKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/image/UrlImage;
    //   115: astore 20
    //   117: aload 20
    //   119: invokevirtual 180	co/vine/android/util/image/UrlImage:isValid	()Z
    //   122: istore 13
    //   124: iload 13
    //   126: ifeq +234 -> 360
    //   129: aload 18
    //   131: invokevirtual 282	java/io/BufferedOutputStream:flush	()V
    //   134: aload 18
    //   136: invokevirtual 285	java/io/BufferedOutputStream:close	()V
    //   139: aconst_null
    //   140: astore 21
    //   142: aload 7
    //   144: ifnull +18 -> 162
    //   147: iload 13
    //   149: ifeq +32 -> 181
    //   152: aload 7
    //   154: invokevirtual 288	com/vandalsoftware/io/DiskLruCache$Editor:commit	()V
    //   157: aload 11
    //   159: invokevirtual 289	com/vandalsoftware/io/DiskLruCache:flush	()V
    //   162: aload 21
    //   164: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   167: aload 9
    //   169: monitorexit
    //   170: aload 20
    //   172: areturn
    //   173: astore 10
    //   175: aload 9
    //   177: monitorexit
    //   178: aload 10
    //   180: athrow
    //   181: aload 7
    //   183: invokevirtual 292	com/vandalsoftware/io/DiskLruCache$Editor:abort	()V
    //   186: goto -24 -> 162
    //   189: astore 22
    //   191: goto -29 -> 162
    //   194: aload_0
    //   195: aload_3
    //   196: aload 4
    //   198: aload 5
    //   200: invokevirtual 161	co/vine/android/util/image/PhotoImagesCache:obtainResource	(Lco/vine/android/util/image/ImageKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/image/UrlImage;
    //   203: astore 23
    //   205: aload 7
    //   207: ifnull +17 -> 224
    //   210: iconst_0
    //   211: ifeq +23 -> 234
    //   214: aload 7
    //   216: invokevirtual 288	com/vandalsoftware/io/DiskLruCache$Editor:commit	()V
    //   219: aload 11
    //   221: invokevirtual 289	com/vandalsoftware/io/DiskLruCache:flush	()V
    //   224: aconst_null
    //   225: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   228: aload 9
    //   230: monitorexit
    //   231: aload 23
    //   233: areturn
    //   234: aload 7
    //   236: invokevirtual 292	com/vandalsoftware/io/DiskLruCache$Editor:abort	()V
    //   239: goto -15 -> 224
    //   242: astore 24
    //   244: goto -20 -> 224
    //   247: astore 16
    //   249: aload 7
    //   251: ifnull +17 -> 268
    //   254: iconst_0
    //   255: ifeq +31 -> 286
    //   258: aload 7
    //   260: invokevirtual 288	com/vandalsoftware/io/DiskLruCache$Editor:commit	()V
    //   263: aload 11
    //   265: invokevirtual 289	com/vandalsoftware/io/DiskLruCache:flush	()V
    //   268: aload 8
    //   270: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   273: aload 9
    //   275: monitorexit
    //   276: aload_0
    //   277: aload_3
    //   278: aload 4
    //   280: aload 5
    //   282: invokevirtual 161	co/vine/android/util/image/PhotoImagesCache:obtainResource	(Lco/vine/android/util/image/ImageKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/image/UrlImage;
    //   285: areturn
    //   286: aload 7
    //   288: invokevirtual 292	com/vandalsoftware/io/DiskLruCache$Editor:abort	()V
    //   291: goto -23 -> 268
    //   294: astore 17
    //   296: goto -28 -> 268
    //   299: astore 14
    //   301: aload 7
    //   303: ifnull +18 -> 321
    //   306: iload 13
    //   308: ifeq +21 -> 329
    //   311: aload 7
    //   313: invokevirtual 288	com/vandalsoftware/io/DiskLruCache$Editor:commit	()V
    //   316: aload 11
    //   318: invokevirtual 289	com/vandalsoftware/io/DiskLruCache:flush	()V
    //   321: aload 8
    //   323: invokestatic 146	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   326: aload 14
    //   328: athrow
    //   329: aload 7
    //   331: invokevirtual 292	com/vandalsoftware/io/DiskLruCache$Editor:abort	()V
    //   334: goto -13 -> 321
    //   337: astore 15
    //   339: goto -18 -> 321
    //   342: astore 14
    //   344: aload 18
    //   346: astore 8
    //   348: goto -47 -> 301
    //   351: astore 19
    //   353: aload 18
    //   355: astore 8
    //   357: goto -108 -> 249
    //   360: aload 18
    //   362: astore 21
    //   364: goto -222 -> 142
    //
    // Exception table:
    //   from	to	target	type
    //   36	45	173	finally
    //   50	57	173	finally
    //   152	162	173	finally
    //   162	170	173	finally
    //   175	178	173	finally
    //   181	186	173	finally
    //   214	224	173	finally
    //   224	231	173	finally
    //   234	239	173	finally
    //   258	268	173	finally
    //   268	273	173	finally
    //   273	276	173	finally
    //   286	291	173	finally
    //   311	321	173	finally
    //   321	329	173	finally
    //   329	334	173	finally
    //   152	162	189	java/io/IOException
    //   181	186	189	java/io/IOException
    //   214	224	242	java/io/IOException
    //   234	239	242	java/io/IOException
    //   65	74	247	java/io/IOException
    //   79	97	247	java/io/IOException
    //   194	205	247	java/io/IOException
    //   258	268	294	java/io/IOException
    //   286	291	294	java/io/IOException
    //   65	74	299	finally
    //   79	97	299	finally
    //   194	205	299	finally
    //   311	321	337	java/io/IOException
    //   329	334	337	java/io/IOException
    //   97	124	342	finally
    //   129	139	342	finally
    //   97	124	351	java/io/IOException
    //   129	139	351	java/io/IOException
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.image.PhotoImagesCache
 * JD-Core Version:    0.6.2
 */