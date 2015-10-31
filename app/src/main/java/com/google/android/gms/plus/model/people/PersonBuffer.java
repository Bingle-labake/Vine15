package com.google.android.gms.plus.model.people;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.es;
import com.google.android.gms.internal.k;

public final class PersonBuffer extends DataBuffer<Person>
{
  public PersonBuffer(k paramk)
  {
    super(paramk);
  }

  public Person get(int paramInt)
  {
    return new es(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.model.people.PersonBuffer
 * JD-Core Version:    0.6.2
 */