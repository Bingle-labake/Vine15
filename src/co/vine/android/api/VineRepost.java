package co.vine.android.api;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class VineRepost
  implements Externalizable
{
  private static final long serialVersionUID = -6283845278265871065L;
  public String avatarUrl;
  public String description;
  public String location;
  public long postId;
  public int priv;
  public long repostId;
  public int unflaggable;
  public long userId;
  public String username;
  public int verified;

  public VineRepost()
  {
  }

  public VineRepost(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong1, long paramLong2, long paramLong3, int paramInt1, int paramInt2, int paramInt3)
  {
    this.username = paramString1;
    this.avatarUrl = paramString2;
    this.location = paramString3;
    this.description = paramString4;
    this.userId = paramLong1;
    this.postId = paramLong2;
    this.repostId = paramLong3;
    this.verified = paramInt1;
    this.priv = paramInt2;
    this.unflaggable = paramInt3;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineRepost localVineRepost;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineRepost = (VineRepost)paramObject;
      if (this.postId != localVineRepost.postId)
        return false;
      if (this.priv != localVineRepost.priv)
        return false;
      if (this.repostId != localVineRepost.repostId)
        return false;
      if (this.unflaggable != localVineRepost.unflaggable)
        return false;
      if (this.userId != localVineRepost.userId)
        return false;
      if (this.verified != localVineRepost.verified)
        return false;
      if (this.avatarUrl != null)
      {
        if (this.avatarUrl.equals(localVineRepost.avatarUrl));
      }
      else
        while (localVineRepost.avatarUrl != null)
          return false;
      if (this.description != null)
      {
        if (this.description.equals(localVineRepost.description));
      }
      else
        while (localVineRepost.description != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localVineRepost.location));
      }
      else
        while (localVineRepost.location != null)
          return false;
      if (this.username == null)
        break;
    }
    while (this.username.equals(localVineRepost.username));
    while (true)
    {
      return false;
      if (localVineRepost.username == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int m;
    if (this.username != null)
    {
      i = this.username.hashCode();
      int j = i * 31;
      if (this.avatarUrl == null)
        break label178;
      k = this.avatarUrl.hashCode();
      m = 31 * (j + k);
      if (this.location == null)
        break label183;
    }
    label178: label183: for (int n = this.location.hashCode(); ; n = 0)
    {
      int i1 = 31 * (m + n);
      String str = this.description;
      int i2 = 0;
      if (str != null)
        i2 = this.description.hashCode();
      return 31 * (31 * (31 * (31 * (31 * (31 * (i1 + i2) + (int)(this.userId ^ this.userId >>> 32)) + (int)(this.postId ^ this.postId >>> 32)) + (int)(this.repostId ^ this.repostId >>> 32)) + this.verified) + this.priv) + this.unflaggable;
      i = 0;
      break;
      k = 0;
      break label35;
    }
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.username = ((String)paramObjectInput.readObject());
    this.avatarUrl = ((String)paramObjectInput.readObject());
    this.location = ((String)paramObjectInput.readObject());
    this.description = ((String)paramObjectInput.readObject());
    this.userId = paramObjectInput.readLong();
    this.postId = paramObjectInput.readLong();
    this.repostId = paramObjectInput.readLong();
    this.verified = paramObjectInput.readInt();
    this.priv = paramObjectInput.readInt();
    this.unflaggable = paramObjectInput.readInt();
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(this.username);
    paramObjectOutput.writeObject(this.avatarUrl);
    paramObjectOutput.writeObject(this.location);
    paramObjectOutput.writeObject(this.description);
    paramObjectOutput.writeLong(this.userId);
    paramObjectOutput.writeLong(this.postId);
    paramObjectOutput.writeLong(this.repostId);
    paramObjectOutput.writeInt(this.verified);
    paramObjectOutput.writeInt(this.priv);
    paramObjectOutput.writeInt(this.unflaggable);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineRepost
 * JD-Core Version:    0.6.2
 */