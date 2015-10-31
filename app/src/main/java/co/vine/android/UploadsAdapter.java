package co.vine.android;

import android.content.Context;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.support.v4.widget.CursorAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.vine.android.client.AppController;

public class UploadsAdapter extends CursorAdapter
{
  protected final AppController mAppController;

  public UploadsAdapter(Context paramContext, AppController paramAppController, int paramInt)
  {
    super(paramContext, null, paramInt);
    this.mAppController = paramAppController;
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    UploadViewHolder localUploadViewHolder = (UploadViewHolder)paramView.getTag();
    localUploadViewHolder.status.setText(2131624398);
    localUploadViewHolder.retry.setVisibility(8);
    localUploadViewHolder.loading.setVisibility(8);
    if (paramCursor.getPosition() == 0)
      localUploadViewHolder.retry.setVisibility(0);
    String str = paramCursor.getString(6);
    localUploadViewHolder.thumbnail.setImageBitmap(BitmapFactory.decodeFile(str));
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903148, paramViewGroup, false);
    localView.setTag(new UploadViewHolder(localView));
    return localView;
  }

  private class UploadViewHolder
  {
    public ProgressBar loading;
    public ImageView retry;
    public TextView status;
    public ImageView thumbnail;

    public UploadViewHolder(View arg2)
    {
      Object localObject;
      this.thumbnail = ((ImageView)localObject.findViewById(2131362115));
      this.status = ((TextView)localObject.findViewById(2131362174));
      this.retry = ((ImageView)localObject.findViewById(2131362175));
      this.loading = ((ProgressBar)localObject.findViewById(2131361821));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UploadsAdapter
 * JD-Core Version:    0.6.2
 */