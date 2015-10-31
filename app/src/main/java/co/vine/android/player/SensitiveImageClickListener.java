package co.vine.android.player;

import android.view.View.OnClickListener;
import java.util.HashSet;

public abstract class SensitiveImageClickListener
  implements View.OnClickListener
{
  protected final HashSet<Integer> mExplicitDismissed;
  protected int mPosition;

  public SensitiveImageClickListener(HashSet<Integer> paramHashSet)
  {
    this.mExplicitDismissed = paramHashSet;
  }

  public void setPosition(int paramInt)
  {
    this.mPosition = paramInt;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.SensitiveImageClickListener
 * JD-Core Version:    0.6.2
 */