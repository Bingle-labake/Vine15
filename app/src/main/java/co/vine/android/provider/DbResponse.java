package co.vine.android.provider;

public class DbResponse
{
  public static final int RESPONSE_CODE_ERROR = 3;
  public static final int RESPONSE_CODE_NON_CONTINGUOUS_CLEAN_MADE = 4;
  public static final int RESPONSE_CODE_NO_CHANGE = 2;
  public static final int RESPONSE_CODE_SUCCESS = 1;
  public final int code;
  public final int numInserted;
  public final int numUpdated;

  public DbResponse(int paramInt1, int paramInt2, int paramInt3)
  {
    this.numInserted = paramInt1;
    this.numUpdated = paramInt2;
    this.code = paramInt3;
  }

  public String toString()
  {
    return "<DbResponse> inserted: " + this.numInserted + " updated: " + this.numUpdated + " responseCode: " + this.code;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.DbResponse
 * JD-Core Version:    0.6.2
 */