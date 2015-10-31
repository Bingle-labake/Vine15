package co.vine.android.widget;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.TypefaceSpan;

public class TypefacesSpan extends TypefaceSpan
{
  private final Typeface newType;

  public TypefacesSpan(String paramString, Typeface paramTypeface)
  {
    super(paramString);
    this.newType = paramTypeface;
  }

  private static void applyCustomTypeFace(Paint paramPaint, Typeface paramTypeface)
  {
    paramPaint.setTypeface(paramTypeface);
  }

  public void updateDrawState(TextPaint paramTextPaint)
  {
    applyCustomTypeFace(paramTextPaint, this.newType);
  }

  public void updateMeasureState(TextPaint paramTextPaint)
  {
    applyCustomTypeFace(paramTextPaint, this.newType);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.TypefacesSpan
 * JD-Core Version:    0.6.2
 */