package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.Person.AgeRange;
import com.google.android.gms.plus.model.people.Person.Cover;
import com.google.android.gms.plus.model.people.Person.Cover.CoverInfo;
import com.google.android.gms.plus.model.people.Person.Cover.CoverPhoto;
import com.google.android.gms.plus.model.people.Person.Emails;
import com.google.android.gms.plus.model.people.Person.Image;
import com.google.android.gms.plus.model.people.Person.Name;
import com.google.android.gms.plus.model.people.Person.Organizations;
import com.google.android.gms.plus.model.people.Person.PlacesLived;
import com.google.android.gms.plus.model.people.Person.Urls;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class eq extends an
  implements ae, Person
{
  public static final er CREATOR = new er();
  private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
  private final int T;
  private String bm;
  private String hE;
  private final Set<Integer> hS;
  private String iT;
  private a iU;
  private String iV;
  private String iW;
  private int iX;
  private b iY;
  private String iZ;
  private String iw;
  private List<c> ja;
  private String jb;
  private int jc;
  private boolean jd;
  private d je;
  private boolean jf;
  private String jg;
  private e jh;
  private String ji;
  private int jj;
  private List<g> jk;
  private List<h> jl;
  private int jm;
  private int jn;
  private String jo;
  private List<i> jp;
  private boolean jq;

  static
  {
    hR.put("aboutMe", an.a.f("aboutMe", 2));
    hR.put("ageRange", an.a.a("ageRange", 3, a.class));
    hR.put("birthday", an.a.f("birthday", 4));
    hR.put("braggingRights", an.a.f("braggingRights", 5));
    hR.put("circledByCount", an.a.c("circledByCount", 6));
    hR.put("cover", an.a.a("cover", 7, b.class));
    hR.put("currentLocation", an.a.f("currentLocation", 8));
    hR.put("displayName", an.a.f("displayName", 9));
    hR.put("emails", an.a.b("emails", 10, c.class));
    hR.put("etag", an.a.f("etag", 11));
    hR.put("gender", an.a.a("gender", 12, new ak().b("male", 0).b("female", 1).b("other", 2), false));
    hR.put("hasApp", an.a.e("hasApp", 13));
    hR.put("id", an.a.f("id", 14));
    hR.put("image", an.a.a("image", 15, d.class));
    hR.put("isPlusUser", an.a.e("isPlusUser", 16));
    hR.put("language", an.a.f("language", 18));
    hR.put("name", an.a.a("name", 19, e.class));
    hR.put("nickname", an.a.f("nickname", 20));
    hR.put("objectType", an.a.a("objectType", 21, new ak().b("person", 0).b("page", 1), false));
    hR.put("organizations", an.a.b("organizations", 22, g.class));
    hR.put("placesLived", an.a.b("placesLived", 23, h.class));
    hR.put("plusOneCount", an.a.c("plusOneCount", 24));
    hR.put("relationshipStatus", an.a.a("relationshipStatus", 25, new ak().b("single", 0).b("in_a_relationship", 1).b("engaged", 2).b("married", 3).b("its_complicated", 4).b("open_relationship", 5).b("widowed", 6).b("in_domestic_partnership", 7).b("in_civil_union", 8), false));
    hR.put("tagline", an.a.f("tagline", 26));
    hR.put("url", an.a.f("url", 27));
    hR.put("urls", an.a.b("urls", 28, i.class));
    hR.put("verified", an.a.e("verified", 29));
  }

  public eq()
  {
    this.T = 1;
    this.hS = new HashSet();
  }

  public eq(String paramString1, String paramString2, d paramd, int paramInt, String paramString3)
  {
    this.T = 1;
    this.hS = new HashSet();
    this.bm = paramString1;
    this.hS.add(Integer.valueOf(9));
    this.iw = paramString2;
    this.hS.add(Integer.valueOf(14));
    this.je = paramd;
    this.hS.add(Integer.valueOf(15));
    this.jj = paramInt;
    this.hS.add(Integer.valueOf(21));
    this.hE = paramString3;
    this.hS.add(Integer.valueOf(27));
  }

  eq(Set<Integer> paramSet, int paramInt1, String paramString1, a parama, String paramString2, String paramString3, int paramInt2, b paramb, String paramString4, String paramString5, List<c> paramList, String paramString6, int paramInt3, boolean paramBoolean1, String paramString7, d paramd, boolean paramBoolean2, String paramString8, e parame, String paramString9, int paramInt4, List<g> paramList1, List<h> paramList2, int paramInt5, int paramInt6, String paramString10, String paramString11, List<i> paramList3, boolean paramBoolean3)
  {
    this.hS = paramSet;
    this.T = paramInt1;
    this.iT = paramString1;
    this.iU = parama;
    this.iV = paramString2;
    this.iW = paramString3;
    this.iX = paramInt2;
    this.iY = paramb;
    this.iZ = paramString4;
    this.bm = paramString5;
    this.ja = paramList;
    this.jb = paramString6;
    this.jc = paramInt3;
    this.jd = paramBoolean1;
    this.iw = paramString7;
    this.je = paramd;
    this.jf = paramBoolean2;
    this.jg = paramString8;
    this.jh = parame;
    this.ji = paramString9;
    this.jj = paramInt4;
    this.jk = paramList1;
    this.jl = paramList2;
    this.jm = paramInt5;
    this.jn = paramInt6;
    this.jo = paramString10;
    this.hE = paramString11;
    this.jp = paramList3;
    this.jq = paramBoolean3;
  }

  public static eq d(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    eq localeq = CREATOR.F(localParcel);
    localParcel.recycle();
    return localeq;
  }

  public HashMap<String, an.a<?, ?>> G()
  {
    return hR;
  }

  protected boolean a(an.a parama)
  {
    return this.hS.contains(Integer.valueOf(parama.N()));
  }

  protected Object b(an.a parama)
  {
    switch (parama.N())
    {
    case 17:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
    case 2:
      return this.iT;
    case 3:
      return this.iU;
    case 4:
      return this.iV;
    case 5:
      return this.iW;
    case 6:
      return Integer.valueOf(this.iX);
    case 7:
      return this.iY;
    case 8:
      return this.iZ;
    case 9:
      return this.bm;
    case 10:
      return this.ja;
    case 11:
      return this.jb;
    case 12:
      return Integer.valueOf(this.jc);
    case 13:
      return Boolean.valueOf(this.jd);
    case 14:
      return this.iw;
    case 15:
      return this.je;
    case 16:
      return Boolean.valueOf(this.jf);
    case 18:
      return this.jg;
    case 19:
      return this.jh;
    case 20:
      return this.ji;
    case 21:
      return Integer.valueOf(this.jj);
    case 22:
      return this.jk;
    case 23:
      return this.jl;
    case 24:
      return Integer.valueOf(this.jm);
    case 25:
      return Integer.valueOf(this.jn);
    case 26:
      return this.jo;
    case 27:
      return this.hE;
    case 28:
      return this.jp;
    case 29:
    }
    return Boolean.valueOf(this.jq);
  }

  a bT()
  {
    return this.iU;
  }

  b bU()
  {
    return this.iY;
  }

  List<c> bV()
  {
    return this.ja;
  }

  public String bW()
  {
    return this.jb;
  }

  d bX()
  {
    return this.je;
  }

  e bY()
  {
    return this.jh;
  }

  List<g> bZ()
  {
    return this.jk;
  }

  Set<Integer> by()
  {
    return this.hS;
  }

  List<h> ca()
  {
    return this.jl;
  }

  List<i> cb()
  {
    return this.jp;
  }

  public eq cc()
  {
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof eq))
      return false;
    if (this == paramObject)
      return true;
    eq localeq = (eq)paramObject;
    Iterator localIterator = hR.values().iterator();
    while (localIterator.hasNext())
    {
      an.a locala = (an.a)localIterator.next();
      if (a(locala))
      {
        if (localeq.a(locala))
        {
          if (!b(locala).equals(localeq.b(locala)))
            return false;
        }
        else
          return false;
      }
      else if (localeq.a(locala))
        return false;
    }
    return true;
  }

  public String getAboutMe()
  {
    return this.iT;
  }

  public Person.AgeRange getAgeRange()
  {
    return this.iU;
  }

  public String getBirthday()
  {
    return this.iV;
  }

  public String getBraggingRights()
  {
    return this.iW;
  }

  public int getCircledByCount()
  {
    return this.iX;
  }

  public Person.Cover getCover()
  {
    return this.iY;
  }

  public String getCurrentLocation()
  {
    return this.iZ;
  }

  public String getDisplayName()
  {
    return this.bm;
  }

  public List<Person.Emails> getEmails()
  {
    return (ArrayList)this.ja;
  }

  public int getGender()
  {
    return this.jc;
  }

  public String getId()
  {
    return this.iw;
  }

  public Person.Image getImage()
  {
    return this.je;
  }

  public String getLanguage()
  {
    return this.jg;
  }

  public Person.Name getName()
  {
    return this.jh;
  }

  public String getNickname()
  {
    return this.ji;
  }

  public int getObjectType()
  {
    return this.jj;
  }

  public List<Person.Organizations> getOrganizations()
  {
    return (ArrayList)this.jk;
  }

  public List<Person.PlacesLived> getPlacesLived()
  {
    return (ArrayList)this.jl;
  }

  public int getPlusOneCount()
  {
    return this.jm;
  }

  public int getRelationshipStatus()
  {
    return this.jn;
  }

  public String getTagline()
  {
    return this.jo;
  }

  public String getUrl()
  {
    return this.hE;
  }

  public List<Person.Urls> getUrls()
  {
    return (ArrayList)this.jp;
  }

  public boolean hasAboutMe()
  {
    return this.hS.contains(Integer.valueOf(2));
  }

  public boolean hasAgeRange()
  {
    return this.hS.contains(Integer.valueOf(3));
  }

  public boolean hasBirthday()
  {
    return this.hS.contains(Integer.valueOf(4));
  }

  public boolean hasBraggingRights()
  {
    return this.hS.contains(Integer.valueOf(5));
  }

  public boolean hasCircledByCount()
  {
    return this.hS.contains(Integer.valueOf(6));
  }

  public boolean hasCover()
  {
    return this.hS.contains(Integer.valueOf(7));
  }

  public boolean hasCurrentLocation()
  {
    return this.hS.contains(Integer.valueOf(8));
  }

  public boolean hasDisplayName()
  {
    return this.hS.contains(Integer.valueOf(9));
  }

  public boolean hasEmails()
  {
    return this.hS.contains(Integer.valueOf(10));
  }

  public boolean hasGender()
  {
    return this.hS.contains(Integer.valueOf(12));
  }

  public boolean hasHasApp()
  {
    return this.hS.contains(Integer.valueOf(13));
  }

  public boolean hasId()
  {
    return this.hS.contains(Integer.valueOf(14));
  }

  public boolean hasImage()
  {
    return this.hS.contains(Integer.valueOf(15));
  }

  public boolean hasIsPlusUser()
  {
    return this.hS.contains(Integer.valueOf(16));
  }

  public boolean hasLanguage()
  {
    return this.hS.contains(Integer.valueOf(18));
  }

  public boolean hasName()
  {
    return this.hS.contains(Integer.valueOf(19));
  }

  public boolean hasNickname()
  {
    return this.hS.contains(Integer.valueOf(20));
  }

  public boolean hasObjectType()
  {
    return this.hS.contains(Integer.valueOf(21));
  }

  public boolean hasOrganizations()
  {
    return this.hS.contains(Integer.valueOf(22));
  }

  public boolean hasPlacesLived()
  {
    return this.hS.contains(Integer.valueOf(23));
  }

  public boolean hasPlusOneCount()
  {
    return this.hS.contains(Integer.valueOf(24));
  }

  public boolean hasRelationshipStatus()
  {
    return this.hS.contains(Integer.valueOf(25));
  }

  public boolean hasTagline()
  {
    return this.hS.contains(Integer.valueOf(26));
  }

  public boolean hasUrl()
  {
    return this.hS.contains(Integer.valueOf(27));
  }

  public boolean hasUrls()
  {
    return this.hS.contains(Integer.valueOf(28));
  }

  public boolean hasVerified()
  {
    return this.hS.contains(Integer.valueOf(29));
  }

  public int hashCode()
  {
    Iterator localIterator = hR.values().iterator();
    int i = 0;
    an.a locala;
    if (localIterator.hasNext())
    {
      locala = (an.a)localIterator.next();
      if (!a(locala))
        break label66;
    }
    label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
    {
      i = j;
      break;
      return i;
    }
  }

  public boolean isHasApp()
  {
    return this.jd;
  }

  public boolean isPlusUser()
  {
    return this.jf;
  }

  public boolean isVerified()
  {
    return this.jq;
  }

  protected Object j(String paramString)
  {
    return null;
  }

  protected boolean k(String paramString)
  {
    return false;
  }

  int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    er.a(this, paramParcel, paramInt);
  }

  public static final class a extends an
    implements ae, Person.AgeRange
  {
    public static final ei CREATOR = new ei();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private final Set<Integer> hS;
    private int jr;
    private int js;

    static
    {
      hR.put("max", an.a.c("max", 2));
      hR.put("min", an.a.c("min", 3));
    }

    public a()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    a(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
    {
      this.hS = paramSet;
      this.T = paramInt1;
      this.jr = paramInt2;
      this.js = paramInt3;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return Integer.valueOf(this.jr);
      case 3:
      }
      return Integer.valueOf(this.js);
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public a cd()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public int getMax()
    {
      return this.jr;
    }

    public int getMin()
    {
      return this.js;
    }

    public boolean hasMax()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasMin()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ei.a(this, paramParcel, paramInt);
    }
  }

  public static final class b extends an
    implements ae, Person.Cover
  {
    public static final ej CREATOR = new ej();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private final Set<Integer> hS;
    private a jt;
    private b ju;
    private int jv;

    static
    {
      hR.put("coverInfo", an.a.a("coverInfo", 2, a.class));
      hR.put("coverPhoto", an.a.a("coverPhoto", 3, b.class));
      hR.put("layout", an.a.a("layout", 4, new ak().b("banner", 0), false));
    }

    public b()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    b(Set<Integer> paramSet, int paramInt1, a parama, b paramb, int paramInt2)
    {
      this.hS = paramSet;
      this.T = paramInt1;
      this.jt = parama;
      this.ju = paramb;
      this.jv = paramInt2;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return this.jt;
      case 3:
        return this.ju;
      case 4:
      }
      return Integer.valueOf(this.jv);
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    a ce()
    {
      return this.jt;
    }

    b cf()
    {
      return this.ju;
    }

    public b cg()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof b))
        return false;
      if (this == paramObject)
        return true;
      b localb = (b)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (localb.a(locala))
          {
            if (!b(locala).equals(localb.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (localb.a(locala))
          return false;
      }
      return true;
    }

    public Person.Cover.CoverInfo getCoverInfo()
    {
      return this.jt;
    }

    public Person.Cover.CoverPhoto getCoverPhoto()
    {
      return this.ju;
    }

    public int getLayout()
    {
      return this.jv;
    }

    public boolean hasCoverInfo()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasCoverPhoto()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public boolean hasLayout()
    {
      return this.hS.contains(Integer.valueOf(4));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ej.a(this, paramParcel, paramInt);
    }

    public static final class a extends an
      implements ae, Person.Cover.CoverInfo
    {
      public static final ek CREATOR = new ek();
      private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
      private final int T;
      private final Set<Integer> hS;
      private int jw;
      private int jx;

      static
      {
        hR.put("leftImageOffset", an.a.c("leftImageOffset", 2));
        hR.put("topImageOffset", an.a.c("topImageOffset", 3));
      }

      public a()
      {
        this.T = 1;
        this.hS = new HashSet();
      }

      a(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
      {
        this.hS = paramSet;
        this.T = paramInt1;
        this.jw = paramInt2;
        this.jx = paramInt3;
      }

      public HashMap<String, an.a<?, ?>> G()
      {
        return hR;
      }

      protected boolean a(an.a parama)
      {
        return this.hS.contains(Integer.valueOf(parama.N()));
      }

      protected Object b(an.a parama)
      {
        switch (parama.N())
        {
        default:
          throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
        case 2:
          return Integer.valueOf(this.jw);
        case 3:
        }
        return Integer.valueOf(this.jx);
      }

      Set<Integer> by()
      {
        return this.hS;
      }

      public a ch()
      {
        return this;
      }

      public int describeContents()
      {
        return 0;
      }

      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof a))
          return false;
        if (this == paramObject)
          return true;
        a locala = (a)paramObject;
        Iterator localIterator = hR.values().iterator();
        while (localIterator.hasNext())
        {
          an.a locala1 = (an.a)localIterator.next();
          if (a(locala1))
          {
            if (locala.a(locala1))
            {
              if (!b(locala1).equals(locala.b(locala1)))
                return false;
            }
            else
              return false;
          }
          else if (locala.a(locala1))
            return false;
        }
        return true;
      }

      public int getLeftImageOffset()
      {
        return this.jw;
      }

      public int getTopImageOffset()
      {
        return this.jx;
      }

      public boolean hasLeftImageOffset()
      {
        return this.hS.contains(Integer.valueOf(2));
      }

      public boolean hasTopImageOffset()
      {
        return this.hS.contains(Integer.valueOf(3));
      }

      public int hashCode()
      {
        Iterator localIterator = hR.values().iterator();
        int i = 0;
        an.a locala;
        if (localIterator.hasNext())
        {
          locala = (an.a)localIterator.next();
          if (!a(locala))
            break label66;
        }
        label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
        {
          i = j;
          break;
          return i;
        }
      }

      protected Object j(String paramString)
      {
        return null;
      }

      protected boolean k(String paramString)
      {
        return false;
      }

      int u()
      {
        return this.T;
      }

      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        ek.a(this, paramParcel, paramInt);
      }
    }

    public static final class b extends an
      implements ae, Person.Cover.CoverPhoto
    {
      public static final el CREATOR = new el();
      private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
      private final int T;
      private int gA;
      private int gB;
      private String hE;
      private final Set<Integer> hS;

      static
      {
        hR.put("height", an.a.c("height", 2));
        hR.put("url", an.a.f("url", 3));
        hR.put("width", an.a.c("width", 4));
      }

      public b()
      {
        this.T = 1;
        this.hS = new HashSet();
      }

      b(Set<Integer> paramSet, int paramInt1, int paramInt2, String paramString, int paramInt3)
      {
        this.hS = paramSet;
        this.T = paramInt1;
        this.gB = paramInt2;
        this.hE = paramString;
        this.gA = paramInt3;
      }

      public HashMap<String, an.a<?, ?>> G()
      {
        return hR;
      }

      protected boolean a(an.a parama)
      {
        return this.hS.contains(Integer.valueOf(parama.N()));
      }

      protected Object b(an.a parama)
      {
        switch (parama.N())
        {
        default:
          throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
        case 2:
          return Integer.valueOf(this.gB);
        case 3:
          return this.hE;
        case 4:
        }
        return Integer.valueOf(this.gA);
      }

      Set<Integer> by()
      {
        return this.hS;
      }

      public b ci()
      {
        return this;
      }

      public int describeContents()
      {
        return 0;
      }

      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof b))
          return false;
        if (this == paramObject)
          return true;
        b localb = (b)paramObject;
        Iterator localIterator = hR.values().iterator();
        while (localIterator.hasNext())
        {
          an.a locala = (an.a)localIterator.next();
          if (a(locala))
          {
            if (localb.a(locala))
            {
              if (!b(locala).equals(localb.b(locala)))
                return false;
            }
            else
              return false;
          }
          else if (localb.a(locala))
            return false;
        }
        return true;
      }

      public int getHeight()
      {
        return this.gB;
      }

      public String getUrl()
      {
        return this.hE;
      }

      public int getWidth()
      {
        return this.gA;
      }

      public boolean hasHeight()
      {
        return this.hS.contains(Integer.valueOf(2));
      }

      public boolean hasUrl()
      {
        return this.hS.contains(Integer.valueOf(3));
      }

      public boolean hasWidth()
      {
        return this.hS.contains(Integer.valueOf(4));
      }

      public int hashCode()
      {
        Iterator localIterator = hR.values().iterator();
        int i = 0;
        an.a locala;
        if (localIterator.hasNext())
        {
          locala = (an.a)localIterator.next();
          if (!a(locala))
            break label66;
        }
        label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
        {
          i = j;
          break;
          return i;
        }
      }

      protected Object j(String paramString)
      {
        return null;
      }

      protected boolean k(String paramString)
      {
        return false;
      }

      int u()
      {
        return this.T;
      }

      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        el.a(this, paramParcel, paramInt);
      }
    }
  }

  public static final class c extends an
    implements ae, Person.Emails
  {
    public static final em CREATOR = new em();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private int bi;
    private final Set<Integer> hS;
    private boolean jy;
    private String mValue;

    static
    {
      hR.put("primary", an.a.e("primary", 2));
      hR.put("type", an.a.a("type", 3, new ak().b("home", 0).b("work", 1).b("other", 2), false));
      hR.put("value", an.a.f("value", 4));
    }

    public c()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    c(Set<Integer> paramSet, int paramInt1, boolean paramBoolean, int paramInt2, String paramString)
    {
      this.hS = paramSet;
      this.T = paramInt1;
      this.jy = paramBoolean;
      this.bi = paramInt2;
      this.mValue = paramString;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return Boolean.valueOf(this.jy);
      case 3:
        return Integer.valueOf(this.bi);
      case 4:
      }
      return this.mValue;
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public c cj()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof c))
        return false;
      if (this == paramObject)
        return true;
      c localc = (c)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (localc.a(locala))
          {
            if (!b(locala).equals(localc.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (localc.a(locala))
          return false;
      }
      return true;
    }

    public int getType()
    {
      return this.bi;
    }

    public String getValue()
    {
      return this.mValue;
    }

    public boolean hasPrimary()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasType()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public boolean hasValue()
    {
      return this.hS.contains(Integer.valueOf(4));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isPrimary()
    {
      return this.jy;
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      em.a(this, paramParcel, paramInt);
    }
  }

  public static final class d extends an
    implements ae, Person.Image
  {
    public static final en CREATOR = new en();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private String hE;
    private final Set<Integer> hS;

    static
    {
      hR.put("url", an.a.f("url", 2));
    }

    public d()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    public d(String paramString)
    {
      this.hS = new HashSet();
      this.T = 1;
      this.hE = paramString;
      this.hS.add(Integer.valueOf(2));
    }

    d(Set<Integer> paramSet, int paramInt, String paramString)
    {
      this.hS = paramSet;
      this.T = paramInt;
      this.hE = paramString;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
      }
      return this.hE;
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public d ck()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof d))
        return false;
      if (this == paramObject)
        return true;
      d locald = (d)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (locald.a(locala))
          {
            if (!b(locala).equals(locald.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (locald.a(locala))
          return false;
      }
      return true;
    }

    public String getUrl()
    {
      return this.hE;
    }

    public boolean hasUrl()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      en.a(this, paramParcel, paramInt);
    }
  }

  public static final class e extends an
    implements ae, Person.Name
  {
    public static final eo CREATOR = new eo();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private final Set<Integer> hS;
    private String ir;
    private String iu;
    private String jA;
    private String jB;
    private String jC;
    private String jz;

    static
    {
      hR.put("familyName", an.a.f("familyName", 2));
      hR.put("formatted", an.a.f("formatted", 3));
      hR.put("givenName", an.a.f("givenName", 4));
      hR.put("honorificPrefix", an.a.f("honorificPrefix", 5));
      hR.put("honorificSuffix", an.a.f("honorificSuffix", 6));
      hR.put("middleName", an.a.f("middleName", 7));
    }

    public e()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    e(Set<Integer> paramSet, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
    {
      this.hS = paramSet;
      this.T = paramInt;
      this.ir = paramString1;
      this.jz = paramString2;
      this.iu = paramString3;
      this.jA = paramString4;
      this.jB = paramString5;
      this.jC = paramString6;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return this.ir;
      case 3:
        return this.jz;
      case 4:
        return this.iu;
      case 5:
        return this.jA;
      case 6:
        return this.jB;
      case 7:
      }
      return this.jC;
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public e cl()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof e))
        return false;
      if (this == paramObject)
        return true;
      e locale = (e)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (locale.a(locala))
          {
            if (!b(locala).equals(locale.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (locale.a(locala))
          return false;
      }
      return true;
    }

    public String getFamilyName()
    {
      return this.ir;
    }

    public String getFormatted()
    {
      return this.jz;
    }

    public String getGivenName()
    {
      return this.iu;
    }

    public String getHonorificPrefix()
    {
      return this.jA;
    }

    public String getHonorificSuffix()
    {
      return this.jB;
    }

    public String getMiddleName()
    {
      return this.jC;
    }

    public boolean hasFamilyName()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasFormatted()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public boolean hasGivenName()
    {
      return this.hS.contains(Integer.valueOf(4));
    }

    public boolean hasHonorificPrefix()
    {
      return this.hS.contains(Integer.valueOf(5));
    }

    public boolean hasHonorificSuffix()
    {
      return this.hS.contains(Integer.valueOf(6));
    }

    public boolean hasMiddleName()
    {
      return this.hS.contains(Integer.valueOf(7));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      eo.a(this, paramParcel, paramInt);
    }
  }

  public static class f
  {
    public static int C(String paramString)
    {
      if (paramString.equals("person"))
        return 0;
      if (paramString.equals("page"))
        return 1;
      throw new IllegalArgumentException("Unknown objectType string: " + paramString);
    }
  }

  public static final class g extends an
    implements ae, Person.Organizations
  {
    public static final ep CREATOR = new ep();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private int bi;
    private String ch;
    private String gl;
    private final Set<Integer> hS;
    private String iH;
    private String iq;
    private String jD;
    private String jE;
    private boolean jy;
    private String mName;

    static
    {
      hR.put("department", an.a.f("department", 2));
      hR.put("description", an.a.f("description", 3));
      hR.put("endDate", an.a.f("endDate", 4));
      hR.put("location", an.a.f("location", 5));
      hR.put("name", an.a.f("name", 6));
      hR.put("primary", an.a.e("primary", 7));
      hR.put("startDate", an.a.f("startDate", 8));
      hR.put("title", an.a.f("title", 9));
      hR.put("type", an.a.a("type", 10, new ak().b("work", 0).b("school", 1), false));
    }

    public g()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    g(Set<Integer> paramSet, int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, boolean paramBoolean, String paramString6, String paramString7, int paramInt2)
    {
      this.hS = paramSet;
      this.T = paramInt1;
      this.jD = paramString1;
      this.ch = paramString2;
      this.iq = paramString3;
      this.jE = paramString4;
      this.mName = paramString5;
      this.jy = paramBoolean;
      this.iH = paramString6;
      this.gl = paramString7;
      this.bi = paramInt2;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return this.jD;
      case 3:
        return this.ch;
      case 4:
        return this.iq;
      case 5:
        return this.jE;
      case 6:
        return this.mName;
      case 7:
        return Boolean.valueOf(this.jy);
      case 8:
        return this.iH;
      case 9:
        return this.gl;
      case 10:
      }
      return Integer.valueOf(this.bi);
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public g cm()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof g))
        return false;
      if (this == paramObject)
        return true;
      g localg = (g)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (localg.a(locala))
          {
            if (!b(locala).equals(localg.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (localg.a(locala))
          return false;
      }
      return true;
    }

    public String getDepartment()
    {
      return this.jD;
    }

    public String getDescription()
    {
      return this.ch;
    }

    public String getEndDate()
    {
      return this.iq;
    }

    public String getLocation()
    {
      return this.jE;
    }

    public String getName()
    {
      return this.mName;
    }

    public String getStartDate()
    {
      return this.iH;
    }

    public String getTitle()
    {
      return this.gl;
    }

    public int getType()
    {
      return this.bi;
    }

    public boolean hasDepartment()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasDescription()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public boolean hasEndDate()
    {
      return this.hS.contains(Integer.valueOf(4));
    }

    public boolean hasLocation()
    {
      return this.hS.contains(Integer.valueOf(5));
    }

    public boolean hasName()
    {
      return this.hS.contains(Integer.valueOf(6));
    }

    public boolean hasPrimary()
    {
      return this.hS.contains(Integer.valueOf(7));
    }

    public boolean hasStartDate()
    {
      return this.hS.contains(Integer.valueOf(8));
    }

    public boolean hasTitle()
    {
      return this.hS.contains(Integer.valueOf(9));
    }

    public boolean hasType()
    {
      return this.hS.contains(Integer.valueOf(10));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isPrimary()
    {
      return this.jy;
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      ep.a(this, paramParcel, paramInt);
    }
  }

  public static final class h extends an
    implements ae, Person.PlacesLived
  {
    public static final et CREATOR = new et();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private final Set<Integer> hS;
    private boolean jy;
    private String mValue;

    static
    {
      hR.put("primary", an.a.e("primary", 2));
      hR.put("value", an.a.f("value", 3));
    }

    public h()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    h(Set<Integer> paramSet, int paramInt, boolean paramBoolean, String paramString)
    {
      this.hS = paramSet;
      this.T = paramInt;
      this.jy = paramBoolean;
      this.mValue = paramString;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return Boolean.valueOf(this.jy);
      case 3:
      }
      return this.mValue;
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public h cn()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof h))
        return false;
      if (this == paramObject)
        return true;
      h localh = (h)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (localh.a(locala))
          {
            if (!b(locala).equals(localh.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (localh.a(locala))
          return false;
      }
      return true;
    }

    public String getValue()
    {
      return this.mValue;
    }

    public boolean hasPrimary()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasValue()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isPrimary()
    {
      return this.jy;
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      et.a(this, paramParcel, paramInt);
    }
  }

  public static final class i extends an
    implements ae, Person.Urls
  {
    public static final eu CREATOR = new eu();
    private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
    private final int T;
    private int bi;
    private final Set<Integer> hS;
    private boolean jy;
    private String mValue;

    static
    {
      hR.put("primary", an.a.e("primary", 2));
      hR.put("type", an.a.a("type", 3, new ak().b("home", 0).b("work", 1).b("blog", 2).b("profile", 3).b("other", 4), false));
      hR.put("value", an.a.f("value", 4));
    }

    public i()
    {
      this.T = 1;
      this.hS = new HashSet();
    }

    i(Set<Integer> paramSet, int paramInt1, boolean paramBoolean, int paramInt2, String paramString)
    {
      this.hS = paramSet;
      this.T = paramInt1;
      this.jy = paramBoolean;
      this.bi = paramInt2;
      this.mValue = paramString;
    }

    public HashMap<String, an.a<?, ?>> G()
    {
      return hR;
    }

    protected boolean a(an.a parama)
    {
      return this.hS.contains(Integer.valueOf(parama.N()));
    }

    protected Object b(an.a parama)
    {
      switch (parama.N())
      {
      default:
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
      case 2:
        return Boolean.valueOf(this.jy);
      case 3:
        return Integer.valueOf(this.bi);
      case 4:
      }
      return this.mValue;
    }

    Set<Integer> by()
    {
      return this.hS;
    }

    public i co()
    {
      return this;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof i))
        return false;
      if (this == paramObject)
        return true;
      i locali = (i)paramObject;
      Iterator localIterator = hR.values().iterator();
      while (localIterator.hasNext())
      {
        an.a locala = (an.a)localIterator.next();
        if (a(locala))
        {
          if (locali.a(locala))
          {
            if (!b(locala).equals(locali.b(locala)))
              return false;
          }
          else
            return false;
        }
        else if (locali.a(locala))
          return false;
      }
      return true;
    }

    public int getType()
    {
      return this.bi;
    }

    public String getValue()
    {
      return this.mValue;
    }

    public boolean hasPrimary()
    {
      return this.hS.contains(Integer.valueOf(2));
    }

    public boolean hasType()
    {
      return this.hS.contains(Integer.valueOf(3));
    }

    public boolean hasValue()
    {
      return this.hS.contains(Integer.valueOf(4));
    }

    public int hashCode()
    {
      Iterator localIterator = hR.values().iterator();
      int i = 0;
      an.a locala;
      if (localIterator.hasNext())
      {
        locala = (an.a)localIterator.next();
        if (!a(locala))
          break label66;
      }
      label66: for (int j = i + locala.N() + b(locala).hashCode(); ; j = i)
      {
        i = j;
        break;
        return i;
      }
    }

    public boolean isPrimary()
    {
      return this.jy;
    }

    protected Object j(String paramString)
    {
      return null;
    }

    protected boolean k(String paramString)
    {
      return false;
    }

    int u()
    {
      return this.T;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      eu.a(this, paramParcel, paramInt);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.eq
 * JD-Core Version:    0.6.2
 */