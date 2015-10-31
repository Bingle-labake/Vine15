package co.vine.android.views;

import android.widget.CompoundButton.OnCheckedChangeListener;

public abstract interface SwitchInterface
{
  public abstract boolean isChecked();

  public abstract void setChecked(boolean paramBoolean);

  public abstract void setEnabled(boolean paramBoolean);

  public abstract void setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener paramOnCheckedChangeListener);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.views.SwitchInterface
 * JD-Core Version:    0.6.2
 */