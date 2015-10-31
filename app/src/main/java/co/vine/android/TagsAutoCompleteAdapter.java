package co.vine.android;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import co.vine.android.api.VineTypeAhead;
import co.vine.android.client.AppController;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class TagsAutoCompleteAdapter extends CursorAdapter
{
  protected final ArrayList<WeakReference<TagDropDownViewHolder>> mViewHolders = new ArrayList();

  public TagsAutoCompleteAdapter(Activity paramActivity, AppController paramAppController)
  {
    super(paramActivity, null, true);
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    TagDropDownViewHolder localTagDropDownViewHolder = (TagDropDownViewHolder)paramView.getTag();
    localTagDropDownViewHolder.userId = paramCursor.getLong(1);
    localTagDropDownViewHolder.tagName.setText("#" + paramCursor.getString(2));
  }

  public Object getItem(int paramInt)
  {
    Cursor localCursor = (Cursor)super.getItem(paramInt);
    long l;
    if (localCursor != null)
      l = localCursor.getLong(1);
    for (String str = "#" + localCursor.getString(2); ; str = new String())
    {
      return new VineTypeAhead("tag", str, l);
      l = 0L;
    }
  }

  public long getItemId(int paramInt)
  {
    Cursor localCursor = (Cursor)super.getItem(paramInt);
    if (localCursor != null)
      return localCursor.getLong(1);
    return 0L;
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903146, null);
    TagDropDownViewHolder localTagDropDownViewHolder = new TagDropDownViewHolder(localView);
    this.mViewHolders.add(new WeakReference(localTagDropDownViewHolder));
    localView.setTag(localTagDropDownViewHolder);
    return localView;
  }

  private class TagDropDownViewHolder
  {
    public final TextView tagName;
    public long userId;

    public TagDropDownViewHolder(View arg2)
    {
      Object localObject;
      this.tagName = ((TextView)localObject.findViewById(2131362173));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.TagsAutoCompleteAdapter
 * JD-Core Version:    0.6.2
 */