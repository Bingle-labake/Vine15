package android.support.v4.app;

import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.view.DraftPagerAdapter;
import android.util.Log;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;

public abstract class DraftFragmentStatePagerAdapter extends DraftPagerAdapter
{
  private static final boolean DEBUG = false;
  private static final String TAG = "FragmentStatePagerAdapter";
  private FragmentTransaction mCurTransaction = null;
  private Fragment mCurrentPrimaryItem = null;
  private final FragmentManager mFragmentManager;
  private ArrayList<Fragment> mFragments = new ArrayList();
  private ArrayList<Fragment.SavedState> mSavedState = new ArrayList();

  public DraftFragmentStatePagerAdapter(FragmentManager paramFragmentManager)
  {
    this.mFragmentManager = paramFragmentManager;
  }

  public void destroyItem(View paramView, int paramInt, Object paramObject)
  {
    Fragment localFragment = (Fragment)paramObject;
    if (this.mCurTransaction == null)
      this.mCurTransaction = this.mFragmentManager.beginTransaction();
    while (this.mSavedState.size() <= paramInt)
      this.mSavedState.add(null);
    this.mSavedState.set(paramInt, this.mFragmentManager.saveFragmentInstanceState(localFragment));
    this.mFragments.set(paramInt, null);
    this.mCurTransaction.remove(localFragment);
  }

  public void finishUpdate(View paramView)
  {
    if (this.mCurTransaction != null)
    {
      this.mCurTransaction.commitAllowingStateLoss();
      this.mCurTransaction = null;
      this.mFragmentManager.executePendingTransactions();
    }
  }

  public abstract Fragment getItem(int paramInt);

  public Object instantiateItem(View paramView, int paramInt)
  {
    if (this.mFragments.size() > paramInt)
    {
      Fragment localFragment2 = (Fragment)this.mFragments.get(paramInt);
      if (localFragment2 != null)
        return localFragment2;
    }
    if (this.mCurTransaction == null)
      this.mCurTransaction = this.mFragmentManager.beginTransaction();
    Fragment localFragment1 = getItem(paramInt);
    if (this.mSavedState.size() > paramInt)
    {
      Fragment.SavedState localSavedState = (Fragment.SavedState)this.mSavedState.get(paramInt);
      if (localSavedState != null)
        localFragment1.setInitialSavedState(localSavedState);
    }
    while (this.mFragments.size() <= paramInt)
      this.mFragments.add(null);
    localFragment1.setMenuVisibility(false);
    this.mFragments.set(paramInt, localFragment1);
    this.mCurTransaction.add(paramView.getId(), localFragment1);
    return localFragment1;
  }

  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return ((Fragment)paramObject).getView() == paramView;
  }

  public void restoreState(Parcelable paramParcelable, ClassLoader paramClassLoader)
  {
    if (paramParcelable != null)
    {
      Bundle localBundle = (Bundle)paramParcelable;
      localBundle.setClassLoader(paramClassLoader);
      Parcelable[] arrayOfParcelable = localBundle.getParcelableArray("states");
      this.mSavedState.clear();
      this.mFragments.clear();
      if (arrayOfParcelable != null)
        for (int j = 0; j < arrayOfParcelable.length; j++)
          this.mSavedState.add((Fragment.SavedState)arrayOfParcelable[j]);
      Iterator localIterator = localBundle.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        if (str.startsWith("f"))
        {
          int i = Integer.parseInt(str.substring(1));
          Fragment localFragment = this.mFragmentManager.getFragment(localBundle, str);
          if (localFragment != null)
          {
            while (this.mFragments.size() <= i)
              this.mFragments.add(null);
            localFragment.setMenuVisibility(false);
            this.mFragments.set(i, localFragment);
          }
          else
          {
            Log.w("FragmentStatePagerAdapter", "Bad fragment at key " + str);
          }
        }
      }
    }
  }

  public Parcelable saveState()
  {
    int i = this.mSavedState.size();
    Bundle localBundle = null;
    if (i > 0)
    {
      localBundle = new Bundle();
      Fragment.SavedState[] arrayOfSavedState = new Fragment.SavedState[this.mSavedState.size()];
      this.mSavedState.toArray(arrayOfSavedState);
      localBundle.putParcelableArray("states", arrayOfSavedState);
    }
    for (int j = 0; j < this.mFragments.size(); j++)
    {
      Fragment localFragment = (Fragment)this.mFragments.get(j);
      if (localFragment != null)
      {
        if (localBundle == null)
          localBundle = new Bundle();
        String str = "f" + j;
        this.mFragmentManager.putFragment(localBundle, str, localFragment);
      }
    }
    return localBundle;
  }

  public void setPrimaryItem(View paramView, int paramInt, Object paramObject)
  {
    Fragment localFragment = (Fragment)paramObject;
    if (localFragment != this.mCurrentPrimaryItem)
    {
      if (this.mCurrentPrimaryItem != null)
        this.mCurrentPrimaryItem.setMenuVisibility(false);
      if (localFragment != null)
        localFragment.setMenuVisibility(true);
      this.mCurrentPrimaryItem = localFragment;
    }
  }

  public void startUpdate(View paramView)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.app.DraftFragmentStatePagerAdapter
 * JD-Core Version:    0.6.2
 */