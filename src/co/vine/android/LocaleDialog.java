package co.vine.android;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.Spinner;
import co.vine.android.util.Util;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;

public class LocaleDialog extends DialogFragment
  implements AdapterView.OnItemSelectedListener
{
  private boolean mChanges;
  private int mLastSelected;
  private RadioGroup mLocaleOptions;
  private Spinner mLocales;
  private ArrayAdapter<String> mLocalesAdapter;
  private ArrayList<Locale> mLocalesCodes;

  private static Boolean isValidLocale(Locale paramLocale)
  {
    if ((!TextUtils.isEmpty(paramLocale.getLanguage())) && (!TextUtils.isEmpty(paramLocale.getCountry())) && (TextUtils.isEmpty(paramLocale.getVariant())));
    for (boolean bool = true; ; bool = false)
      return Boolean.valueOf(bool);
  }

  static LocaleDialog newInstance()
  {
    return new LocaleDialog();
  }

  public void onCancel(DialogInterface paramDialogInterface)
  {
    super.onCancel(paramDialogInterface);
    getDialog().dismiss();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    Locale[] arrayOfLocale = Locale.getAvailableLocales();
    if (arrayOfLocale != null)
    {
      Arrays.sort(arrayOfLocale, new LocaleComparator(null));
      int i = arrayOfLocale.length;
      for (int j = 0; j < i; j++)
      {
        Locale localLocale2 = arrayOfLocale[j];
        if (isValidLocale(localLocale2).booleanValue())
        {
          String str = localLocale2.getDisplayName(Locale.ENGLISH);
          localArrayList2.add(localLocale2);
          localArrayList1.add(localLocale2.getLanguage() + " - " + str);
        }
      }
    }
    Locale localLocale1 = new Locale("en", "ss");
    localArrayList1.add("DEBUG - " + localLocale1.getLanguage() + " - " + localLocale1.getDisplayName(Locale.ENGLISH));
    localArrayList2.add(localLocale1);
    this.mLocalesCodes = localArrayList2;
    ArrayAdapter localArrayAdapter = new ArrayAdapter(getActivity(), 17367048, localArrayList1);
    localArrayAdapter.setDropDownViewResource(17367049);
    this.mLocalesAdapter = localArrayAdapter;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903102, paramViewGroup, false);
    RadioButton localRadioButton1 = (RadioButton)localView.findViewById(2131361959);
    RadioButton localRadioButton2 = (RadioButton)localView.findViewById(2131361960);
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(getActivity());
    boolean bool1 = localSharedPreferences.getBoolean("pref_custom_locale_enabled", false);
    boolean bool2;
    Spinner localSpinner;
    int i;
    label156: RadioGroup localRadioGroup;
    if (!bool1)
    {
      bool2 = true;
      localRadioButton1.setChecked(bool2);
      localRadioButton2.setChecked(bool1);
      localSpinner = (Spinner)localView.findViewById(2131361961);
      localSpinner.setAdapter(this.mLocalesAdapter);
      if (localSharedPreferences.contains("pref_custom_locale"))
      {
        String str1 = localSharedPreferences.getString("pref_custom_locale", "");
        String str2 = localSharedPreferences.getString("pref_custom_locale_country", "");
        if (!TextUtils.isEmpty(str1))
        {
          i = 0;
          Iterator localIterator = this.mLocalesCodes.iterator();
          if (localIterator.hasNext())
          {
            Locale localLocale = (Locale)localIterator.next();
            if ((!str1.equals(localLocale.getLanguage())) || (!str2.equals(localLocale.getCountry())))
              break label298;
            localSpinner.setSelection(i);
            this.mLastSelected = i;
          }
        }
      }
      localRadioGroup = (RadioGroup)localView.findViewById(2131361958);
      if (!bool1)
        break label304;
      localRadioGroup.check(2131361960);
    }
    while (true)
    {
      localRadioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
      {
        public void onCheckedChanged(RadioGroup paramAnonymousRadioGroup, int paramAnonymousInt)
        {
          Spinner localSpinner = LocaleDialog.this.mLocales;
          if (paramAnonymousInt == 2131361960);
          for (boolean bool = true; ; bool = false)
          {
            localSpinner.setEnabled(bool);
            LocaleDialog.access$202(LocaleDialog.this, true);
            return;
          }
        }
      });
      localSpinner.setEnabled(bool1);
      localSpinner.setOnItemSelectedListener(this);
      this.mLocales = localSpinner;
      this.mLocaleOptions = localRadioGroup;
      getDialog().setTitle("Custom locales");
      return localView;
      bool2 = false;
      break;
      label298: i++;
      break label156;
      label304: localRadioGroup.check(2131361959);
    }
  }

  public void onDismiss(DialogInterface paramDialogInterface)
  {
    super.onDismiss(paramDialogInterface);
    boolean bool1;
    int j;
    label46: Object localObject;
    if (this.mChanges)
    {
      if (this.mLocaleOptions.getCheckedRadioButtonId() != 2131361960)
        break label91;
      bool1 = true;
      int i = this.mLocales.getSelectedItemPosition();
      j = 0;
      Iterator localIterator = this.mLocalesCodes.iterator();
      boolean bool2 = localIterator.hasNext();
      localObject = null;
      if (bool2)
      {
        Locale localLocale = (Locale)localIterator.next();
        if (j != i)
          break label96;
        localObject = localLocale;
      }
      if (localObject != null)
        break label102;
    }
    label91: label96: label102: 
    do
    {
      return;
      bool1 = false;
      break;
      j++;
      break label46;
      String str1 = localObject.getLanguage();
      String str2 = localObject.getCountry();
      Util.getDefaultSharedPrefs(getActivity()).edit().putBoolean("pref_custom_locale_enabled", bool1).putString("pref_custom_locale", str1).putString("pref_custom_locale_country", str2).commit();
    }
    while (j == this.mLastSelected);
    Util.restartApp(getActivity());
  }

  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    this.mChanges = true;
  }

  public void onNothingSelected(AdapterView<?> paramAdapterView)
  {
  }

  private class LocaleComparator
    implements Comparator<Locale>
  {
    private LocaleComparator()
    {
    }

    public int compare(Locale paramLocale1, Locale paramLocale2)
    {
      return (paramLocale1.getLanguage() + "-" + paramLocale1.getCountry()).compareTo(paramLocale2.getLanguage() + "-" + paramLocale2.getCountry());
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.LocaleDialog
 * JD-Core Version:    0.6.2
 */