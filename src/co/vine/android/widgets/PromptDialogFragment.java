package co.vine.android.widgets;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.os.Bundle;

public class PromptDialogFragment extends DialogFragment
  implements DialogInterface.OnClickListener
{
  private static final String ARG_DIALOG_ICON = "icon";
  private static final String ARG_DIALOG_ID = "id";
  private static final String ARG_DIALOG_ITEMS = "items";
  private static final String ARG_DIALOG_ITEMS_STRING = "items_string";
  private static final String ARG_DIALOG_MESSAGE = "message";
  private static final String ARG_DIALOG_NEGATIVE_BUTTON = "negative_button";
  private static final String ARG_DIALOG_NEUTRAL_BUTTON = "neutral_button";
  private static final String ARG_DIALOG_POSITIVE_BUTTON = "positive_button";
  private static final String ARG_DIALOG_TITLE = "title";
  private OnDialogDoneListener mListener;

  public static PromptDialogFragment newInstance(int paramInt)
  {
    PromptDialogFragment localPromptDialogFragment = new PromptDialogFragment();
    Bundle localBundle = new Bundle();
    localBundle.putInt("id", paramInt);
    localPromptDialogFragment.setArguments(localBundle);
    return localPromptDialogFragment;
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    Fragment localFragment = getTargetFragment();
    if (localFragment != null)
      if ((localFragment instanceof OnDialogDoneListener))
        this.mListener = ((OnDialogDoneListener)localFragment);
    while (!(paramActivity instanceof OnDialogDoneListener))
      return;
    this.mListener = ((OnDialogDoneListener)paramActivity);
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (this.mListener != null)
      this.mListener.onDialogDone(paramDialogInterface, getArguments().getInt("id"), paramInt);
  }

  public Dialog onCreateDialog(Bundle paramBundle)
  {
    super.onCreateDialog(paramBundle);
    Bundle localBundle = getArguments();
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(getActivity(), 2);
    if (localBundle.containsKey("icon"))
      localBuilder.setIcon(localBundle.getInt("icon"));
    if (localBundle.containsKey("title"))
      localBuilder.setTitle(localBundle.getInt("title"));
    if (localBundle.containsKey("message"))
      localBuilder.setMessage(localBundle.getInt("message"));
    if (localBundle.containsKey("positive_button"))
      localBuilder.setPositiveButton(localBundle.getInt("positive_button"), this);
    if (localBundle.containsKey("neutral_button"))
      localBuilder.setNeutralButton(localBundle.getInt("neutral_button"), this);
    if (localBundle.containsKey("negative_button"))
      localBuilder.setNegativeButton(localBundle.getInt("negative_button"), this);
    if (localBundle.containsKey("items"))
      localBuilder.setItems(getResources().getTextArray(localBundle.getInt("items")), this);
    if (localBundle.containsKey("items_string"))
      localBuilder.setItems(localBundle.getStringArray("items_string"), this);
    return localBuilder.create();
  }

  public PromptDialogFragment setIcon(int paramInt)
  {
    getArguments().putInt("icon", paramInt);
    return this;
  }

  public PromptDialogFragment setItems(int paramInt)
  {
    getArguments().putInt("items", paramInt);
    return this;
  }

  public PromptDialogFragment setItems(String[] paramArrayOfString)
  {
    getArguments().putStringArray("items_string", paramArrayOfString);
    return this;
  }

  public void setListener(OnDialogDoneListener paramOnDialogDoneListener)
  {
    this.mListener = paramOnDialogDoneListener;
  }

  public PromptDialogFragment setMessage(int paramInt)
  {
    getArguments().putInt("message", paramInt);
    return this;
  }

  public PromptDialogFragment setNegativeButton(int paramInt)
  {
    getArguments().putInt("negative_button", paramInt);
    return this;
  }

  public PromptDialogFragment setNeutralButton(int paramInt)
  {
    getArguments().putInt("neutral_button", paramInt);
    return this;
  }

  public PromptDialogFragment setPositiveButton(int paramInt)
  {
    getArguments().putInt("positive_button", paramInt);
    return this;
  }

  public PromptDialogFragment setTitle(int paramInt)
  {
    getArguments().putInt("title", paramInt);
    return this;
  }

  public void show(FragmentManager paramFragmentManager)
  {
    show(paramFragmentManager, null);
  }

  public static abstract interface OnDialogDoneListener
  {
    public abstract void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widgets.PromptDialogFragment
 * JD-Core Version:    0.6.2
 */