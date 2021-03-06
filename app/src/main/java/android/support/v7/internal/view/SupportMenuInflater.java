package android.support.v7.internal.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.view.ActionProvider;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.util.AttributeSet;
import android.util.Log;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class SupportMenuInflater extends MenuInflater
{
  private static final Class<?>[] ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE = ACTION_VIEW_CONSTRUCTOR_SIGNATURE;
  private static final Class<?>[] ACTION_VIEW_CONSTRUCTOR_SIGNATURE = { Context.class };
  private static final String LOG_TAG = "SupportMenuInflater";
  private static final int NO_ID = 0;
  private static final String XML_GROUP = "group";
  private static final String XML_ITEM = "item";
  private static final String XML_MENU = "menu";
  private final Object[] mActionProviderConstructorArguments;
  private final Object[] mActionViewConstructorArguments;
  private Context mContext;
  private Object mRealOwner;

  public SupportMenuInflater(Context paramContext)
  {
    super(paramContext);
    this.mContext = paramContext;
    this.mRealOwner = paramContext;
    this.mActionViewConstructorArguments = new Object[] { paramContext };
    this.mActionProviderConstructorArguments = this.mActionViewConstructorArguments;
  }

  private void parseMenu(XmlPullParser paramXmlPullParser, AttributeSet paramAttributeSet, Menu paramMenu)
    throws XmlPullParserException, IOException
  {
    MenuState localMenuState = new MenuState(paramMenu);
    int i = paramXmlPullParser.getEventType();
    int j = 0;
    Object localObject = null;
    String str3;
    label57: int k;
    if (i == 2)
    {
      str3 = paramXmlPullParser.getName();
      if (str3.equals("menu"))
      {
        i = paramXmlPullParser.next();
        k = 0;
        label60: if (k != 0)
          return;
      }
    }
    switch (i)
    {
    default:
    case 2:
    case 3:
      while (true)
      {
        i = paramXmlPullParser.next();
        break label60;
        throw new RuntimeException("Expecting menu, got " + str3);
        i = paramXmlPullParser.next();
        if (i != 1)
          break;
        break label57;
        if (j == 0)
        {
          String str2 = paramXmlPullParser.getName();
          if (str2.equals("group"))
          {
            localMenuState.readGroup(paramAttributeSet);
          }
          else if (str2.equals("item"))
          {
            localMenuState.readItem(paramAttributeSet);
          }
          else if (str2.equals("menu"))
          {
            parseMenu(paramXmlPullParser, paramAttributeSet, localMenuState.addSubMenuItem());
          }
          else
          {
            j = 1;
            localObject = str2;
            continue;
            String str1 = paramXmlPullParser.getName();
            if ((j != 0) && (str1.equals(localObject)))
            {
              j = 0;
              localObject = null;
            }
            else if (str1.equals("group"))
            {
              localMenuState.resetGroup();
            }
            else if (str1.equals("item"))
            {
              if (!localMenuState.hasAddedItem())
                if ((localMenuState.itemActionProvider != null) && (localMenuState.itemActionProvider.hasSubMenu()))
                  localMenuState.addSubMenuItem();
                else
                  localMenuState.addItem();
            }
            else if (str1.equals("menu"))
            {
              k = 1;
            }
          }
        }
      }
    case 1:
    }
    throw new RuntimeException("Unexpected end of document");
  }

  // ERROR //
  public void inflate(int paramInt, Menu paramMenu)
  {
    // Byte code:
    //   0: aload_2
    //   1: instanceof 151
    //   4: ifne +10 -> 14
    //   7: aload_0
    //   8: iload_1
    //   9: aload_2
    //   10: invokespecial 153	android/view/MenuInflater:inflate	(ILandroid/view/Menu;)V
    //   13: return
    //   14: aconst_null
    //   15: astore_3
    //   16: aload_0
    //   17: getfield 47	android/support/v7/internal/view/SupportMenuInflater:mContext	Landroid/content/Context;
    //   20: invokevirtual 157	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   23: iload_1
    //   24: invokevirtual 163	android/content/res/Resources:getLayout	(I)Landroid/content/res/XmlResourceParser;
    //   27: astore_3
    //   28: aload_0
    //   29: aload_3
    //   30: aload_3
    //   31: invokestatic 169	android/util/Xml:asAttributeSet	(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;
    //   34: aload_2
    //   35: invokespecial 126	android/support/v7/internal/view/SupportMenuInflater:parseMenu	(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/view/Menu;)V
    //   38: aload_3
    //   39: ifnull -26 -> 13
    //   42: aload_3
    //   43: invokeinterface 174 1 0
    //   48: return
    //   49: astore 6
    //   51: new 176	android/view/InflateException
    //   54: dup
    //   55: ldc 178
    //   57: aload 6
    //   59: invokespecial 181	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   62: athrow
    //   63: astore 5
    //   65: aload_3
    //   66: ifnull +9 -> 75
    //   69: aload_3
    //   70: invokeinterface 174 1 0
    //   75: aload 5
    //   77: athrow
    //   78: astore 4
    //   80: new 176	android/view/InflateException
    //   83: dup
    //   84: ldc 178
    //   86: aload 4
    //   88: invokespecial 181	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   91: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   16	38	49	org/xmlpull/v1/XmlPullParserException
    //   16	38	63	finally
    //   51	63	63	finally
    //   80	92	63	finally
    //   16	38	78	java/io/IOException
  }

  private static class InflatedOnMenuItemClickListener
    implements MenuItem.OnMenuItemClickListener
  {
    private static final Class<?>[] PARAM_TYPES = { MenuItem.class };
    private Method mMethod;
    private Object mRealOwner;

    public InflatedOnMenuItemClickListener(Object paramObject, String paramString)
    {
      this.mRealOwner = paramObject;
      Class localClass = paramObject.getClass();
      try
      {
        this.mMethod = localClass.getMethod(paramString, PARAM_TYPES);
        return;
      }
      catch (Exception localException)
      {
        InflateException localInflateException = new InflateException("Couldn't resolve menu item onClick handler " + paramString + " in class " + localClass.getName());
        localInflateException.initCause(localException);
        throw localInflateException;
      }
    }

    public boolean onMenuItemClick(MenuItem paramMenuItem)
    {
      try
      {
        if (this.mMethod.getReturnType() == Boolean.TYPE)
          return ((Boolean)this.mMethod.invoke(this.mRealOwner, new Object[] { paramMenuItem })).booleanValue();
        this.mMethod.invoke(this.mRealOwner, new Object[] { paramMenuItem });
        return true;
      }
      catch (Exception localException)
      {
        throw new RuntimeException(localException);
      }
    }
  }

  private class MenuState
  {
    private static final int defaultGroupId = 0;
    private static final int defaultItemCategory = 0;
    private static final int defaultItemCheckable = 0;
    private static final boolean defaultItemChecked = false;
    private static final boolean defaultItemEnabled = true;
    private static final int defaultItemId = 0;
    private static final int defaultItemOrder = 0;
    private static final boolean defaultItemVisible = true;
    private int groupCategory;
    private int groupCheckable;
    private boolean groupEnabled;
    private int groupId;
    private int groupOrder;
    private boolean groupVisible;
    private ActionProvider itemActionProvider;
    private String itemActionProviderClassName;
    private String itemActionViewClassName;
    private int itemActionViewLayout;
    private boolean itemAdded;
    private char itemAlphabeticShortcut;
    private int itemCategoryOrder;
    private int itemCheckable;
    private boolean itemChecked;
    private boolean itemEnabled;
    private int itemIconResId;
    private int itemId;
    private String itemListenerMethodName;
    private char itemNumericShortcut;
    private int itemShowAsAction;
    private CharSequence itemTitle;
    private CharSequence itemTitleCondensed;
    private boolean itemVisible;
    private Menu menu;

    public MenuState(Menu arg2)
    {
      Object localObject;
      this.menu = localObject;
      resetGroup();
    }

    private char getShortcut(String paramString)
    {
      if (paramString == null)
        return '\000';
      return paramString.charAt(0);
    }

    private <T> T newInstance(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
    {
      try
      {
        Object localObject = SupportMenuInflater.this.mContext.getClassLoader().loadClass(paramString).getConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
        return localObject;
      }
      catch (Exception localException)
      {
        Log.w("SupportMenuInflater", "Cannot instantiate class: " + paramString, localException);
      }
      return null;
    }

    private void setItem(MenuItem paramMenuItem)
    {
      MenuItem localMenuItem = paramMenuItem.setChecked(this.itemChecked).setVisible(this.itemVisible).setEnabled(this.itemEnabled);
      if (this.itemCheckable >= 1);
      for (boolean bool = true; ; bool = false)
      {
        localMenuItem.setCheckable(bool).setTitleCondensed(this.itemTitleCondensed).setIcon(this.itemIconResId).setAlphabeticShortcut(this.itemAlphabeticShortcut).setNumericShortcut(this.itemNumericShortcut);
        if (this.itemShowAsAction >= 0)
          MenuItemCompat.setShowAsAction(paramMenuItem, this.itemShowAsAction);
        if (this.itemListenerMethodName == null)
          break label158;
        if (!SupportMenuInflater.this.mContext.isRestricted())
          break;
        throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
      }
      paramMenuItem.setOnMenuItemClickListener(new SupportMenuInflater.InflatedOnMenuItemClickListener(SupportMenuInflater.this.mRealOwner, this.itemListenerMethodName));
      label158: MenuItemImpl localMenuItemImpl;
      if ((paramMenuItem instanceof MenuItemImpl))
      {
        localMenuItemImpl = (MenuItemImpl)paramMenuItem;
        if ((localMenuItemImpl != null) && (this.itemCheckable >= 2))
          localMenuItemImpl.setExclusiveCheckable(true);
        String str = this.itemActionViewClassName;
        int i = 0;
        if (str != null)
        {
          MenuItemCompat.setActionView(paramMenuItem, (View)newInstance(this.itemActionViewClassName, SupportMenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionViewConstructorArguments));
          i = 1;
        }
        if (this.itemActionViewLayout > 0)
        {
          if (i != 0)
            break label277;
          MenuItemCompat.setActionView(paramMenuItem, this.itemActionViewLayout);
        }
      }
      while (true)
      {
        if (this.itemActionProvider != null)
          MenuItemCompat.setActionProvider(paramMenuItem, this.itemActionProvider);
        return;
        localMenuItemImpl = null;
        break;
        label277: Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
      }
    }

    public void addItem()
    {
      this.itemAdded = true;
      setItem(this.menu.add(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle));
    }

    public SubMenu addSubMenuItem()
    {
      this.itemAdded = true;
      SubMenu localSubMenu = this.menu.addSubMenu(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle);
      setItem(localSubMenu.getItem());
      return localSubMenu;
    }

    public boolean hasAddedItem()
    {
      return this.itemAdded;
    }

    public void readGroup(AttributeSet paramAttributeSet)
    {
      TypedArray localTypedArray = SupportMenuInflater.this.mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.MenuGroup);
      this.groupId = localTypedArray.getResourceId(1, 0);
      this.groupCategory = localTypedArray.getInt(3, 0);
      this.groupOrder = localTypedArray.getInt(4, 0);
      this.groupCheckable = localTypedArray.getInt(5, 0);
      this.groupVisible = localTypedArray.getBoolean(2, true);
      this.groupEnabled = localTypedArray.getBoolean(0, true);
      localTypedArray.recycle();
    }

    public void readItem(AttributeSet paramAttributeSet)
    {
      TypedArray localTypedArray = SupportMenuInflater.this.mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.MenuItem);
      this.itemId = localTypedArray.getResourceId(2, 0);
      int i = localTypedArray.getInt(5, this.groupCategory);
      int j = localTypedArray.getInt(6, this.groupOrder);
      this.itemCategoryOrder = (0xFFFF0000 & i | 0xFFFF & j);
      this.itemTitle = localTypedArray.getText(7);
      this.itemTitleCondensed = localTypedArray.getText(8);
      this.itemIconResId = localTypedArray.getResourceId(0, 0);
      this.itemAlphabeticShortcut = getShortcut(localTypedArray.getString(9));
      this.itemNumericShortcut = getShortcut(localTypedArray.getString(10));
      int m;
      label149: int k;
      if (localTypedArray.hasValue(11))
        if (localTypedArray.getBoolean(11, false))
        {
          m = 1;
          this.itemCheckable = m;
          this.itemChecked = localTypedArray.getBoolean(3, false);
          this.itemVisible = localTypedArray.getBoolean(4, this.groupVisible);
          this.itemEnabled = localTypedArray.getBoolean(1, this.groupEnabled);
          this.itemShowAsAction = localTypedArray.getInt(13, -1);
          this.itemListenerMethodName = localTypedArray.getString(12);
          this.itemActionViewLayout = localTypedArray.getResourceId(14, 0);
          this.itemActionViewClassName = localTypedArray.getString(15);
          this.itemActionProviderClassName = localTypedArray.getString(16);
          if (this.itemActionProviderClassName == null)
            break label318;
          k = 1;
          label247: if ((k == 0) || (this.itemActionViewLayout != 0) || (this.itemActionViewClassName != null))
            break label324;
        }
      for (this.itemActionProvider = ((ActionProvider)newInstance(this.itemActionProviderClassName, SupportMenuInflater.ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionProviderConstructorArguments)); ; this.itemActionProvider = null)
      {
        localTypedArray.recycle();
        this.itemAdded = false;
        return;
        m = 0;
        break;
        this.itemCheckable = this.groupCheckable;
        break label149;
        label318: k = 0;
        break label247;
        label324: if (k != 0)
          Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
      }
    }

    public void resetGroup()
    {
      this.groupId = 0;
      this.groupCategory = 0;
      this.groupOrder = 0;
      this.groupCheckable = 0;
      this.groupVisible = true;
      this.groupEnabled = true;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v7.internal.view.SupportMenuInflater
 * JD-Core Version:    0.6.2
 */