package co.vine.android;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import co.vine.android.client.AppController;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;

public class FindFriendsSearchFragment extends BaseControllerFragment
  implements View.OnClickListener
{
  public static final String ARG_LAYOUT = "layout";
  private StyleSpan[] mBold;
  private int mLayoutRes;

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361943:
      FlurryUtils.trackInvite("sms", "FindFriends");
      Intent localIntent2 = new Intent("android.intent.action.VIEW");
      localIntent2.setType("vnd.android-dir/mms-sms");
      int j = Util.getSmsMessageId();
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = String.valueOf(this.mAppController.getActiveId());
      localIntent2.putExtra("sms_body", getString(j, arrayOfObject2));
      startActivity(Intent.createChooser(localIntent2, getString(2131624272)));
      return;
    case 2131361944:
      FlurryUtils.trackInvite("email", "FindFriends");
      Intent localIntent1 = new Intent("android.intent.action.SENDTO", Uri.fromParts("mailto", "", null));
      localIntent1.putExtra("android.intent.extra.SUBJECT", getString(2131624119));
      int i = Util.getEmailMessageId();
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Long.valueOf(this.mAppController.getActiveId());
      localIntent1.putExtra("android.intent.extra.TEXT", getString(i, arrayOfObject1));
      startActivity(Intent.createChooser(localIntent1, getString(2131624116)));
      return;
    case 2131361942:
    }
    FlurryUtils.trackVisitSearch("FindFriends");
    startActivity(new Intent(getActivity(), SearchActivity.class));
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    StyleSpan[] arrayOfStyleSpan = new StyleSpan[1];
    arrayOfStyleSpan[0] = new StyleSpan(1);
    this.mBold = arrayOfStyleSpan;
    this.mLayoutRes = getArguments().getInt("layout", 0);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(this.mLayoutRes, paramViewGroup, false);
    Button localButton1 = (Button)localView.findViewById(2131361942);
    localButton1.setText(Util.getSpannedText(this.mBold, getString(2131624123), '"'));
    localButton1.setOnClickListener(this);
    Button localButton2 = (Button)localView.findViewById(2131361943);
    localButton2.setText(Util.getSpannedText(this.mBold, getString(2131624124), '"'));
    localButton2.setOnClickListener(this);
    Button localButton3 = (Button)localView.findViewById(2131361944);
    localButton3.setText(Util.getSpannedText(this.mBold, getString(2131624122), '"'));
    localButton3.setOnClickListener(this);
    return localView;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.FindFriendsSearchFragment
 * JD-Core Version:    0.6.2
 */