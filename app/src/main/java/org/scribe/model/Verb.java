package org.scribe.model;

public enum Verb
{
  static
  {
    DELETE = new Verb("DELETE", 3);
    Verb[] arrayOfVerb = new Verb[4];
    arrayOfVerb[0] = GET;
    arrayOfVerb[1] = POST;
    arrayOfVerb[2] = PUT;
    arrayOfVerb[3] = DELETE;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Verb
 * JD-Core Version:    0.6.2
 */