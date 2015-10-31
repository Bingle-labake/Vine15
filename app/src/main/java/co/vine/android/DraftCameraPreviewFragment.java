package co.vine.android;

import android.content.res.Resources;
import android.graphics.Point;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;

public class DraftCameraPreviewFragment extends BaseFragment
  implements View.OnClickListener
{
  private int mDimen;
  private ImageView mIcon;
  private boolean mMasksAdjusted;
  private View mPreviewView;
  private Resources mRes;
  private Point mScreenSize;
  private final View.OnTouchListener onMaskTouchListener = new View.OnTouchListener()
  {
    public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
    {
      return true;
    }
  };

  public DraftCameraPreviewFragment()
  {
  }

  public DraftCameraPreviewFragment(int paramInt)
  {
    this.mDimen = paramInt;
  }

  public View getIconView()
  {
    return this.mPreviewView;
  }

  public void initMasks(View paramView, int paramInt1, int paramInt2)
  {
    try
    {
      if (!this.mMasksAdjusted)
      {
        this.mMasksAdjusted = true;
        View localView1 = paramView.findViewById(2131361915);
        View localView2 = paramView.findViewById(2131361916);
        localView1.setOnTouchListener(this.onMaskTouchListener);
        localView2.setOnTouchListener(this.onMaskTouchListener);
        if (paramInt2 > this.mDimen)
        {
          int i = this.mRes.getDimensionPixelOffset(2131427358);
          int j = this.mRes.getDimensionPixelOffset(2131427394) + i * 3;
          int k = paramInt2 - j - this.mDimen;
          if (k > 0)
          {
            ViewGroup.LayoutParams localLayoutParams1 = localView1.getLayoutParams();
            ViewGroup.LayoutParams localLayoutParams2 = localView2.getLayoutParams();
            localLayoutParams1.height = j;
            localLayoutParams2.height = k;
            localView1.setLayoutParams(localLayoutParams1);
            localView2.setLayoutParams(localLayoutParams2);
          }
        }
      }
      return;
    }
    finally
    {
    }
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361914:
    }
    ((AbstractRecordingActivity)getActivity()).cameraPreviewToRecorder(this.mPreviewView, this.mIcon);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mRes = getResources();
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903079, paramViewGroup, false);
    if (localView == null)
      return null;
    int i = this.mRes.getDimensionPixelOffset(2131427358);
    int j = this.mRes.getDimensionPixelOffset(2131427394);
    this.mRes.getDimensionPixelOffset(2131427361);
    RelativeLayout localRelativeLayout1 = (RelativeLayout)localView.findViewById(2131361914);
    localRelativeLayout1.setOnClickListener(this);
    RelativeLayout localRelativeLayout2 = (RelativeLayout)localRelativeLayout1.findViewById(2131361917);
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)localRelativeLayout2.getLayoutParams();
    localLayoutParams.width = this.mDimen;
    localLayoutParams.height = this.mDimen;
    localLayoutParams.topMargin = (j + i * 2);
    localRelativeLayout2.setLayoutParams(localLayoutParams);
    this.mPreviewView = localRelativeLayout2;
    this.mIcon = ((ImageView)localRelativeLayout2.findViewById(2131361918));
    Point localPoint = ((AbstractRecordingActivity)getActivity()).getScreenSize();
    this.mScreenSize = localPoint;
    int k = this.mRes.getDimensionPixelOffset(2131427355) + (j + localPoint.x);
    initMasks(localView, localPoint.x, k);
    return localView;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.DraftCameraPreviewFragment
 * JD-Core Version:    0.6.2
 */