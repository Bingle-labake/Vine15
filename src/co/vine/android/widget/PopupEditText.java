package co.vine.android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.widget.CursorAdapter;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.Filter;
import android.widget.Filter.FilterListener;
import android.widget.Filterable;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.MultiAutoCompleteTextView.Tokenizer;
import android.widget.PopupWindow;
import co.vine.android.R.styleable;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VineEntity.Range;
import co.vine.android.api.VineTypeAhead;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.TreeMap;

public class PopupEditText extends EditText
  implements View.OnClickListener, AdapterView.OnItemClickListener, Filter.FilterListener
{
  private static final int MSG_FILTER = 0;
  private static final int NO_CALLBACK = 0;
  private static final int TRIGGER_CALLBACK = 1;
  private ListAdapter mAdapter;
  private View.OnClickListener mClick;
  private DataSetObserver mDataSetObserver;
  private final int mDropDownHorizontalOffset;
  private final DropDownListView mDropDownList;
  private final int mDropDownVerticalOffset;
  private NavigableMap<Integer, VineEntity.Range> mEntityRanges;
  private Filterable mFilterable;
  private final FilterHandler mHandler;
  private PopupEditTextListener mListener;
  private final PopupWindow mPopup;
  private VineEntity mSelectedEntity;
  private boolean mShowRequested = false;
  private final int mThreshold;
  private long mThrottleDelay;
  private MultiAutoCompleteTextView.Tokenizer mTokenizer;

  public PopupEditText(Context paramContext)
  {
    this(paramContext, null);
  }

  public PopupEditText(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 2130772013);
  }

  public PopupEditText(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.PopupEditText, paramInt, 0);
    this.mDropDownVerticalOffset = localTypedArray.getDimensionPixelOffset(0, 0);
    this.mDropDownHorizontalOffset = localTypedArray.getDimensionPixelOffset(1, 0);
    this.mThreshold = localTypedArray.getInteger(2, 0);
    DropDownListView localDropDownListView = new DropDownListView(paramContext, null, 2130772012);
    localDropDownListView.setDividerHeight(getResources().getDimensionPixelSize(2131427353));
    localDropDownListView.setOnItemClickListener(this);
    this.mDropDownList = localDropDownListView;
    PopupWindow localPopupWindow = new PopupWindow(paramContext, paramAttributeSet, 2130772013);
    localPopupWindow.setSoftInputMode(16);
    localPopupWindow.setOutsideTouchable(false);
    localPopupWindow.setContentView(localDropDownListView);
    localPopupWindow.setHeight(-1);
    localPopupWindow.setWindowLayoutMode(-1, -1);
    localPopupWindow.setInputMethodMode(1);
    this.mPopup = localPopupWindow;
    super.setOnClickListener(this);
    this.mHandler = new FilterHandler(Looper.getMainLooper(), this);
    localTypedArray.recycle();
    this.mEntityRanges = new TreeMap();
  }

  private void atomizeEntity(int paramInt1, int paramInt2)
  {
    VineEntity.Range localRange = lookupRange(paramInt1, paramInt2);
    if ((localRange != null) && (localRange.entity != null))
    {
      this.mSelectedEntity = localRange.entity;
      Editable localEditable = getText();
      setSelection(localEditable.getSpanStart(localRange.span), localEditable.getSpanEnd(localRange.span));
      return;
    }
    this.mSelectedEntity = null;
  }

  private boolean isPopupShowing()
  {
    return this.mPopup.isShowing();
  }

  private VineEntity.Range lookupRange(int paramInt1, int paramInt2)
  {
    NavigableMap localNavigableMap = this.mEntityRanges;
    if ((localNavigableMap != null) && (!localNavigableMap.isEmpty()))
    {
      Map.Entry localEntry = localNavigableMap.floorEntry(Integer.valueOf(paramInt1));
      if (localEntry == null)
        localEntry = localNavigableMap.floorEntry(Integer.valueOf(paramInt2));
      if ((localEntry != null) && ((paramInt1 <= ((VineEntity.Range)localEntry.getValue()).upper) || (paramInt2 <= ((VineEntity.Range)localEntry.getValue()).upper)))
        return (VineEntity.Range)localEntry.getValue();
    }
    return null;
  }

  public boolean clearSelectedEntity(int paramInt, boolean paramBoolean)
  {
    if (this.mSelectedEntity != null)
    {
      this.mSelectedEntity = null;
      Editable localEditable = getText();
      int i;
      if (!TextUtils.isEmpty(localEditable))
      {
        VineEntity.Range localRange = (VineEntity.Range)this.mEntityRanges.remove(Integer.valueOf(paramInt));
        i = localEditable.getSpanStart(localRange.span);
        int j = localEditable.getSpanEnd(localRange.span);
        localEditable.removeSpan(localRange.span);
        if (!paramBoolean)
          break label102;
        localEditable.delete(i, j);
        setSelection(i);
      }
      while (true)
      {
        return true;
        label102: setSelection(i + 1);
      }
    }
    return false;
  }

  public void dismissDropDown()
  {
    this.mPopup.dismiss();
    this.mShowRequested = false;
    this.mHandler.removeMessages(0);
  }

  public ArrayList<VineEntity> getEntities()
  {
    Editable localEditable = getText();
    if ((localEditable != null) && (localEditable.length() > 0))
      try
      {
        while (Character.isWhitespace(localEditable.charAt(0)))
          localEditable.replace(0, 1, "");
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
      }
    ArrayList localArrayList = new ArrayList();
    NavigableMap localNavigableMap = this.mEntityRanges;
    if (localEditable != null)
    {
      int i = 1;
      for (int j = 0; j < localEditable.length(); j++)
        if (Character.isHighSurrogate(localEditable.charAt(j)))
        {
          VineEntity.Range localRange1;
          for (Map.Entry localEntry = localNavigableMap.ceilingEntry(Integer.valueOf(j)); localEntry != null; localEntry = localNavigableMap.ceilingEntry(Integer.valueOf(localRange1.entity.end)))
          {
            localRange1 = (VineEntity.Range)localEntry.getValue();
            int k = localEditable.getSpanStart(localRange1.span) - i;
            int m = localEditable.getSpanEnd(localRange1.span) - i;
            localRange1.entity.start = k;
            localRange1.entity.end = m;
            VineEntity.Range localRange2 = new VineEntity.Range(m, localRange1.entity, localRange1.span);
            localNavigableMap.remove(localEntry.getKey());
            localNavigableMap.put(Integer.valueOf(k), localRange2);
          }
          i++;
        }
    }
    Iterator localIterator = localNavigableMap.values().iterator();
    while (localIterator.hasNext())
      localArrayList.add(((VineEntity.Range)localIterator.next()).entity);
    localNavigableMap.clear();
    return localArrayList;
  }

  public void onClick(View paramView)
  {
    if (isPopupShowing())
    {
      this.mPopup.setInputMethodMode(1);
      showDropDown();
    }
    if (this.mClick != null)
      this.mClick.onClick(paramView);
  }

  public InputConnection onCreateInputConnection(EditorInfo paramEditorInfo)
  {
    return new PopupInputConnection(super.onCreateInputConnection(paramEditorInfo), true);
  }

  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    dismissDropDown();
  }

  public void onFilterComplete(int paramInt)
  {
    int i = getSelectionEnd();
    if (i - this.mTokenizer.findTokenStart(getText(), i) >= this.mThreshold)
    {
      showDropDown();
      return;
    }
    dismissDropDown();
  }

  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
    if (!paramBoolean)
      dismissDropDown();
  }

  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    clearComposingText();
    VineTypeAhead localVineTypeAhead;
    if ((paramAdapterView.getItemAtPosition(paramInt) instanceof VineTypeAhead))
    {
      localVineTypeAhead = (VineTypeAhead)paramAdapterView.getItemAtPosition(paramInt);
      if (this.mFilterable != null)
        break label69;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localVineTypeAhead.type;
      arrayOfObject[1] = localVineTypeAhead.token;
      CrashUtil.log("Invalid state: mFilterable=null, type={}, token={}", arrayOfObject);
    }
    while (true)
    {
      dismissDropDown();
      return;
      label69: Editable localEditable = getText();
      int i = getSelectionEnd();
      int j = this.mTokenizer.findTokenStart(localEditable, i);
      CharSequence localCharSequence = this.mTokenizer.terminateToken(this.mFilterable.getFilter().convertResultToString(localVineTypeAhead.token));
      int k = j + localVineTypeAhead.token.length();
      VineEntity localVineEntity = new VineEntity(localVineTypeAhead.type, localVineTypeAhead.token, null, j, k, paramLong);
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder(localCharSequence);
      ForegroundColorSpan localForegroundColorSpan = new ForegroundColorSpan(getResources().getColor(2131296374));
      Util.safeSetSpan(localSpannableStringBuilder, localForegroundColorSpan, 0, localVineTypeAhead.token.length(), 0);
      localEditable.replace(j, i, localSpannableStringBuilder);
      this.mEntityRanges.put(Integer.valueOf(j), new VineEntity.Range(k, localVineEntity, localForegroundColorSpan));
      if (this.mListener != null)
        this.mListener.onPopupItemSelected(j, i, localCharSequence, paramLong);
    }
  }

  public boolean onKeyPreIme(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (isPopupShowing()))
    {
      if ((paramKeyEvent.getAction() == 0) && (paramKeyEvent.getRepeatCount() == 0))
      {
        getKeyDispatcherState().startTracking(paramKeyEvent, this);
        return true;
      }
      if (paramKeyEvent.getAction() == 1)
      {
        getKeyDispatcherState().handleUpEvent(paramKeyEvent);
        if ((paramKeyEvent.isTracking()) && (!paramKeyEvent.isCanceled()))
        {
          dismissDropDown();
          return true;
        }
      }
    }
    return super.onKeyPreIme(paramInt, paramKeyEvent);
  }

  protected void onSelectionChanged(int paramInt1, int paramInt2)
  {
    super.onSelectionChanged(paramInt1, paramInt2);
    atomizeEntity(paramInt1, paramInt2);
  }

  protected void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    super.onTextChanged(paramCharSequence, paramInt1, paramInt2, paramInt3);
    NavigableMap localNavigableMap = this.mEntityRanges;
    if ((localNavigableMap != null) && (!localNavigableMap.isEmpty()))
    {
      VineEntity.Range localRange1;
      for (Map.Entry localEntry = localNavigableMap.ceilingEntry(Integer.valueOf(paramInt1)); localEntry != null; localEntry = localNavigableMap.ceilingEntry(Integer.valueOf(localRange1.entity.end)))
      {
        localRange1 = (VineEntity.Range)localEntry.getValue();
        Editable localEditable = getText();
        int i = localEditable.getSpanStart(localRange1.span);
        int j = localEditable.getSpanEnd(localRange1.span);
        localRange1.entity.start = i;
        localRange1.entity.end = j;
        VineEntity.Range localRange2 = new VineEntity.Range(j, localRange1.entity, localRange1.span);
        localNavigableMap.remove(localEntry.getKey());
        localNavigableMap.put(Integer.valueOf(i), localRange2);
      }
    }
    if (this.mSelectedEntity != null)
      clearSelectedEntity(this.mSelectedEntity.start, false);
    while (true)
    {
      if (Build.VERSION.SDK_INT < 16)
        atomizeEntity(getSelectionStart(), getSelectionEnd());
      return;
      performFilter(true);
    }
  }

  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    if (!paramBoolean)
      dismissDropDown();
  }

  public void performFilter(boolean paramBoolean)
  {
    if ((this.mTokenizer == null) || (this.mFilterable == null));
    int i;
    do
    {
      return;
      i = getSelectionEnd();
    }
    while (i < 0);
    Editable localEditable = getText();
    int j = this.mTokenizer.findTokenStart(localEditable, i);
    FilterHandler localFilterHandler = this.mHandler;
    localFilterHandler.removeMessages(0);
    if (paramBoolean);
    for (int k = 1; ; k = 0)
    {
      localFilterHandler.sendMessageDelayed(localFilterHandler.obtainMessage(0, k, 0, localEditable.subSequence(j, i)), this.mThrottleDelay);
      return;
    }
  }

  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (this.mAdapter != null)
      this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
    while (true)
    {
      this.mDropDownList.setAdapter(paramListAdapter);
      paramListAdapter.registerDataSetObserver(this.mDataSetObserver);
      this.mAdapter = paramListAdapter;
      return;
      this.mDataSetObserver = new AdapterObserver();
    }
  }

  protected boolean setFrame(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = super.setFrame(paramInt1, paramInt2, paramInt3, paramInt4);
    if (isPopupShowing())
      showDropDown();
    return bool;
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.mClick = paramOnClickListener;
  }

  public void setPopupEditTextListener(PopupEditTextListener paramPopupEditTextListener)
  {
    this.mListener = paramPopupEditTextListener;
    this.mHandler.setOnFilterListener(paramPopupEditTextListener);
  }

  public void setTokenizer(MultiAutoCompleteTextView.Tokenizer paramTokenizer, Filterable paramFilterable, long paramLong)
  {
    if (paramTokenizer == null)
      throw new IllegalArgumentException("tokenizer cannot be null.");
    if (this.mAdapter == null)
      throw new IllegalStateException("setAdapter must be called first with a non-null adapter");
    this.mFilterable = paramFilterable;
    this.mTokenizer = paramTokenizer;
    this.mThrottleDelay = paramLong;
    this.mHandler.setFilterable(paramFilterable);
  }

  public void setTypeface(Typeface paramTypeface, int paramInt)
  {
    super.setTypeface(Typefaces.get(getContext()).getContentTypeface(paramInt, 0));
  }

  public void showDropDown()
  {
    if (getWindowVisibility() == 8)
      return;
    if (this.mAdapter.getCount() == 0)
    {
      dismissDropDown();
      this.mShowRequested = true;
      return;
    }
    int i = ((View)getParent()).getWidth();
    PopupWindow localPopupWindow = this.mPopup;
    if (!localPopupWindow.isShowing())
    {
      localPopupWindow.setWidth(i);
      localPopupWindow.showAsDropDown(this, this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset);
      if (this.mListener != null)
        this.mListener.onPopupShown();
    }
    this.mDropDownList.setSelectionAfterHeaderView();
  }

  private class AdapterObserver extends DataSetObserver
  {
    public AdapterObserver()
    {
    }

    public void onChanged()
    {
      super.onChanged();
      if (PopupEditText.this.mShowRequested)
      {
        PopupEditText.this.showDropDown();
        PopupEditText.access$002(PopupEditText.this, false);
      }
    }

    public void onInvalidated()
    {
      super.onInvalidated();
      PopupEditText.this.dismissDropDown();
    }
  }

  private static class DropDownListView extends ListView
  {
    public DropDownListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
    {
      super(paramAttributeSet, paramInt);
    }

    public boolean hasFocus()
    {
      return true;
    }

    public boolean hasWindowFocus()
    {
      return true;
    }

    public boolean isFocused()
    {
      return true;
    }
  }

  private static class FilterHandler extends Handler
  {
    private Filterable mFilterable;
    private final WeakReference<Filter.FilterListener> mListenerRef;
    private PopupEditText.PopupEditTextListener mOnFilterListener;

    public FilterHandler(Looper paramLooper, Filter.FilterListener paramFilterListener)
    {
      super();
      this.mListenerRef = new WeakReference(paramFilterListener);
    }

    public void handleMessage(Message paramMessage)
    {
      Filter.FilterListener localFilterListener = (Filter.FilterListener)this.mListenerRef.get();
      if ((this.mFilterable != null) && (localFilterListener != null))
      {
        CharSequence localCharSequence = (CharSequence)paramMessage.obj;
        this.mFilterable.getFilter().filter(localCharSequence, localFilterListener);
        if ((paramMessage.arg1 == 1) && (this.mOnFilterListener != null))
          this.mOnFilterListener.onFiltering(localCharSequence);
      }
    }

    public void setFilterable(Filterable paramFilterable)
    {
      this.mFilterable = paramFilterable;
    }

    public void setOnFilterListener(PopupEditText.PopupEditTextListener paramPopupEditTextListener)
    {
      this.mOnFilterListener = paramPopupEditTextListener;
    }
  }

  public static abstract interface PopupEditTextListener
  {
    public abstract CursorAdapter getPopupAdapter();

    public abstract void onFiltering(CharSequence paramCharSequence);

    public abstract void onPopupItemSelected(int paramInt1, int paramInt2, CharSequence paramCharSequence, long paramLong);

    public abstract void onPopupShown();

    public abstract void setPopupAdapter(String paramString);
  }

  private class PopupInputConnection extends InputConnectionWrapper
  {
    public PopupInputConnection(InputConnection paramBoolean, boolean arg3)
    {
      super(bool);
    }

    public boolean deleteSurroundingText(int paramInt1, int paramInt2)
    {
      if ((PopupEditText.this.mSelectedEntity != null) && (paramInt1 > 0) && (paramInt2 == 0))
        return sendKeyEvent(new KeyEvent(0, 67));
      return super.deleteSurroundingText(paramInt1, paramInt2);
    }

    public boolean sendKeyEvent(KeyEvent paramKeyEvent)
    {
      if ((PopupEditText.this.mSelectedEntity != null) && (paramKeyEvent.getAction() == 0) && (paramKeyEvent.getKeyCode() == 67))
      {
        PopupEditText.this.clearSelectedEntity(PopupEditText.this.mSelectedEntity.start, true);
        return true;
      }
      return super.sendKeyEvent(paramKeyEvent);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.widget.PopupEditText
 * JD-Core Version:    0.6.2
 */