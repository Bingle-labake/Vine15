package org.scribe.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.scribe.utils.OAuthEncoder;
import org.scribe.utils.Preconditions;

public class ParameterList
{
  private static final String EMPTY_STRING = "";
  private static final String PAIR_SEPARATOR = "=";
  private static final String PARAM_SEPARATOR = "&";
  private static final char QUERY_STRING_SEPARATOR = '?';
  private final List<Parameter> params;

  public ParameterList()
  {
    this.params = new ArrayList();
  }

  ParameterList(List<Parameter> paramList)
  {
    this.params = new ArrayList(paramList);
  }

  public ParameterList(Map<String, String> paramMap)
  {
    this();
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      this.params.add(new Parameter((String)localEntry.getKey(), (String)localEntry.getValue()));
    }
  }

  public void add(String paramString1, String paramString2)
  {
    this.params.add(new Parameter(paramString1, paramString2));
  }

  public void addAll(ParameterList paramParameterList)
  {
    this.params.addAll(paramParameterList.params);
  }

  public void addQuerystring(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      String[] arrayOfString1 = paramString.split("&");
      int i = arrayOfString1.length;
      int j = 0;
      if (j < i)
      {
        String[] arrayOfString2 = arrayOfString1[j].split("=");
        String str1 = OAuthEncoder.decode(arrayOfString2[0]);
        if (arrayOfString2.length > 1);
        for (String str2 = OAuthEncoder.decode(arrayOfString2[1]); ; str2 = "")
        {
          this.params.add(new Parameter(str1, str2));
          j++;
          break;
        }
      }
    }
  }

  public String appendTo(String paramString)
  {
    Preconditions.checkNotNull(paramString, "Cannot append to null URL");
    String str1 = asFormUrlEncodedString();
    if (str1.equals(""))
      return paramString;
    StringBuilder localStringBuilder = new StringBuilder().append(paramString);
    if (paramString.indexOf('?') != -1);
    for (Object localObject = "&"; ; localObject = Character.valueOf('?'))
    {
      String str2 = localObject;
      return str2 + str1;
    }
  }

  public String asFormUrlEncodedString()
  {
    if (this.params.size() == 0)
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.params.iterator();
    while (localIterator.hasNext())
    {
      Parameter localParameter = (Parameter)localIterator.next();
      localStringBuilder.append('&').append(localParameter.asUrlEncodedPair());
    }
    return localStringBuilder.toString().substring(1);
  }

  public String asOauthBaseString()
  {
    try
    {
      String str = URLEncoder.encode(asFormUrlEncodedString(), "UTF8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    throw new RuntimeException();
  }

  public boolean contains(Parameter paramParameter)
  {
    return this.params.contains(paramParameter);
  }

  public int size()
  {
    return this.params.size();
  }

  public ParameterList sort()
  {
    ParameterList localParameterList = new ParameterList(this.params);
    Collections.sort(localParameterList.params);
    return localParameterList;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.ParameterList
 * JD-Core Version:    0.6.2
 */