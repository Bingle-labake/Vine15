package com.flurry.org.codehaus.jackson.map.ser.impl;

import com.flurry.org.codehaus.jackson.map.ser.BeanPropertyFilter;
import com.flurry.org.codehaus.jackson.map.ser.FilterProvider;
import java.util.HashMap;
import java.util.Map;

public class SimpleFilterProvider extends FilterProvider
{
  protected boolean _cfgFailOnUnknownId = true;
  protected BeanPropertyFilter _defaultFilter;
  protected final Map<String, BeanPropertyFilter> _filtersById;

  public SimpleFilterProvider()
  {
    this(new HashMap());
  }

  public SimpleFilterProvider(Map<String, BeanPropertyFilter> paramMap)
  {
    this._filtersById = paramMap;
  }

  public SimpleFilterProvider addFilter(String paramString, BeanPropertyFilter paramBeanPropertyFilter)
  {
    this._filtersById.put(paramString, paramBeanPropertyFilter);
    return this;
  }

  public BeanPropertyFilter findFilter(Object paramObject)
  {
    BeanPropertyFilter localBeanPropertyFilter = (BeanPropertyFilter)this._filtersById.get(paramObject);
    if (localBeanPropertyFilter == null)
    {
      localBeanPropertyFilter = this._defaultFilter;
      if ((localBeanPropertyFilter == null) && (this._cfgFailOnUnknownId))
        throw new IllegalArgumentException("No filter configured with id '" + paramObject + "' (type " + paramObject.getClass().getName() + ")");
    }
    return localBeanPropertyFilter;
  }

  public BeanPropertyFilter getDefaultFilter()
  {
    return this._defaultFilter;
  }

  public BeanPropertyFilter removeFilter(String paramString)
  {
    return (BeanPropertyFilter)this._filtersById.remove(paramString);
  }

  public SimpleFilterProvider setDefaultFilter(BeanPropertyFilter paramBeanPropertyFilter)
  {
    this._defaultFilter = paramBeanPropertyFilter;
    return this;
  }

  public SimpleFilterProvider setFailOnUnknownId(boolean paramBoolean)
  {
    this._cfgFailOnUnknownId = paramBoolean;
    return this;
  }

  public boolean willFailOnUnknownId()
  {
    return this._cfgFailOnUnknownId;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.impl.SimpleFilterProvider
 * JD-Core Version:    0.6.2
 */