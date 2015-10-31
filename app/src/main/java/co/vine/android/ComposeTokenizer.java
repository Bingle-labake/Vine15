package co.vine.android;

import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.widget.MultiAutoCompleteTextView.Tokenizer;
import co.vine.android.widget.PopupEditText.PopupEditTextListener;
import java.util.HashSet;

public class ComposeTokenizer
  implements MultiAutoCompleteTextView.Tokenizer
{
  public static final String TAGS_ADAPTER = "tags_adapter";
  public static final String USERS_ADAPTER = "users_adapter";
  private static final HashSet<Character> mDelimiters = localHashSet;
  private PopupEditText.PopupEditTextListener mCallback;

  static
  {
    HashSet localHashSet = new HashSet(32);
    localHashSet.add(Character.valueOf('\t'));
    localHashSet.add(Character.valueOf('\n'));
    localHashSet.add(Character.valueOf('.'));
    localHashSet.add(Character.valueOf('!'));
    localHashSet.add(Character.valueOf('?'));
    localHashSet.add(Character.valueOf(','));
    localHashSet.add(Character.valueOf(':'));
    localHashSet.add(Character.valueOf(';'));
    localHashSet.add(Character.valueOf('\''));
    localHashSet.add(Character.valueOf('"'));
    localHashSet.add(Character.valueOf('`'));
    localHashSet.add(Character.valueOf('/'));
    localHashSet.add(Character.valueOf('\\'));
    localHashSet.add(Character.valueOf('-'));
    localHashSet.add(Character.valueOf('='));
    localHashSet.add(Character.valueOf('+'));
    localHashSet.add(Character.valueOf('~'));
    localHashSet.add(Character.valueOf('$'));
    localHashSet.add(Character.valueOf('%'));
    localHashSet.add(Character.valueOf('^'));
    localHashSet.add(Character.valueOf('&'));
    localHashSet.add(Character.valueOf('*'));
    localHashSet.add(Character.valueOf('('));
    localHashSet.add(Character.valueOf(')'));
    localHashSet.add(Character.valueOf('['));
    localHashSet.add(Character.valueOf(']'));
    localHashSet.add(Character.valueOf('{'));
    localHashSet.add(Character.valueOf('}'));
    localHashSet.add(Character.valueOf('<'));
    localHashSet.add(Character.valueOf('>'));
    localHashSet.add(Character.valueOf('|'));
  }

  public ComposeTokenizer(PopupEditText.PopupEditTextListener paramPopupEditTextListener)
  {
    this.mCallback = paramPopupEditTextListener;
  }

  public int findTokenEnd(CharSequence paramCharSequence, int paramInt)
  {
    int i = paramInt;
    int j = paramCharSequence.length();
    while (i < j)
    {
      if (mDelimiters.contains(Character.valueOf(paramCharSequence.charAt(i))))
        return i;
      i++;
    }
    return j;
  }

  public int findTokenStart(CharSequence paramCharSequence, int paramInt)
  {
    int i = 1;
    if (paramInt <= 0)
      return paramInt;
    int j = paramInt;
    char c;
    do
    {
      j--;
      c = paramCharSequence.charAt(j);
    }
    while ((j > 0) && (!mDelimiters.contains(Character.valueOf(c))) && (c != '@') && (c != '#'));
    int k;
    if (c == '@')
    {
      k = i;
      label67: if (c != '#')
        break label150;
      label74: if (((k == 0) && (i == 0)) || ((j != 0) && (!mDelimiters.contains(Character.valueOf(paramCharSequence.charAt(j - 1)))) && (paramCharSequence.charAt(j - 1) != ' ')))
        break label153;
      if (k == 0)
        break label155;
      this.mCallback.setPopupAdapter("users_adapter");
    }
    while (true)
    {
      return j;
      k = 0;
      break label67;
      label150: i = 0;
      break label74;
      label153: break;
      label155: if (i != 0)
        this.mCallback.setPopupAdapter("tags_adapter");
    }
  }

  public CharSequence terminateToken(CharSequence paramCharSequence)
  {
    if ((paramCharSequence instanceof Spanned))
    {
      SpannableString localSpannableString = new SpannableString(paramCharSequence + " ");
      TextUtils.copySpansFrom((Spanned)paramCharSequence, 0, paramCharSequence.length(), Object.class, localSpannableString, 0);
      return localSpannableString;
    }
    return paramCharSequence + " ";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ComposeTokenizer
 * JD-Core Version:    0.6.2
 */