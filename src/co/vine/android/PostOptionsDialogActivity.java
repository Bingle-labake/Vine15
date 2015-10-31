package co.vine.android;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class PostOptionsDialogActivity extends SupportListActivity
  implements View.OnClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  public static final String ACTION_DELETE = "action_delete";
  public static final String ACTION_FACEBOOK = "action_facebook";
  public static final String ACTION_REPORT = "action_report";
  public static final String ACTION_SHARE_OTHER = "action_other";
  public static final String ACTION_TWITTER = "action_twitter";
  private static final int DIALOG_DELETE = 2;
  private static final int DIALOG_REPORT = 1;
  public static final String EXTRA_DELETE = "delete";
  public static final String EXTRA_DESCRIPTION = "description";
  public static final String EXTRA_NAME = "name";
  public static final String EXTRA_POST_FACEBOOK = "post_facebook";
  public static final String EXTRA_POST_ID = "post_id";
  public static final String EXTRA_POST_TWITTER = "post_twitter";
  public static final String EXTRA_REPORT = "report";
  public static final String EXTRA_SHARE_OTHER = "share_other";
  public static final String EXTRA_SHARE_URL = "share_url";
  public static final String EXTRA_THUMBNAIL_URL = "thumbnail_url";
  private static final int ID_CANCEL = 6;
  private static final int ID_DELETE = 5;
  private static final int ID_FACEBOOK = 2;
  private static final int ID_REPORT = 4;
  private static final int ID_SHARE_OTHER = 3;
  private static final int ID_TWITTER = 1;
  private ArrayAdapter<Option> mArrayAdapter;
  private boolean mDelete;
  private String mName;
  private boolean mPostFacebook;
  private long mPostId;
  private boolean mPostTwitter;
  private boolean mReport;
  private boolean mShareOther;

  @TargetApi(11)
  private void addAll(Collection<Option> paramCollection)
  {
    this.mArrayAdapter.addAll(paramCollection);
  }

  public void onClick(View paramView)
  {
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903111);
    Bundle localBundle = getIntent().getExtras();
    this.mPostTwitter = localBundle.getBoolean("post_twitter", false);
    this.mPostFacebook = localBundle.getBoolean("post_facebook", false);
    this.mShareOther = localBundle.getBoolean("share_other", false);
    this.mReport = localBundle.getBoolean("report", true);
    this.mDelete = localBundle.getBoolean("delete", false);
    this.mPostId = localBundle.getLong("post_id");
    this.mName = localBundle.getString("name");
    Resources localResources = getResources();
    this.mArrayAdapter = new OptionArrayAdapter(this, 2130903113);
    ArrayList localArrayList = new ArrayList();
    if (this.mPostTwitter)
      localArrayList.add(new Option(1, localResources.getString(2131624349)));
    if (this.mPostFacebook)
      localArrayList.add(new Option(2, localResources.getString(2131624335)));
    if (this.mShareOther)
      localArrayList.add(new Option(3, localResources.getString(2131624339)));
    if (this.mReport)
      localArrayList.add(new Option(4, localResources.getString(2131624251)));
    if (this.mDelete)
      localArrayList.add(new Option(5, localResources.getString(2131624083)));
    localArrayList.add(new Option(6, localResources.getString(2131624018)));
    if (Build.VERSION.SDK_INT >= 14)
      addAll(localArrayList);
    while (true)
    {
      setListAdapter(this.mArrayAdapter);
      getListView().setChoiceMode(0);
      getListView().setAdapter(getListAdapter());
      return;
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        Option localOption = (Option)localIterator.next();
        this.mArrayAdapter.add(localOption);
      }
    }
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("post_id", this.mPostId);
    switch (paramInt1)
    {
    default:
      return;
    case 1:
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
      localIntent.setAction("action_report");
      setResult(-1, localIntent);
      finish();
      return;
    case 2:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -1:
    }
    localIntent.setAction("action_delete");
    setResult(-1, localIntent);
    finish();
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    Intent localIntent = getIntent();
    switch (((Integer)paramView.getTag()).intValue())
    {
    default:
      return;
    case 1:
      localIntent.setAction("action_twitter");
      setResult(-1, localIntent);
      finish();
      return;
    case 2:
      localIntent.setAction("action_facebook");
      setResult(-1, localIntent);
      finish();
      return;
    case 3:
      localIntent.putExtra("post_id", this.mPostId);
      localIntent.setAction("action_other");
      setResult(-1, localIntent);
      finish();
      return;
    case 4:
      PromptDialogSupportFragment localPromptDialogSupportFragment2 = PromptDialogSupportFragment.newInstance(1);
      localPromptDialogSupportFragment2.setListener(this);
      localPromptDialogSupportFragment2.setMessage(2131624252);
      localPromptDialogSupportFragment2.setPositiveButton(2131624251);
      localPromptDialogSupportFragment2.setNeutralButton(2131624018);
      localPromptDialogSupportFragment2.show(getSupportFragmentManager());
      return;
    case 5:
      PromptDialogSupportFragment localPromptDialogSupportFragment1 = PromptDialogSupportFragment.newInstance(2);
      localPromptDialogSupportFragment1.setListener(this);
      localPromptDialogSupportFragment1.setMessage(2131624079);
      localPromptDialogSupportFragment1.setPositiveButton(2131624083);
      localPromptDialogSupportFragment1.setNeutralButton(2131624018);
      localPromptDialogSupportFragment1.show(getSupportFragmentManager());
      return;
    case 6:
    }
    setResult(0, localIntent);
    finish();
  }

  public static class Option
  {
    public int id;
    public String text;

    public Option(int paramInt, String paramString)
    {
      this.id = paramInt;
      this.text = paramString;
    }
  }

  private class OptionArrayAdapter extends ArrayAdapter<PostOptionsDialogActivity.Option>
  {
    public OptionArrayAdapter(Context paramInt, int arg3)
    {
      super(i);
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = super.getView(paramInt, paramView, paramViewGroup);
      PostOptionsDialogActivity.Option localOption = (PostOptionsDialogActivity.Option)getItem(paramInt);
      ((TextView)localView.findViewById(2131361980)).setText(localOption.text);
      localView.setTag(Integer.valueOf(localOption.id));
      return localView;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.PostOptionsDialogActivity
 * JD-Core Version:    0.6.2
 */