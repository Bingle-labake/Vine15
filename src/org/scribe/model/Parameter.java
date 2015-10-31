package org.scribe.model;

import org.scribe.utils.OAuthEncoder;

public class Parameter
  implements Comparable<Parameter>
{
  private static final String UTF = "UTF8";
  private final String key;
  private final String value;

  public Parameter(String paramString1, String paramString2)
  {
    this.key = paramString1;
    this.value = paramString2;
  }

  public String asUrlEncodedPair()
  {
    return OAuthEncoder.encode(this.key).concat("=").concat(OAuthEncoder.encode(this.value));
  }

  public int compareTo(Parameter paramParameter)
  {
    int i = this.key.compareTo(paramParameter.key);
    if (i != 0)
      return i;
    return this.value.compareTo(paramParameter.value);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null);
    do
    {
      return false;
      if (paramObject == this)
        return bool;
    }
    while (!(paramObject instanceof Parameter));
    Parameter localParameter = (Parameter)paramObject;
    if ((localParameter.key.equals(this.key)) && (localParameter.value.equals(this.value)));
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public int hashCode()
  {
    return this.key.hashCode() + this.value.hashCode();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Parameter
 * JD-Core Version:    0.6.2
 */