package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ax;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;

public final class GameEntity
  implements Game
{
  public static final Parcelable.Creator<GameEntity> CREATOR = new Parcelable.Creator()
  {
    public GameEntity n(Parcel paramAnonymousParcel)
    {
      String str1 = paramAnonymousParcel.readString();
      String str2 = paramAnonymousParcel.readString();
      String str3 = paramAnonymousParcel.readString();
      String str4 = paramAnonymousParcel.readString();
      String str5 = paramAnonymousParcel.readString();
      String str6 = paramAnonymousParcel.readString();
      String str7 = paramAnonymousParcel.readString();
      Uri localUri1;
      String str8;
      Uri localUri2;
      label62: String str9;
      Uri localUri3;
      label76: boolean bool1;
      if (str7 == null)
      {
        localUri1 = null;
        str8 = paramAnonymousParcel.readString();
        if (str8 != null)
          break label151;
        localUri2 = null;
        str9 = paramAnonymousParcel.readString();
        if (str9 != null)
          break label161;
        localUri3 = null;
        if (paramAnonymousParcel.readInt() <= 0)
          break label171;
        bool1 = true;
        label86: if (paramAnonymousParcel.readInt() <= 0)
          break label177;
      }
      label151: label161: label171: label177: for (boolean bool2 = true; ; bool2 = false)
      {
        return new GameEntity(str1, str2, str3, str4, str5, str6, localUri1, localUri2, localUri3, bool1, bool2, paramAnonymousParcel.readString(), paramAnonymousParcel.readInt(), paramAnonymousParcel.readInt(), paramAnonymousParcel.readInt(), null);
        localUri1 = Uri.parse(str7);
        break;
        localUri2 = Uri.parse(str8);
        break label62;
        localUri3 = Uri.parse(str9);
        break label76;
        bool1 = false;
        break label86;
      }
    }

    public GameEntity[] v(int paramAnonymousInt)
    {
      return new GameEntity[paramAnonymousInt];
    }
  };
  private final String bm;
  private final String ce;
  private final String cf;
  private final String cg;
  private final String ch;
  private final String ci;
  private final Uri cj;
  private final Uri ck;
  private final Uri cl;
  private final boolean cm;
  private final boolean cn;
  private final String co;
  private final int cp;
  private final int cq;
  private final int cr;

  public GameEntity(Game paramGame)
  {
    this.ce = paramGame.getApplicationId();
    this.cf = paramGame.getPrimaryCategory();
    this.cg = paramGame.getSecondaryCategory();
    this.ch = paramGame.getDescription();
    this.ci = paramGame.getDeveloperName();
    this.bm = paramGame.getDisplayName();
    this.cj = paramGame.getIconImageUri();
    this.ck = paramGame.getHiResImageUri();
    this.cl = paramGame.getFeaturedImageUri();
    this.cm = paramGame.isPlayEnabledGame();
    this.cn = paramGame.isInstanceInstalled();
    this.co = paramGame.getInstancePackageName();
    this.cp = paramGame.getGameplayAclStatus();
    this.cq = paramGame.getAchievementTotalCount();
    this.cr = paramGame.getLeaderboardCount();
  }

  private GameEntity(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, Uri paramUri1, Uri paramUri2, Uri paramUri3, boolean paramBoolean1, boolean paramBoolean2, String paramString7, int paramInt1, int paramInt2, int paramInt3)
  {
    this.ce = paramString1;
    this.bm = paramString2;
    this.cf = paramString3;
    this.cg = paramString4;
    this.ch = paramString5;
    this.ci = paramString6;
    this.cj = paramUri1;
    this.ck = paramUri2;
    this.cl = paramUri3;
    this.cm = paramBoolean1;
    this.cn = paramBoolean2;
    this.co = paramString7;
    this.cp = paramInt1;
    this.cq = paramInt2;
    this.cr = paramInt3;
  }

  public static int a(Game paramGame)
  {
    Object[] arrayOfObject = new Object[15];
    arrayOfObject[0] = paramGame.getApplicationId();
    arrayOfObject[1] = paramGame.getDisplayName();
    arrayOfObject[2] = paramGame.getPrimaryCategory();
    arrayOfObject[3] = paramGame.getSecondaryCategory();
    arrayOfObject[4] = paramGame.getDescription();
    arrayOfObject[5] = paramGame.getDeveloperName();
    arrayOfObject[6] = paramGame.getIconImageUri();
    arrayOfObject[7] = paramGame.getHiResImageUri();
    arrayOfObject[8] = paramGame.getFeaturedImageUri();
    arrayOfObject[9] = Boolean.valueOf(paramGame.isPlayEnabledGame());
    arrayOfObject[10] = Boolean.valueOf(paramGame.isInstanceInstalled());
    arrayOfObject[11] = paramGame.getInstancePackageName();
    arrayOfObject[12] = Integer.valueOf(paramGame.getGameplayAclStatus());
    arrayOfObject[13] = Integer.valueOf(paramGame.getAchievementTotalCount());
    arrayOfObject[14] = Integer.valueOf(paramGame.getLeaderboardCount());
    return w.hashCode(arrayOfObject);
  }

  public static boolean a(Game paramGame, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Game))
      bool = false;
    Game localGame;
    do
    {
      do
        return bool;
      while (paramGame == paramObject);
      localGame = (Game)paramObject;
    }
    while ((w.a(localGame.getApplicationId(), paramGame.getApplicationId())) && (w.a(localGame.getDisplayName(), paramGame.getDisplayName())) && (w.a(localGame.getPrimaryCategory(), paramGame.getPrimaryCategory())) && (w.a(localGame.getSecondaryCategory(), paramGame.getSecondaryCategory())) && (w.a(localGame.getDescription(), paramGame.getDescription())) && (w.a(localGame.getDeveloperName(), paramGame.getDeveloperName())) && (w.a(localGame.getIconImageUri(), paramGame.getIconImageUri())) && (w.a(localGame.getHiResImageUri(), paramGame.getHiResImageUri())) && (w.a(localGame.getFeaturedImageUri(), paramGame.getFeaturedImageUri())) && (w.a(Boolean.valueOf(localGame.isPlayEnabledGame()), Boolean.valueOf(paramGame.isPlayEnabledGame()))) && (w.a(Boolean.valueOf(localGame.isInstanceInstalled()), Boolean.valueOf(paramGame.isInstanceInstalled()))) && (w.a(localGame.getInstancePackageName(), paramGame.getInstancePackageName())) && (w.a(Integer.valueOf(localGame.getGameplayAclStatus()), Integer.valueOf(paramGame.getGameplayAclStatus()))) && (w.a(Integer.valueOf(localGame.getAchievementTotalCount()), Integer.valueOf(paramGame.getAchievementTotalCount()))) && (w.a(Integer.valueOf(localGame.getLeaderboardCount()), Integer.valueOf(paramGame.getLeaderboardCount()))));
    return false;
  }

  public static String b(Game paramGame)
  {
    return w.c(paramGame).a("ApplicationId", paramGame.getApplicationId()).a("DisplayName", paramGame.getDisplayName()).a("PrimaryCategory", paramGame.getPrimaryCategory()).a("SecondaryCategory", paramGame.getSecondaryCategory()).a("Description", paramGame.getDescription()).a("DeveloperName", paramGame.getDeveloperName()).a("IconImageUri", paramGame.getIconImageUri()).a("HiResImageUri", paramGame.getHiResImageUri()).a("FeaturedImageUri", paramGame.getFeaturedImageUri()).a("PlayEnabledGame", Boolean.valueOf(paramGame.isPlayEnabledGame())).a("InstanceInstalled", Boolean.valueOf(paramGame.isInstanceInstalled())).a("InstancePackageName", paramGame.getInstancePackageName()).a("GameplayAclStatus", Integer.valueOf(paramGame.getGameplayAclStatus())).a("AchievementTotalCount", Integer.valueOf(paramGame.getAchievementTotalCount())).a("LeaderboardCount", Integer.valueOf(paramGame.getLeaderboardCount())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }

  public Game freeze()
  {
    return this;
  }

  public int getAchievementTotalCount()
  {
    return this.cq;
  }

  public String getApplicationId()
  {
    return this.ce;
  }

  public String getDescription()
  {
    return this.ch;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.ch, paramCharArrayBuffer);
  }

  public String getDeveloperName()
  {
    return this.ci;
  }

  public void getDeveloperName(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.ci, paramCharArrayBuffer);
  }

  public String getDisplayName()
  {
    return this.bm;
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.bm, paramCharArrayBuffer);
  }

  public Uri getFeaturedImageUri()
  {
    return this.cl;
  }

  public int getGameplayAclStatus()
  {
    return this.cp;
  }

  public Uri getHiResImageUri()
  {
    return this.ck;
  }

  public Uri getIconImageUri()
  {
    return this.cj;
  }

  public String getInstancePackageName()
  {
    return this.co;
  }

  public int getLeaderboardCount()
  {
    return this.cr;
  }

  public String getPrimaryCategory()
  {
    return this.cf;
  }

  public String getSecondaryCategory()
  {
    return this.cg;
  }

  public int hashCode()
  {
    return a(this);
  }

  public boolean isInstanceInstalled()
  {
    return this.cn;
  }

  public boolean isPlayEnabledGame()
  {
    return this.cm;
  }

  public String toString()
  {
    return b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeString(this.ce);
    paramParcel.writeString(this.bm);
    paramParcel.writeString(this.cf);
    paramParcel.writeString(this.cg);
    paramParcel.writeString(this.ch);
    paramParcel.writeString(this.ci);
    String str1;
    String str2;
    label76: String str3;
    label96: int j;
    if (this.cj == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      if (this.ck != null)
        break label175;
      str2 = null;
      paramParcel.writeString(str2);
      Uri localUri = this.cl;
      str3 = null;
      if (localUri != null)
        break label187;
      paramParcel.writeString(str3);
      if (!this.cm)
        break label199;
      j = i;
      label112: paramParcel.writeInt(j);
      if (!this.cn)
        break label205;
    }
    while (true)
    {
      paramParcel.writeInt(i);
      paramParcel.writeString(this.co);
      paramParcel.writeInt(this.cp);
      paramParcel.writeInt(this.cq);
      paramParcel.writeInt(this.cr);
      return;
      str1 = this.cj.toString();
      break;
      label175: str2 = this.ck.toString();
      break label76;
      label187: str3 = this.cl.toString();
      break label96;
      label199: j = 0;
      break label112;
      label205: i = 0;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.GameEntity
 * JD-Core Version:    0.6.2
 */