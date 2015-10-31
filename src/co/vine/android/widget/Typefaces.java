package co.vine.android.widget;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Typeface;

public class Typefaces
{
  public static final int WEIGHT_BOLD = 4;
  public static final int WEIGHT_LIGHT = 1;
  public static final int WEIGHT_MEDIUM = 3;
  public static final int WEIGHT_NORMAL = 2;
  private static Typefaces sInstance;
  public final Typeface boldContent;
  public final Typeface boldContentBold;
  public final Typeface boldContentBoldItalic;
  public final Typeface boldContentDetail;
  public final Typeface boldContentItalic;
  public final Typeface lightContent;
  public final Typeface lightContentBold;
  public final Typeface lightContentBoldItalic;
  public final Typeface lightContentDetail;
  public final Typeface lightContentItalic;
  public final Typeface mediumContent;
  public final Typeface mediumContentBold;
  public final Typeface mediumContentBoldItalic;
  public final Typeface mediumContentDetail;
  public final Typeface mediumContentItalic;
  public final Typeface regularContent;
  public final Typeface regularContentBold;
  public final Typeface regularContentBoldItalic;
  public final Typeface regularContentDetail;
  public final Typeface regularContentItalic;

  private Typefaces(Context paramContext)
  {
    AssetManager localAssetManager = paramContext.getAssets();
    Typeface localTypeface1 = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Regular.ttf");
    this.regularContent = localTypeface1;
    this.regularContentItalic = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Italic.ttf");
    this.regularContentBold = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Bold.ttf");
    this.regularContentBoldItalic = Typeface.create(this.regularContentBold, 2);
    this.regularContentDetail = localTypeface1;
    Typeface localTypeface2 = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Bold.ttf");
    this.boldContent = localTypeface2;
    this.boldContentItalic = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-BoldItalic.ttf");
    this.boldContentBold = localTypeface2;
    this.boldContentBoldItalic = Typeface.create(localTypeface2, 2);
    this.boldContentDetail = localTypeface2;
    Typeface localTypeface3 = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Medium.ttf");
    this.mediumContent = localTypeface3;
    this.mediumContentItalic = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-MediumItalic.ttf");
    this.mediumContentBold = this.boldContent;
    this.mediumContentBoldItalic = Typeface.create(this.mediumContentBold, 2);
    this.mediumContentDetail = localTypeface3;
    Typeface localTypeface4 = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-Light.ttf");
    this.lightContent = localTypeface4;
    this.lightContentItalic = Typeface.createFromAsset(localAssetManager, "fonts/Roboto-LightItalic.ttf");
    this.lightContentBold = this.regularContent;
    this.lightContentBoldItalic = Typeface.create(this.lightContentBold, 2);
    this.lightContentDetail = localTypeface4;
  }

  public static Typefaces get(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new Typefaces(paramContext);
      Typefaces localTypefaces = sInstance;
      return localTypefaces;
    }
    finally
    {
    }
  }

  public Typeface getContentTypeface(int paramInt1, int paramInt2)
  {
    switch (paramInt2)
    {
    case 2:
    default:
      if (((paramInt1 & 0x1) != 0) && ((paramInt1 & 0x2) != 0))
        return this.regularContentBoldItalic;
      break;
    case 1:
      if (((paramInt1 & 0x1) != 0) && ((paramInt1 & 0x2) != 0))
        return this.lightContentBoldItalic;
      if ((paramInt1 & 0x1) != 0)
        return this.lightContentBold;
      if ((paramInt1 & 0x2) != 0)
        return this.lightContentItalic;
      return this.lightContent;
    case 3:
      if (((paramInt1 & 0x1) != 0) && ((paramInt1 & 0x2) != 0))
        return this.mediumContentBoldItalic;
      if ((paramInt1 & 0x1) != 0)
        return this.mediumContentBold;
      if ((paramInt1 & 0x2) != 0)
        return this.mediumContentItalic;
      return this.mediumContent;
    case 4:
      if (((paramInt1 & 0x1) != 0) && ((paramInt1 & 0x2) != 0))
        return this.boldContentBoldItalic;
      if ((paramInt1 & 0x1) != 0)
        return this.boldContentBold;
      if ((paramInt1 & 0x2) != 0)
        return this.boldContentItalic;
      return this.boldContent;
    }
    if ((paramInt1 & 0x1) != 0)
      return this.regularContentBold;
    if ((paramInt1 & 0x2) != 0)
      return this.regularContentItalic;
    return this.regularContent;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.Typefaces
 * JD-Core Version:    0.6.2
 */