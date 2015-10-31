package com.google.android.gms.plus;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.internal.eq;
import com.google.android.gms.internal.x;
import com.google.android.gms.plus.model.people.Person;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class PlusShare
{
  public static final String EXTRA_CALL_TO_ACTION = "com.google.android.apps.plus.CALL_TO_ACTION";
  public static final String EXTRA_CONTENT_DEEP_LINK_ID = "com.google.android.apps.plus.CONTENT_DEEP_LINK_ID";
  public static final String EXTRA_CONTENT_DEEP_LINK_METADATA = "com.google.android.apps.plus.CONTENT_DEEP_LINK_METADATA";
  public static final String EXTRA_CONTENT_URL = "com.google.android.apps.plus.CONTENT_URL";
  public static final String EXTRA_IS_INTERACTIVE_POST = "com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST";
  public static final String EXTRA_SENDER_ID = "com.google.android.apps.plus.SENDER_ID";
  public static final String KEY_CALL_TO_ACTION_DEEP_LINK_ID = "deepLinkId";
  public static final String KEY_CALL_TO_ACTION_LABEL = "label";
  public static final String KEY_CALL_TO_ACTION_URL = "url";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION = "description";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_THUMBNAIL_URL = "thumbnailUrl";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_TITLE = "title";
  public static final String PARAM_CONTENT_DEEP_LINK_ID = "deep_link_id";

  protected PlusShare()
  {
    throw new AssertionError();
  }

  public static Bundle a(String paramString1, String paramString2, Uri paramUri)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("title", paramString1);
    localBundle.putString("description", paramString2);
    if (paramUri != null)
      localBundle.putString("thumbnailUrl", paramUri.toString());
    return localBundle;
  }

  public static Person createPerson(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1))
      throw new IllegalArgumentException("MinimalPerson ID must not be empty.");
    if (TextUtils.isEmpty(paramString2))
      throw new IllegalArgumentException("Display name must not be empty.");
    return new eq(paramString2, paramString1, null, 0, null);
  }

  public static String getDeepLinkId(Intent paramIntent)
  {
    String str = null;
    if (paramIntent != null)
    {
      Uri localUri = paramIntent.getData();
      str = null;
      if (localUri != null)
        str = paramIntent.getData().getQueryParameter("deep_link_id");
    }
    return str;
  }

  public static class Builder
  {
    private boolean gR;
    private ArrayList<Uri> gS;
    private boolean gT;
    private final Intent mIntent;

    public Builder()
    {
      this("android.intent.action.SEND");
    }

    public Builder(Activity paramActivity)
    {
      this("android.intent.action.SEND", paramActivity.getPackageName(), paramActivity.getComponentName());
    }

    public Builder(Activity paramActivity, PlusClient paramPlusClient)
    {
      this(paramActivity);
      boolean bool;
      Person localPerson;
      if (paramPlusClient != null)
      {
        bool = true;
        x.a(bool, "Must include PlusClient in PlusShare.Builder constructor to create an interactive post.");
        x.a(paramPlusClient.isConnected(), "PlusClient must be connected to create an interactive post.");
        x.a(paramPlusClient.A("https://www.googleapis.com/auth/plus.login"), "Must request PLUS_LOGIN scope in PlusClient to create an interactive post.");
        this.gT = true;
        localPerson = paramPlusClient.getCurrentPerson();
        if (localPerson == null)
          break label80;
      }
      label80: for (String str = localPerson.getId(); ; str = "0")
      {
        this.mIntent.putExtra("com.google.android.apps.plus.SENDER_ID", str);
        return;
        bool = false;
        break;
      }
    }

    protected Builder(String paramString)
    {
      this.mIntent = new Intent().setAction(paramString);
    }

    protected Builder(String paramString1, String paramString2, ComponentName paramComponentName)
    {
      this(paramString1);
      this.mIntent.putExtra("android.support.v4.app.EXTRA_CALLING_PACKAGE", paramString2);
      if (paramComponentName != null)
        this.mIntent.putExtra("android.support.v4.app.EXTRA_CALLING_ACTIVITY", paramComponentName);
      this.mIntent.addFlags(524288);
      this.gR = true;
    }

    public Builder addCallToAction(String paramString1, Uri paramUri, String paramString2)
    {
      x.a(this.gR, "Must include the launching activity with PlusShare.Builder constructor before setting call-to-action");
      if ((paramUri != null) && (!TextUtils.isEmpty(paramUri.toString())));
      for (boolean bool = true; ; bool = false)
      {
        x.b(bool, "Must provide a call to action URL");
        x.a(this.gT, "Must include PlusClient in PlusShare.Builder constructor to create an interactive post");
        Bundle localBundle = new Bundle();
        if (!TextUtils.isEmpty(paramString1))
          localBundle.putString("label", paramString1);
        localBundle.putString("url", paramUri.toString());
        if (!TextUtils.isEmpty(paramString2))
          localBundle.putString("deepLinkId", paramString2);
        this.mIntent.putExtra("com.google.android.apps.plus.CALL_TO_ACTION", localBundle);
        this.mIntent.setType("text/plain");
        this.mIntent.putExtra("com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST", true);
        return this;
      }
    }

    public Builder addStream(Uri paramUri)
    {
      Uri localUri = (Uri)this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
      if (localUri == null)
        return setStream(paramUri);
      if (this.gS == null)
        this.gS = new ArrayList();
      this.gS.add(localUri);
      this.gS.add(paramUri);
      return this;
    }

    public Intent getIntent()
    {
      int i = 1;
      boolean bool1;
      boolean bool2;
      if ((this.gS != null) && (this.gS.size() > i))
      {
        int k = i;
        bool1 = this.mIntent.getAction().equals("android.intent.action.SEND_MULTIPLE");
        bool2 = this.mIntent.getBooleanExtra("com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST", false);
        if ((k != 0) && (bool2))
          break label94;
      }
      int m;
      while (true)
      {
        x.a(i, "Call-to-action buttons are only available for URLs.");
        if ((!bool2) || (this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_URL")))
          break label99;
        throw new IllegalStateException("The content URL is required for interactive posts.");
        m = 0;
        break;
        label94: int j = 0;
      }
      label99: if ((m == 0) && (bool1))
      {
        this.mIntent.setAction("android.intent.action.SEND");
        if ((this.gS != null) && (!this.gS.isEmpty()))
        {
          this.mIntent.putExtra("android.intent.extra.STREAM", (Parcelable)this.gS.get(0));
          this.gS = null;
        }
      }
      else if ((m != 0) && (!bool1))
      {
        this.mIntent.setAction("android.intent.action.SEND_MULTIPLE");
        if ((this.gS == null) || (this.gS.isEmpty()))
          break label260;
        this.mIntent.putParcelableArrayListExtra("android.intent.extra.STREAM", this.gS);
      }
      while (true)
      {
        if ((!bool2) || (this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_URL")) || (this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID")))
          break label272;
        throw new IllegalStateException("Must set content URL or content deep-link ID to use a call-to-action button.");
        this.mIntent.removeExtra("android.intent.extra.STREAM");
        break;
        label260: this.mIntent.removeExtra("android.intent.extra.STREAM");
      }
      label272: this.mIntent.setPackage("com.google.android.apps.plus");
      return this.mIntent;
    }

    public Builder setContentDeepLinkId(String paramString)
    {
      return setContentDeepLinkId(paramString, null, null, null);
    }

    public Builder setContentDeepLinkId(String paramString1, String paramString2, String paramString3, Uri paramUri)
    {
      x.b(this.gR, "Must include the launching activity with PlusShare.Builder constructor before setting deep links");
      if (!TextUtils.isEmpty(paramString1));
      for (boolean bool = true; ; bool = false)
      {
        x.b(bool, "The deepLinkId parameter is required.");
        Bundle localBundle = PlusShare.a(paramString2, paramString3, paramUri);
        this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID", paramString1);
        this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_METADATA", localBundle);
        return this;
      }
    }

    public Builder setContentUrl(Uri paramUri)
    {
      String str = null;
      if (paramUri != null)
        str = paramUri.toString();
      if (TextUtils.isEmpty(str))
      {
        this.mIntent.removeExtra("com.google.android.apps.plus.CONTENT_URL");
        return this;
      }
      this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_URL", str);
      return this;
    }

    public Builder setRecipients(List<Person> paramList)
    {
      if (paramList != null);
      for (int i = paramList.size(); i == 0; i = 0)
      {
        this.mIntent.removeExtra("com.google.android.apps.plus.RECIPIENT_IDS");
        this.mIntent.removeExtra("com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES");
        return this;
      }
      ArrayList localArrayList1 = new ArrayList(i);
      ArrayList localArrayList2 = new ArrayList(i);
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Person localPerson = (Person)localIterator.next();
        localArrayList1.add(localPerson.getId());
        localArrayList2.add(localPerson.getDisplayName());
      }
      this.mIntent.putStringArrayListExtra("com.google.android.apps.plus.RECIPIENT_IDS", localArrayList1);
      this.mIntent.putStringArrayListExtra("com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES", localArrayList2);
      return this;
    }

    public Builder setStream(Uri paramUri)
    {
      this.gS = null;
      this.mIntent.putExtra("android.intent.extra.STREAM", paramUri);
      return this;
    }

    public Builder setText(CharSequence paramCharSequence)
    {
      this.mIntent.putExtra("android.intent.extra.TEXT", paramCharSequence);
      return this;
    }

    public Builder setType(String paramString)
    {
      this.mIntent.setType(paramString);
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.PlusShare
 * JD-Core Version:    0.6.2
 */