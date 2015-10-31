package co.vine.android;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.support.v4.widget.CursorAdapter;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.util.Util;
import co.vine.android.widget.TagViewHolder;

public class TagsAdapter extends CursorAdapter
{
  protected final AppController mAppController;

  public TagsAdapter(Context paramContext, AppController paramAppController, int paramInt)
  {
    super(paramContext, null, paramInt);
    this.mAppController = paramAppController;
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    TagViewHolder localTagViewHolder = (TagViewHolder)paramView.getTag();
    String str = paramCursor.getString(2);
    if (!TextUtils.isEmpty(str))
    {
      ForegroundColorSpan localForegroundColorSpan = new ForegroundColorSpan(paramContext.getResources().getColor(2131296361));
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder("#");
      Util.safeSetSpan(localSpannableStringBuilder, localForegroundColorSpan, 0, localSpannableStringBuilder.length(), 33);
      localSpannableStringBuilder.append(str);
      localTagViewHolder.tagTitle.setText(localSpannableStringBuilder);
      localTagViewHolder.tagName = str;
    }
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903146, paramViewGroup, false);
    localView.setTag(new TagViewHolder(localView));
    return localView;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.TagsAdapter
 * JD-Core Version:    0.6.2
 */