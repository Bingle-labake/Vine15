package co.vine.android.util.image;

import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.shapes.RoundRectShape;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.RemoteException;
import android.os.StatFs;
import android.util.FloatMath;
import co.vine.android.util.Util;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;

public class ImageUtils
{
  public static final int MAX_AVATAR_UPLOAD_SIZE_KB = 700;
  public static final int MAX_TWEET_UPLOAD_SIZE_KB = 3072;
  public static final long MIN_REQUIRED_SD_SPACE = 1048576L;
  public static final boolean SUPPORTS_FILTERS = false;
  public static final String TEMP_FILENAME_PREFIX = "pic-";
  public static final String TEMP_RESIZED_PREFIX = "pic-r-";
  private static final Paint sInStrokePaint;
  private static final Paint sOutStrokePaint;
  private static final Paint sResizePaint;
  private static final Paint sSolidStrokePaint;
  public static final PorterDuffXfermode sSrcXferMode = new PorterDuffXfermode(PorterDuff.Mode.SRC_IN);

  static
  {
    sResizePaint = new Paint(2);
    sOutStrokePaint = new Paint();
    sOutStrokePaint.setStrokeWidth(1.0F);
    sOutStrokePaint.setStyle(Paint.Style.STROKE);
    sOutStrokePaint.setColor(-2039584);
    sInStrokePaint = new Paint();
    sInStrokePaint.setStrokeWidth(1.0F);
    sInStrokePaint.setStyle(Paint.Style.STROKE);
    sInStrokePaint.setColor(-986896);
    sSolidStrokePaint = new Paint();
    sSolidStrokePaint.setStrokeWidth(3.0F);
    sSolidStrokePaint.setStyle(Paint.Style.STROKE);
    sSolidStrokePaint.setColor(-986896);
  }

  public static Bitmap adjustRotation(Context paramContext, Uri paramUri, Bitmap paramBitmap)
  {
    float f;
    switch (getExifOrientation(paramContext, paramUri))
    {
    case 4:
    case 5:
    case 7:
    default:
      return paramBitmap;
    case 3:
      f = 180.0F;
    case 8:
    case 6:
    }
    while (true)
    {
      Matrix localMatrix = new Matrix();
      localMatrix.postRotate(f);
      Bitmap localBitmap = createBitmap(paramContext, paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
      if ((localBitmap != null) && (localBitmap != paramBitmap))
        paramBitmap.recycle();
      return localBitmap;
      f = 270.0F;
      continue;
      f = 90.0F;
    }
  }

  public static Uri changeFormatIfNeeded(Context paramContext, Uri paramUri, long paramLong)
  {
    if (paramUri == null)
      return null;
    InputStream localInputStream1 = null;
    InputStream localInputStream2 = null;
    try
    {
      ContentResolver localContentResolver = paramContext.getContentResolver();
      localInputStream2 = localContentResolver.openInputStream(paramUri);
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inJustDecodeBounds = true;
      decodeStream(paramContext, localInputStream2, null, localOptions);
      boolean bool1 = localOptions.outMimeType.equals("image/jpeg");
      localInputStream1 = null;
      if (!bool1)
      {
        boolean bool2 = localOptions.outMimeType.equals("image/gif");
        localInputStream1 = null;
        if (!bool2)
        {
          boolean bool3 = localOptions.outMimeType.equals("image/png");
          if (!bool3)
            break label119;
        }
      }
      Util.closeSilently(null);
      Util.closeSilently(localInputStream2);
      return paramUri;
      label119: localInputStream1 = localContentResolver.openInputStream(paramUri);
      Bitmap localBitmap = decodeStream(paramContext, localInputStream1);
      if (localBitmap != null)
      {
        Uri localUri = writePicToFile(paramContext, localBitmap, paramLong);
        if (localUri != null)
          deleteTempPic(paramUri);
        return localUri;
      }
      return null;
    }
    catch (IOException localIOException)
    {
      return null;
    }
    finally
    {
      Util.closeSilently(localInputStream1);
      Util.closeSilently(localInputStream2);
    }
  }

  public static Bitmap createBitmap(Context paramContext, int paramInt1, int paramInt2, Bitmap.Config paramConfig)
  {
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(paramInt1, paramInt2, paramConfig);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap createBitmap(Context paramContext, Bitmap paramBitmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(paramBitmap, paramInt1, paramInt2, paramInt3, paramInt4);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap createBitmap(Context paramContext, Bitmap paramBitmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Matrix paramMatrix, boolean paramBoolean)
  {
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(paramBitmap, paramInt1, paramInt2, paramInt3, paramInt4, paramMatrix, paramBoolean);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static BitmapInfo decodeByteArray(Context paramContext, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      Bitmap localBitmap = BitmapFactory.decodeByteArray(paramArrayOfByte, paramInt1, paramInt2, localOptions);
      if (localBitmap != null)
      {
        BitmapInfo localBitmapInfo = new BitmapInfo(localBitmap, localOptions.inSampleSize, localOptions.outWidth, localOptions.outHeight);
        return localBitmapInfo;
      }
      return null;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static BitmapInfo decodeByteArray(Context paramContext, byte[] paramArrayOfByte, int paramInt1, int paramInt2, BitmapFactory.Options paramOptions)
  {
    try
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inJustDecodeBounds = true;
      BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
      int i = localOptions.outWidth;
      int j = localOptions.outHeight;
      int k = paramOptions.inSampleSize;
      Bitmap localBitmap = BitmapFactory.decodeByteArray(paramArrayOfByte, paramInt1, paramInt2, paramOptions);
      if (localBitmap != null)
      {
        BitmapInfo localBitmapInfo = new BitmapInfo(localBitmap, k, i, j);
        return localBitmapInfo;
      }
      return null;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap decodeResource(Context paramContext, Resources paramResources, int paramInt)
  {
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeResource(paramResources, paramInt);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap decodeResource(Context paramContext, Resources paramResources, int paramInt, BitmapFactory.Options paramOptions)
  {
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeResource(paramResources, paramInt, paramOptions);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap decodeStream(Context paramContext, InputStream paramInputStream)
  {
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeStream(paramInputStream);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static Bitmap decodeStream(Context paramContext, InputStream paramInputStream, Rect paramRect, BitmapFactory.Options paramOptions)
  {
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeStream(paramInputStream, paramRect, paramOptions);
      return localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
    }
    return null;
  }

  public static boolean deleteTempPic(Uri paramUri)
  {
    if (!isTempPic(paramUri))
      return false;
    return new File(paramUri.getPath()).delete();
  }

  public static int getExifOrientation(Context paramContext, Uri paramUri)
  {
    String str1 = paramUri.getScheme();
    if ((str1 == null) || ("file".equals(str1)))
      return getExifOrientation(paramUri.getPath());
    Cursor localCursor;
    if ("content".equals(str1))
    {
      ContentProviderClient localContentProviderClient = paramContext.getContentResolver().acquireContentProviderClient(paramUri);
      if (localContentProviderClient != null)
        try
        {
          localCursor = localContentProviderClient.query(paramUri, new String[] { "orientation", "_data" }, null, null, null);
          if (localCursor == null)
            return 0;
        }
        catch (RemoteException localRemoteException)
        {
          return 0;
        }
    }
    try
    {
      if (localCursor.moveToFirst())
      {
        String str2 = localCursor.getString(1);
        if (str2 != null)
        {
          int i = getExifOrientation(str2);
          if (i != 0)
            return i;
        }
        int j = localCursor.getInt(0);
        if (j != 0)
          return j;
        return 0;
      }
      return 0;
    }
    finally
    {
      localCursor.close();
    }
  }

  public static int getExifOrientation(String paramString)
  {
    if (paramString == null)
      return 0;
    try
    {
      int i = new ExifInterface(paramString).getAttributeInt("Orientation", 0);
      return i;
    }
    catch (IOException localIOException)
    {
    }
    return 0;
  }

  public static String getRealPathFromImageUri(Context paramContext, Uri paramUri)
  {
    String str1 = paramUri.getScheme();
    if ((str1 == null) || ("file".equals(str1)))
      return paramUri.getPath();
    if ("content".equals(str1))
    {
      String[] arrayOfString = { "_data" };
      Cursor localCursor = paramContext.getContentResolver().query(paramUri, arrayOfString, null, null, null);
      if (localCursor != null)
        try
        {
          if (localCursor.moveToFirst())
          {
            String str3 = localCursor.getString(0);
            if (str3 != null)
              return str3;
            String str4 = paramUri.getPath();
            return str4;
          }
          String str2 = paramUri.getPath();
          return str2;
        }
        finally
        {
          localCursor.close();
        }
    }
    return paramUri.getPath();
  }

  public static File getTempPic(Context paramContext, boolean paramBoolean, long paramLong)
  {
    File localFile = Util.getFilesDir(paramContext);
    if (localFile == null)
      return null;
    if (paramBoolean);
    for (String str = "pic-r-"; ; str = "pic-" + paramLong + "-")
      return new File(localFile, str + System.currentTimeMillis() + ".jpg");
  }

  public static boolean hasEnoughExternalStorageForNewPhoto(Context paramContext)
  {
    File localFile = Util.getFilesDir(paramContext);
    if (localFile == null);
    StatFs localStatFs;
    do
    {
      return false;
      localStatFs = new StatFs(localFile.getAbsolutePath());
    }
    while (localStatFs.getBlockSize() * localStatFs.getAvailableBlocks() <= 1048576L);
    return true;
  }

  private static boolean isPortrait(int paramInt1, int paramInt2)
  {
    return paramInt2 > paramInt1;
  }

  public static boolean isResized(Uri paramUri)
  {
    return (isTempPic(paramUri)) && (paramUri.toString().contains("pic-r-"));
  }

  public static boolean isTempPic(Uri paramUri)
  {
    return (paramUri != null) && (paramUri.getLastPathSegment() != null) && (paramUri.getLastPathSegment().startsWith("pic-"));
  }

  public static Uri processPicture(Context paramContext, Uri paramUri, long paramLong)
  {
    return resizeIfNeeded(paramContext, changeFormatIfNeeded(paramContext, paramUri, paramLong), 3072, paramLong, null);
  }

  public static void removeFiles(Context paramContext)
  {
    File localFile1 = Util.getFilesDir(paramContext);
    if (localFile1 == null);
    while (true)
    {
      return;
      File[] arrayOfFile = localFile1.listFiles();
      if (arrayOfFile != null)
      {
        int i = arrayOfFile.length;
        for (int j = 0; j < i; j++)
        {
          File localFile2 = arrayOfFile[j];
          if (!localFile2.isDirectory())
            localFile2.delete();
        }
      }
    }
  }

  public static Bitmap resizeBitmap(Context paramContext, Uri paramUri, float paramFloat1, float paramFloat2, int paramInt)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    InputStream localInputStream1 = null;
    InputStream localInputStream2 = null;
    try
    {
      localInputStream2 = localContentResolver.openInputStream(paramUri);
      BitmapFactory.Options localOptions1 = new BitmapFactory.Options();
      localOptions1.inJustDecodeBounds = true;
      decodeStream(paramContext, localInputStream2, null, localOptions1);
      float f1 = localOptions1.outWidth;
      float f2 = localOptions1.outHeight;
      float f3 = paramFloat1 - paramInt;
      float f4 = paramFloat2 - paramInt;
      localInputStream1 = localContentResolver.openInputStream(paramUri);
      float f6;
      float f7;
      float f8;
      Object localObject2;
      if ((f1 > f3) || (f2 > f4))
      {
        float f5 = f1 / f3;
        f6 = f2 / f4;
        if (f5 > f6)
        {
          f7 = f3;
          f8 = f2 / f5;
          if (f1 / f7 <= 1.0F)
            break label224;
          BitmapFactory.Options localOptions2 = new BitmapFactory.Options();
          localOptions2.inSampleSize = ((int)(f1 / f7));
          localObject2 = decodeStream(paramContext, localInputStream1, null, localOptions2);
        }
      }
      while (true)
      {
        if (localObject2 == null)
          break label258;
        Bitmap localBitmap1 = scaleBitmap(paramContext, (Bitmap)localObject2, f7, f8, paramInt);
        ((Bitmap)localObject2).recycle();
        return localBitmap1;
        f7 = f1 / f6;
        f8 = f4;
        break;
        label224: localObject2 = decodeStream(paramContext, localInputStream1);
        continue;
        f7 = f3;
        f8 = f4;
        Bitmap localBitmap2 = decodeStream(paramContext, localInputStream1);
        localObject2 = localBitmap2;
      }
      label258: return null;
    }
    catch (IOException localIOException)
    {
      return null;
    }
    finally
    {
      Util.closeSilently(localInputStream2);
      Util.closeSilently(localInputStream1);
    }
  }

  public static Bitmap resizeBitmap(Context paramContext, Uri paramUri, long paramLong, Rect paramRect)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    InputStream localInputStream1 = null;
    InputStream localInputStream2 = null;
    try
    {
      localInputStream2 = localContentResolver.openInputStream(paramUri);
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inJustDecodeBounds = true;
      decodeStream(paramContext, localInputStream2, null, localOptions);
      float f1 = localOptions.outWidth / localOptions.outHeight;
      float f2 = FloatMath.sqrt(f1 * (float)paramLong);
      float f3 = FloatMath.sqrt((float)paramLong * (1.0F / f1));
      int i = 1;
      boolean bool = localOptions.outWidth < f2;
      localInputStream1 = null;
      if ((bool) || (localOptions.outHeight > f3))
      {
        int j = localOptions.outWidth;
        int k = localOptions.outHeight;
        localInputStream1 = null;
        if (j <= k)
          break label261;
      }
      label261: double d;
      for (i = (int)Math.ceil(localOptions.outHeight / f3); ; i = (int)d)
      {
        localInputStream1 = null;
        if (paramRect != null)
        {
          paramRect.left /= i;
          paramRect.top /= i;
          paramRect.right /= i;
          paramRect.bottom /= i;
        }
        localInputStream1 = localContentResolver.openInputStream(paramUri);
        localOptions.inSampleSize = i;
        localOptions.inJustDecodeBounds = false;
        Bitmap localBitmap = decodeStream(paramContext, localInputStream1, null, localOptions);
        return localBitmap;
        d = Math.ceil(localOptions.outWidth / f2);
      }
    }
    catch (IOException localIOException)
    {
      return null;
    }
    finally
    {
      Util.closeSilently(localInputStream1);
      Util.closeSilently(localInputStream2);
    }
  }

  private static BitmapInfo resizeBitmap(Context paramContext, BitmapInfo paramBitmapInfo, int paramInt1, int paramInt2)
  {
    if (paramBitmapInfo == null)
      paramBitmapInfo = null;
    Bitmap localBitmap1;
    int i;
    int j;
    int k;
    int m;
    do
    {
      return paramBitmapInfo;
      localBitmap1 = paramBitmapInfo.bitmap;
      i = localBitmap1.getWidth();
      j = localBitmap1.getHeight();
      k = Math.max(paramInt1, paramInt2);
      m = Math.max(i, j);
    }
    while (m <= k);
    Matrix localMatrix = new Matrix();
    float f = k / m;
    localMatrix.postScale(f, f);
    Bitmap localBitmap2 = createBitmap(paramContext, localBitmap1, 0, 0, i, j, localMatrix, true);
    if (localBitmap2 != null)
    {
      localBitmap1.recycle();
      return new BitmapInfo(localBitmap2, (int)f, i, j);
    }
    return null;
  }

  public static BitmapInfo resizeBitmap(Context paramContext, InputStream paramInputStream, int paramInt1, int paramInt2)
  {
    return resizeBitmap(paramContext, safeDecode(paramContext, paramInputStream, paramInt1, paramInt2), paramInt1, paramInt2);
  }

  public static BitmapInfo resizeBitmap(Context paramContext, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return resizeBitmap(paramContext, safeDecode(paramContext, paramArrayOfByte, paramInt1, paramInt2), paramInt1, paramInt2);
  }

  public static Uri resizeIfNeeded(Context paramContext, Uri paramUri, int paramInt, long paramLong, Rect paramRect)
  {
    Uri localUri = null;
    if (paramUri == null);
    do
    {
      Bitmap localBitmap;
      do
      {
        return localUri;
        long l = paramInt * 250;
        if (Util.getFileSize(paramContext, paramUri) <= paramInt)
          break;
        localBitmap = resizeBitmap(paramContext, paramUri, l, paramRect);
        localUri = null;
      }
      while (localBitmap == null);
      localUri = writePicToFile(paramContext, localBitmap, paramLong);
    }
    while (localUri == null);
    deleteTempPic(paramUri);
    return localUri;
    return paramUri;
  }

  public static Bitmap roundBitmapCorners(Context paramContext, Bitmap paramBitmap, int paramInt1, int paramInt2, float paramFloat)
  {
    Bitmap localBitmap = createBitmap(paramContext, paramInt1, paramInt2, Bitmap.Config.ARGB_8888);
    if (localBitmap == null)
      return null;
    Canvas localCanvas = new Canvas(localBitmap);
    Paint localPaint = new Paint(3);
    RoundRectShape localRoundRectShape = new RoundRectShape(new float[] { paramFloat, paramFloat, paramFloat, paramFloat, paramFloat, paramFloat, paramFloat, paramFloat }, null, null);
    localRoundRectShape.resize(paramInt1, paramInt2);
    localRoundRectShape.draw(localCanvas, localPaint);
    localPaint.setXfermode(sSrcXferMode);
    if ((paramBitmap.getWidth() != paramInt1) || (paramBitmap.getHeight() != paramInt2))
    {
      localCanvas.drawBitmap(paramBitmap, new Rect(0, 0, paramBitmap.getWidth(), paramBitmap.getHeight()), new Rect(0, 0, paramInt1, paramInt2), localPaint);
      return localBitmap;
    }
    localCanvas.drawBitmap(paramBitmap, 0.0F, 0.0F, localPaint);
    return localBitmap;
  }

  public static BitmapInfo safeDecode(Context paramContext, Uri paramUri, int paramInt1, int paramInt2)
  {
    return safeDecode(paramContext, paramUri, paramInt1, paramInt2, false);
  }

  public static BitmapInfo safeDecode(Context paramContext, Uri paramUri, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    InputStream localInputStream1 = null;
    InputStream localInputStream2 = null;
    try
    {
      ContentResolver localContentResolver = paramContext.getContentResolver();
      if ((localContentResolver == null) || (paramUri == null))
      {
        Util.closeSilently(null);
        Util.closeSilently(null);
        return null;
      }
      localInputStream1 = localContentResolver.openInputStream(paramUri);
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inJustDecodeBounds = true;
      decodeStream(paramContext, localInputStream1, null, localOptions);
      int i = localOptions.outWidth;
      int j = localOptions.outHeight;
      setBitmapOptionsScale(localOptions, paramInt1, paramInt2, paramBoolean);
      localInputStream2 = localContentResolver.openInputStream(paramUri);
      Bitmap localBitmap1 = decodeStream(paramContext, localInputStream2, null, localOptions);
      if (localBitmap1 == null)
        return null;
      Bitmap localBitmap2 = adjustRotation(paramContext, paramUri, localBitmap1);
      if (localBitmap2 == null)
        localBitmap2 = localBitmap1;
      while (true)
      {
        BitmapInfo localBitmapInfo = new BitmapInfo(localBitmap2, localOptions.inSampleSize, i, j);
        return localBitmapInfo;
        boolean bool1 = isPortrait(i, j);
        boolean bool2 = isPortrait(localBitmap2.getWidth(), localBitmap2.getHeight());
        if (bool1 != bool2)
        {
          int k = j;
          j = i;
          i = k;
        }
      }
    }
    catch (SecurityException|FileNotFoundException localSecurityException)
    {
      return null;
    }
    finally
    {
      Util.closeSilently(localInputStream1);
      Util.closeSilently(localInputStream2);
    }
  }

  // ERROR //
  public static BitmapInfo safeDecode(Context paramContext, InputStream paramInputStream, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 492	co/vine/android/util/Util:getTempFile	(Landroid/content/Context;)Ljava/io/File;
    //   4: astore 4
    //   6: aconst_null
    //   7: astore 5
    //   9: new 494	java/io/FileOutputStream
    //   12: dup
    //   13: aload 4
    //   15: invokespecial 497	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   18: astore 6
    //   20: aload_1
    //   21: aload 6
    //   23: sipush 4096
    //   26: invokestatic 501	co/vine/android/util/Util:readFullyWriteTo	(Ljava/io/InputStream;Ljava/io/OutputStream;I)I
    //   29: istore 12
    //   31: iload 12
    //   33: ifne +16 -> 49
    //   36: aload 6
    //   38: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   41: aload 4
    //   43: invokevirtual 240	java/io/File:delete	()Z
    //   46: pop
    //   47: aconst_null
    //   48: areturn
    //   49: aload 6
    //   51: invokevirtual 504	java/io/FileOutputStream:flush	()V
    //   54: aload 6
    //   56: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   59: aconst_null
    //   60: astore 13
    //   62: aconst_null
    //   63: astore 14
    //   65: new 506	java/io/BufferedInputStream
    //   68: dup
    //   69: new 508	java/io/FileInputStream
    //   72: dup
    //   73: aload 4
    //   75: invokespecial 509	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   78: invokespecial 512	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   81: astore 15
    //   83: new 132	android/graphics/BitmapFactory$Options
    //   86: dup
    //   87: invokespecial 133	android/graphics/BitmapFactory$Options:<init>	()V
    //   90: astore 16
    //   92: aload 16
    //   94: iconst_1
    //   95: putfield 136	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   98: aload 15
    //   100: aconst_null
    //   101: aload 16
    //   103: invokestatic 222	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   106: pop
    //   107: new 506	java/io/BufferedInputStream
    //   110: dup
    //   111: new 508	java/io/FileInputStream
    //   114: dup
    //   115: aload 4
    //   117: invokespecial 509	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   120: invokespecial 512	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   123: astore 23
    //   125: aload 16
    //   127: getfield 200	android/graphics/BitmapFactory$Options:outWidth	I
    //   130: istore 26
    //   132: aload 16
    //   134: getfield 203	android/graphics/BitmapFactory$Options:outHeight	I
    //   137: istore 27
    //   139: aload 16
    //   141: iload_2
    //   142: iload_3
    //   143: iconst_0
    //   144: invokestatic 485	co/vine/android/util/image/ImageUtils:setBitmapOptionsScale	(Landroid/graphics/BitmapFactory$Options;IIZ)V
    //   147: aload 23
    //   149: aconst_null
    //   150: aload 16
    //   152: invokestatic 222	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   155: astore 28
    //   157: aload 28
    //   159: ifnull +78 -> 237
    //   162: new 194	co/vine/android/util/image/ImageUtils$BitmapInfo
    //   165: dup
    //   166: aload 28
    //   168: aload 16
    //   170: getfield 197	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   173: iload 26
    //   175: iload 27
    //   177: invokespecial 206	co/vine/android/util/image/ImageUtils$BitmapInfo:<init>	(Landroid/graphics/Bitmap;III)V
    //   180: astore 29
    //   182: aload 15
    //   184: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   187: aload 23
    //   189: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   192: aload 4
    //   194: invokevirtual 240	java/io/File:delete	()Z
    //   197: pop
    //   198: aload 29
    //   200: areturn
    //   201: astore 35
    //   203: aload 5
    //   205: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   208: aload 4
    //   210: invokevirtual 240	java/io/File:delete	()Z
    //   213: pop
    //   214: aconst_null
    //   215: areturn
    //   216: astore 11
    //   218: aload 5
    //   220: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   223: aload 11
    //   225: athrow
    //   226: astore 8
    //   228: aload 4
    //   230: invokevirtual 240	java/io/File:delete	()Z
    //   233: pop
    //   234: aload 8
    //   236: athrow
    //   237: aload 15
    //   239: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   242: aload 23
    //   244: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   247: aload 4
    //   249: invokevirtual 240	java/io/File:delete	()Z
    //   252: pop
    //   253: aconst_null
    //   254: areturn
    //   255: astore 33
    //   257: aload 13
    //   259: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   262: aload 14
    //   264: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   267: aload 4
    //   269: invokevirtual 240	java/io/File:delete	()Z
    //   272: pop
    //   273: aconst_null
    //   274: areturn
    //   275: astore 32
    //   277: aload 13
    //   279: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   282: aload 14
    //   284: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   287: aload 4
    //   289: invokevirtual 240	java/io/File:delete	()Z
    //   292: pop
    //   293: aconst_null
    //   294: areturn
    //   295: astore 21
    //   297: aload 13
    //   299: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   302: aload 14
    //   304: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   307: aload 21
    //   309: athrow
    //   310: astore 8
    //   312: goto -84 -> 228
    //   315: astore 21
    //   317: aload 15
    //   319: astore 13
    //   321: aconst_null
    //   322: astore 14
    //   324: goto -27 -> 297
    //   327: astore 21
    //   329: aload 23
    //   331: astore 14
    //   333: aload 15
    //   335: astore 13
    //   337: goto -40 -> 297
    //   340: astore 19
    //   342: aload 15
    //   344: astore 13
    //   346: aconst_null
    //   347: astore 14
    //   349: goto -72 -> 277
    //   352: astore 25
    //   354: aload 23
    //   356: astore 14
    //   358: aload 15
    //   360: astore 13
    //   362: goto -85 -> 277
    //   365: astore 17
    //   367: aload 15
    //   369: astore 13
    //   371: aconst_null
    //   372: astore 14
    //   374: goto -117 -> 257
    //   377: astore 24
    //   379: aload 23
    //   381: astore 14
    //   383: aload 15
    //   385: astore 13
    //   387: goto -130 -> 257
    //   390: astore 11
    //   392: aload 6
    //   394: astore 5
    //   396: goto -178 -> 218
    //   399: astore 7
    //   401: aload 6
    //   403: astore 5
    //   405: goto -202 -> 203
    //
    // Exception table:
    //   from	to	target	type
    //   9	20	201	java/io/IOException
    //   9	20	216	finally
    //   203	208	226	finally
    //   218	226	226	finally
    //   65	83	255	java/io/IOException
    //   65	83	275	java/lang/OutOfMemoryError
    //   65	83	295	finally
    //   36	41	310	finally
    //   54	59	310	finally
    //   182	192	310	finally
    //   237	247	310	finally
    //   257	267	310	finally
    //   277	287	310	finally
    //   297	310	310	finally
    //   83	125	315	finally
    //   125	157	327	finally
    //   162	182	327	finally
    //   83	125	340	java/lang/OutOfMemoryError
    //   125	157	352	java/lang/OutOfMemoryError
    //   162	182	352	java/lang/OutOfMemoryError
    //   83	125	365	java/io/IOException
    //   125	157	377	java/io/IOException
    //   162	182	377	java/io/IOException
    //   20	31	390	finally
    //   49	54	390	finally
    //   20	31	399	java/io/IOException
    //   49	54	399	java/io/IOException
  }

  public static BitmapInfo safeDecode(Context paramContext, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inJustDecodeBounds = true;
    decodeByteArray(paramContext, paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
    int i = localOptions.outWidth;
    int j = localOptions.outHeight;
    setBitmapOptionsScale(localOptions, paramInt1, paramInt2, false);
    BitmapInfo localBitmapInfo = decodeByteArray(paramContext, paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
    if (localBitmapInfo != null)
      return new BitmapInfo(localBitmapInfo.bitmap, localOptions.inSampleSize, i, j);
    return null;
  }

  public static Bitmap scaleBitmap(Context paramContext, Bitmap paramBitmap, float paramFloat1, float paramFloat2, int paramInt)
  {
    Bitmap localBitmap = createBitmap(paramContext, paramInt + (int)paramFloat1, paramInt + (int)paramFloat2, Bitmap.Config.ARGB_8888);
    if (localBitmap == null)
      return null;
    Canvas localCanvas = new Canvas(localBitmap);
    if (paramInt > 0)
    {
      localCanvas.drawColor(-1);
      localCanvas.drawBitmap(paramBitmap, new Rect(0, 0, paramBitmap.getWidth(), paramBitmap.getHeight()), new Rect(paramInt, paramInt, 1 + (int)paramFloat1, (int)paramFloat2), sResizePaint);
      localCanvas.drawRect(0.0F, 0.0F, paramFloat1 + paramInt - 1.0F, paramFloat2 + paramInt - 1.0F, sOutStrokePaint);
      localCanvas.drawRect(paramInt - 1, paramInt - 1, paramFloat1, paramFloat2, sInStrokePaint);
      return localBitmap;
    }
    localCanvas.drawBitmap(paramBitmap, new Rect(0, 0, paramBitmap.getWidth(), paramBitmap.getHeight()), new Rect(paramInt, paramInt, 1 + (int)paramFloat1, (int)paramFloat2), sResizePaint);
    return localBitmap;
  }

  public static void setBitmapOptionsScale(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    int i = paramOptions.outWidth;
    int j = paramOptions.outHeight;
    int k = 1;
    int m = Math.max(i, j);
    int n = Math.max(paramInt1, paramInt2);
    int i1;
    if (paramBoolean)
      i1 = 1;
    while (m / i1 >= n)
    {
      m /= 2;
      k *= 2;
      continue;
      i1 = 2;
    }
    paramOptions.inJustDecodeBounds = false;
    paramOptions.inDither = true;
    paramOptions.inPreferQualityOverSpeed = true;
    paramOptions.inSampleSize = k;
  }

  // ERROR //
  public static Uri writePicToFile(Context paramContext, Bitmap paramBitmap, long paramLong)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: iconst_1
    //   5: lload_2
    //   6: invokestatic 529	co/vine/android/util/image/ImageUtils:getTempPic	(Landroid/content/Context;ZJ)Ljava/io/File;
    //   9: astore 5
    //   11: aconst_null
    //   12: astore 6
    //   14: aload 5
    //   16: ifnull +46 -> 62
    //   19: new 494	java/io/FileOutputStream
    //   22: dup
    //   23: aload 5
    //   25: invokespecial 497	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   28: astore 7
    //   30: aload_1
    //   31: getstatic 535	android/graphics/Bitmap$CompressFormat:JPEG	Landroid/graphics/Bitmap$CompressFormat;
    //   34: bipush 85
    //   36: aload 7
    //   38: invokevirtual 539	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   41: pop
    //   42: aload_1
    //   43: invokevirtual 112	android/graphics/Bitmap:recycle	()V
    //   46: aload 5
    //   48: invokestatic 543	android/net/Uri:fromFile	(Ljava/io/File;)Landroid/net/Uri;
    //   51: astore 12
    //   53: aload 12
    //   55: astore 6
    //   57: aload 7
    //   59: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   62: aload 6
    //   64: areturn
    //   65: astore 14
    //   67: aload 4
    //   69: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   72: aconst_null
    //   73: areturn
    //   74: astore 13
    //   76: aload 4
    //   78: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   81: aconst_null
    //   82: areturn
    //   83: astore 10
    //   85: aload 4
    //   87: invokestatic 161	co/vine/android/util/Util:closeSilently	(Ljava/io/Closeable;)V
    //   90: aload 10
    //   92: athrow
    //   93: astore 10
    //   95: aload 7
    //   97: astore 4
    //   99: goto -14 -> 85
    //   102: astore 9
    //   104: aload 7
    //   106: astore 4
    //   108: goto -32 -> 76
    //   111: astore 8
    //   113: aload 7
    //   115: astore 4
    //   117: goto -50 -> 67
    //
    // Exception table:
    //   from	to	target	type
    //   19	30	65	java/io/IOException
    //   19	30	74	java/lang/OutOfMemoryError
    //   19	30	83	finally
    //   30	53	93	finally
    //   30	53	102	java/lang/OutOfMemoryError
    //   30	53	111	java/io/IOException
  }

  public static class BitmapInfo
  {
    public final Bitmap bitmap;
    public final int origHeight;
    public final int origWidth;
    public final int scale;

    public BitmapInfo(Bitmap paramBitmap, int paramInt1, int paramInt2, int paramInt3)
    {
      this.bitmap = paramBitmap;
      this.scale = paramInt1;
      this.origWidth = paramInt2;
      this.origHeight = paramInt3;
    }
  }

  private static class ImageFilenameFilter
    implements FilenameFilter
  {
    private final long mOwnerId;

    ImageFilenameFilter(long paramLong)
    {
      this.mOwnerId = paramLong;
    }

    public boolean accept(File paramFile, String paramString)
    {
      return (paramString.startsWith("pic-r-" + this.mOwnerId)) || (paramString.startsWith("pic-" + this.mOwnerId));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.image.ImageUtils
 * JD-Core Version:    0.6.2
 */