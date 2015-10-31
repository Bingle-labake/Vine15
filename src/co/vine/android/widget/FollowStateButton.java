package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.Button;
import co.vine.android.R.styleable;
import co.vine.android.api.VineUser;

public class FollowStateButton extends Button
{
  public static final int STATE_FOLLOWING = 3;
  public static final int STATE_FOLLOW_REQUESTED = 4;
  public static final int STATE_NOT_FOLLOWING = 2;
  public static final int STATE_SELF = 1;
  private int mFollowRequestedDrawableRes;
  private int mFollowRequestedText;
  private int mFollowRequestedTextColor;
  private int mFollowingDrawableRes;
  private int mFollowingText;
  private int mFollowingTextColor;
  private int mNotFollowingDrawableRes;
  private int mNotFollowingText;
  private int mNotFollowingTextColor;
  private int mSelfDrawableRes;
  private int mSelfText;
  private int mSelfTextColor;
  private int mState;

  public FollowStateButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public FollowStateButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public FollowStateButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.FollowStateButton, paramInt, 0);
    this.mSelfDrawableRes = localTypedArray.getResourceId(0, 2130837672);
    this.mNotFollowingDrawableRes = localTypedArray.getResourceId(3, 2130837666);
    this.mFollowingDrawableRes = localTypedArray.getResourceId(6, 2130837669);
    this.mFollowRequestedDrawableRes = localTypedArray.getResourceId(9, 2130837675);
    this.mSelfText = localTypedArray.getResourceId(1, 2131624111);
    this.mNotFollowingText = localTypedArray.getResourceId(4, 2131624137);
    this.mFollowingText = localTypedArray.getResourceId(7, 2131624143);
    this.mFollowRequestedText = localTypedArray.getResourceId(10, 2131624142);
    Resources localResources = getResources();
    this.mSelfTextColor = localTypedArray.getColor(2, localResources.getColor(2131296314));
    this.mNotFollowingTextColor = localTypedArray.getColor(5, localResources.getColor(2131296329));
    this.mFollowingTextColor = localTypedArray.getColor(5, localResources.getColor(2131296319));
    this.mFollowRequestedTextColor = localTypedArray.getColor(11, localResources.getColor(2131296329));
    localTypedArray.recycle();
    setPadding(getResources().getDimensionPixelSize(2131427371), 0, 0, 0);
    invalidate();
  }

  private void setState(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return;
    case 1:
      setBackgroundResource(this.mSelfDrawableRes);
      setText(this.mSelfText);
      setTextColor(this.mSelfTextColor);
      this.mState = 1;
      return;
    case 2:
      setBackgroundResource(this.mNotFollowingDrawableRes);
      setText(this.mNotFollowingText);
      setTextColor(this.mNotFollowingTextColor);
      this.mState = 2;
      return;
    case 3:
      setBackgroundResource(this.mFollowingDrawableRes);
      setText(this.mFollowingText);
      setTextColor(this.mFollowingTextColor);
      this.mState = 3;
      return;
    case 4:
    }
    setBackgroundResource(this.mFollowRequestedDrawableRes);
    setText(this.mFollowRequestedText);
    setTextColor(this.mFollowRequestedTextColor);
  }

  public void follow(VineUser paramVineUser)
  {
    if (paramVineUser.isPrivate())
      if (this.mState != 4)
      {
        setState(4);
        invalidate();
      }
    while (this.mState == 3)
      return;
    setState(3);
    invalidate();
  }

  public int getState()
  {
    return this.mState;
  }

  public void setUser(long paramLong, VineUser paramVineUser)
  {
    if (paramLong == paramVineUser.userId)
      setState(1);
    while (true)
    {
      invalidate();
      return;
      if (paramVineUser.hasFollowRequested())
        setState(4);
      else if (paramVineUser.isFollowing())
        setState(3);
      else
        setState(2);
    }
  }

  public void unfollow()
  {
    if (this.mState != 2)
    {
      setState(2);
      invalidate();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.FollowStateButton
 * JD-Core Version:    0.6.2
 */