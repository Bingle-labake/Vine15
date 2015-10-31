package org.scribe.model;

public enum SignatureType
{
  static
  {
    SignatureType[] arrayOfSignatureType = new SignatureType[2];
    arrayOfSignatureType[0] = Header;
    arrayOfSignatureType[1] = QueryString;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.SignatureType
 * JD-Core Version:    0.6.2
 */