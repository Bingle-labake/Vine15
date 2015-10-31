package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TabHost;
import android.widget.TextView;

public class TabIndicator extends RelativeLayout
{
  private ImageView mIcon;
  private int mIconNewResId;
  private int mIconResId;
  private boolean mNew;
  private ImageView mNewIndicator;
  private TextView mTabText;

  public TabIndicator(Context paramContext)
  {
    super(paramContext);
  }

  public TabIndicator(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public TabIndicator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public static TabIndicator newIconIndicator(LayoutInflater paramLayoutInflater, int paramInt1, TabHost paramTabHost, int paramInt2, int paramInt3)
  {
    TabIndicator localTabIndicator = (TabIndicator)paramLayoutInflater.inflate(paramInt1, paramTabHost.getTabWidget(), false);
    if (paramInt2 > 0)
      localTabIndicator.setTabIcon(paramInt2, paramInt3);
    return localTabIndicator;
  }

  public static TabIndicator newTextIndicator(LayoutInflater paramLayoutInflater, int paramInt1, TabHost paramTabHost, int paramInt2, boolean paramBoolean)
  {
    TabIndicator localTabIndicator = (TabIndicator)paramLayoutInflater.inflate(paramInt1, paramTabHost.getTabWidget(), false);
    if (paramInt2 > 0)
      localTabIndicator.setTabText(paramInt2, paramBoolean);
    return localTabIndicator;
  }

  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    if (this.mTabText != null);
  }

  protected void onFinishInflate()
  {
    super.onFinishInflate();
    this.mTabText = ((TextView)findViewById(2131361936));
    this.mNewIndicator = ((ImageView)findViewById(2131361937));
    this.mIcon = ((ImageView)findViewById(2131361843));
  }

  public void setNew(boolean paramBoolean)
  {
    if (paramBoolean == this.mNew)
      return;
    if (this.mNewIndicator != null)
      if (paramBoolean)
        this.mNewIndicator.setVisibility(0);
    while (true)
    {
      this.mNew = paramBoolean;
      return;
      this.mNewIndicator.setVisibility(8);
      continue;
      if (this.mIconNewResId > 0)
        if (paramBoolean)
          this.mIcon.setImageResource(this.mIconNewResId);
        else
          this.mIcon.setImageResource(this.mIconResId);
    }
  }

  public void setTabIcon(int paramInt1, int paramInt2)
  {
    if (this.mIcon != null)
    {
      if (paramInt1 <= 0)
        break label38;
      this.mIcon.setImageResource(paramInt1);
      this.mIcon.setVisibility(0);
    }
    while (true)
    {
      this.mIconResId = paramInt1;
      this.mIconNewResId = paramInt2;
      return;
      label38: this.mIcon.setVisibility(8);
    }
  }

  public void setTabText(int paramInt, boolean paramBoolean)
  {
    if (this.mTabText != null)
    {
      String str = getResources().getString(paramInt).toUpperCase();
      if (paramBoolean)
        str = str.toUpperCase();
      if (paramInt > 0)
      {
        this.mTabText.setVisibility(0);
        this.mTabText.setText(str);
      }
    }
    else
    {
      return;
    }
    this.mTabText.setVisibility(8);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.TabIndicator
 * JD-Core Version:    0.6.2
 */