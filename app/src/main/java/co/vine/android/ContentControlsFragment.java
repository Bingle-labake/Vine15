package co.vine.android;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.Util;
import co.vine.android.views.SwitchInterface;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;

public class ContentControlsFragment extends BaseControllerFragment
  implements CompoundButton.OnCheckedChangeListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  private static final int DIALOG_MAKE_EXPLICIT = 3;
  private static final int DIALOG_MAKE_UNEXPLICIT = 4;
  private static final int DIALOG_PROTECT_POSTS = 1;
  private static final int DIALOG_UNPROTECT_POSTS = 2;
  private static final String STATE_EXPLICIT = "state_explicit";
  private static final String STATE_PRIVATE = "state_private";
  private boolean mExplicit;
  private ImageView mExplicitIcon;
  private SwitchInterface mExplicitSwitch;
  private boolean mPrivate;
  private ImageView mPrivateIcon;
  private SwitchInterface mPrivateSwitch;
  private ProgressDialog mProgress;

  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    switch (paramCompoundButton.getId())
    {
    default:
      return;
    case 2131361895:
      if (paramBoolean)
      {
        this.mPrivateIcon.setImageResource(2130837892);
        PromptDialogSupportFragment localPromptDialogSupportFragment4 = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment4.setTitle(2131624057);
        localPromptDialogSupportFragment4.setMessage(2131624058);
        localPromptDialogSupportFragment4.setNegativeButton(2131624018);
        localPromptDialogSupportFragment4.setPositiveButton(2131624056);
        localPromptDialogSupportFragment4.setTargetFragment(this, 0);
        localPromptDialogSupportFragment4.show(getActivity().getSupportFragmentManager());
        return;
      }
      this.mPrivateIcon.setImageResource(2130837891);
      PromptDialogSupportFragment localPromptDialogSupportFragment3 = PromptDialogSupportFragment.newInstance(2);
      localPromptDialogSupportFragment3.setTitle(2131624064);
      localPromptDialogSupportFragment3.setMessage(2131624065);
      localPromptDialogSupportFragment3.setNegativeButton(2131624018);
      localPromptDialogSupportFragment3.setPositiveButton(2131624063);
      localPromptDialogSupportFragment3.setTargetFragment(this, 0);
      localPromptDialogSupportFragment3.show(getActivity().getSupportFragmentManager());
      return;
    case 2131361899:
    }
    if (paramBoolean)
    {
      this.mExplicitIcon.setImageResource(2130837890);
      PromptDialogSupportFragment localPromptDialogSupportFragment2 = PromptDialogSupportFragment.newInstance(3);
      localPromptDialogSupportFragment2.setTitle(2131624052);
      localPromptDialogSupportFragment2.setMessage(2131624053);
      localPromptDialogSupportFragment2.setNegativeButton(2131624018);
      localPromptDialogSupportFragment2.setPositiveButton(2131624054);
      localPromptDialogSupportFragment2.setTargetFragment(this, 0);
      localPromptDialogSupportFragment2.show(getActivity().getSupportFragmentManager());
      return;
    }
    this.mExplicitIcon.setImageResource(2130837889);
    PromptDialogSupportFragment localPromptDialogSupportFragment1 = PromptDialogSupportFragment.newInstance(4);
    localPromptDialogSupportFragment1.setTitle(2131624060);
    localPromptDialogSupportFragment1.setMessage(2131624061);
    localPromptDialogSupportFragment1.setNegativeButton(2131624018);
    localPromptDialogSupportFragment1.setPositiveButton(2131624062);
    localPromptDialogSupportFragment1.setTargetFragment(this, 0);
    localPromptDialogSupportFragment1.show(getFragmentManager());
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ContentControlsListener();
    if (paramBundle != null)
      this.mPrivate = paramBundle.getBoolean("state_private", false);
    SharedPreferences localSharedPreferences;
    for (this.mExplicit = paramBundle.getBoolean("state_explicit", false); ; this.mExplicit = localSharedPreferences.getBoolean("settings_explicit", false))
    {
      ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog.setMessage(getString(2131624067));
      localProgressDialog.setProgressStyle(0);
      this.mProgress = localProgressDialog;
      return;
      localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
      this.mPrivate = localSharedPreferences.getBoolean("settings_private", false);
    }
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(2130903074, paramViewGroup, false);
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 1:
      switch (paramInt2)
      {
      default:
        this.mPrivate = false;
        this.mPrivateIcon.setImageResource(2130837891);
        this.mPrivateSwitch.setOnCheckedChangeListener(null);
        this.mPrivateSwitch.setChecked(false);
        this.mPrivateSwitch.setOnCheckedChangeListener(this);
        return;
      case -1:
      }
      this.mPrivate = true;
      this.mProgress.show();
      this.mAppController.updatePrivate(this.mAppController.getActiveSession(), true);
      return;
    case 2:
      switch (paramInt2)
      {
      default:
        this.mPrivate = false;
        this.mPrivateIcon.setImageResource(2130837892);
        this.mPrivateSwitch.setOnCheckedChangeListener(null);
        this.mPrivateSwitch.setChecked(true);
        this.mPrivateSwitch.setOnCheckedChangeListener(this);
        return;
      case -1:
      }
      this.mPrivate = false;
      this.mProgress.show();
      this.mAppController.updatePrivate(this.mAppController.getActiveSession(), false);
      return;
    case 3:
      switch (paramInt2)
      {
      default:
        this.mExplicit = false;
        this.mExplicitIcon.setImageResource(2130837889);
        this.mExplicitSwitch.setOnCheckedChangeListener(null);
        this.mExplicitSwitch.setChecked(false);
        this.mExplicitSwitch.setOnCheckedChangeListener(this);
        return;
      case -1:
      }
      this.mExplicit = true;
      this.mProgress.show();
      this.mAppController.updateExplicit(this.mAppController.getActiveSession(), true);
      return;
    case 4:
    }
    switch (paramInt2)
    {
    default:
      this.mExplicit = true;
      this.mExplicitIcon.setImageResource(2130837890);
      this.mExplicitSwitch.setOnCheckedChangeListener(null);
      this.mExplicitSwitch.setChecked(true);
      this.mExplicitSwitch.setOnCheckedChangeListener(this);
      return;
    case -1:
    }
    this.mExplicit = false;
    this.mProgress.show();
    this.mAppController.updateExplicit(this.mAppController.getActiveSession(), false);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("state_private", this.mPrivate);
    paramBundle.putBoolean("state_explicit", this.mExplicit);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    SwitchInterface localSwitchInterface1 = (SwitchInterface)paramView.findViewById(2131361895);
    SwitchInterface localSwitchInterface2 = (SwitchInterface)paramView.findViewById(2131361899);
    this.mPrivateIcon = ((ImageView)paramView.findViewById(2131361894));
    if (this.mPrivate)
    {
      this.mPrivateIcon.setImageResource(2130837892);
      localSwitchInterface1.setChecked(true);
      if (!BuildUtil.isExplore())
        break label130;
      paramView.findViewById(2131361896).setVisibility(8);
      paramView.findViewById(2131361900).setVisibility(8);
    }
    while (true)
    {
      localSwitchInterface1.setOnCheckedChangeListener(this);
      localSwitchInterface2.setOnCheckedChangeListener(this);
      this.mPrivateSwitch = localSwitchInterface1;
      this.mExplicitSwitch = localSwitchInterface2;
      return;
      this.mPrivateIcon.setImageResource(2130837891);
      break;
      label130: this.mExplicitIcon = ((ImageView)paramView.findViewById(2131361898));
      if (this.mExplicit)
      {
        this.mExplicitIcon.setImageResource(2130837890);
        localSwitchInterface2.setChecked(true);
      }
      else
      {
        this.mExplicitIcon.setImageResource(2130837889);
      }
    }
  }

  class ContentControlsListener extends AppSessionListener
  {
    ContentControlsListener()
    {
    }

    public void onUpdateExplicitComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (ContentControlsFragment.this.mProgress != null)
        ContentControlsFragment.this.mProgress.dismiss();
      FragmentActivity localFragmentActivity = ContentControlsFragment.this.getActivity();
      if (paramInt == 200)
      {
        SharedPreferences.Editor localEditor = Util.getDefaultSharedPrefs(ContentControlsFragment.this.getActivity()).edit();
        localEditor.putBoolean("settings_explicit", paramBoolean);
        localEditor.commit();
        return;
      }
      if (!TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(localFragmentActivity, paramString2);
        return;
      }
      Util.showCenteredToast(localFragmentActivity, 2131624066);
    }

    public void onUpdatePrivateComplete(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
    {
      if (ContentControlsFragment.this.mProgress != null)
        ContentControlsFragment.this.mProgress.dismiss();
      FragmentActivity localFragmentActivity = ContentControlsFragment.this.getActivity();
      if (paramInt == 200)
      {
        SharedPreferences.Editor localEditor = Util.getDefaultSharedPrefs(localFragmentActivity).edit();
        localEditor.putBoolean("settings_private", paramBoolean);
        localEditor.commit();
        return;
      }
      if (!TextUtils.isEmpty(paramString2))
      {
        Util.showCenteredToast(localFragmentActivity, paramString2);
        return;
      }
      Util.showCenteredToast(localFragmentActivity, 2131624066);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ContentControlsFragment
 * JD-Core Version:    0.6.2
 */