package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.moments.ItemScope;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class ed extends an
  implements ae, ItemScope
{
  public static final ee CREATOR = new ee();
  private static final HashMap<String, an.a<?, ?>> hR = new HashMap();
  private final int T;
  private String ch;
  private double ew;
  private double ex;
  private String hE;
  private final Set<Integer> hS;
  private ed hT;
  private List<String> hU;
  private ed hV;
  private String hW;
  private String hX;
  private String hY;
  private List<ed> hZ;
  private ed iA;
  private List<ed> iB;
  private String iC;
  private String iD;
  private String iE;
  private String iF;
  private ed iG;
  private String iH;
  private String iI;
  private String iJ;
  private ed iK;
  private String iL;
  private String iM;
  private String iN;
  private String iO;
  private String iP;
  private int ia;
  private List<ed> ib;
  private ed ic;
  private List<ed> id;
  private String ie;
  private String jdField_if;
  private ed ig;
  private String ih;
  private String ii;
  private String ij;
  private List<ed> ik;
  private String il;
  private String im;
  private String in;
  private String io;
  private String ip;
  private String iq;
  private String ir;
  private String is;
  private ed it;
  private String iu;
  private String iv;
  private String iw;
  private String ix;
  private ed iy;
  private ed iz;
  private String mName;

  static
  {
    hR.put("about", an.a.a("about", 2, ed.class));
    hR.put("additionalName", an.a.g("additionalName", 3));
    hR.put("address", an.a.a("address", 4, ed.class));
    hR.put("addressCountry", an.a.f("addressCountry", 5));
    hR.put("addressLocality", an.a.f("addressLocality", 6));
    hR.put("addressRegion", an.a.f("addressRegion", 7));
    hR.put("associated_media", an.a.b("associated_media", 8, ed.class));
    hR.put("attendeeCount", an.a.c("attendeeCount", 9));
    hR.put("attendees", an.a.b("attendees", 10, ed.class));
    hR.put("audio", an.a.a("audio", 11, ed.class));
    hR.put("author", an.a.b("author", 12, ed.class));
    hR.put("bestRating", an.a.f("bestRating", 13));
    hR.put("birthDate", an.a.f("birthDate", 14));
    hR.put("byArtist", an.a.a("byArtist", 15, ed.class));
    hR.put("caption", an.a.f("caption", 16));
    hR.put("contentSize", an.a.f("contentSize", 17));
    hR.put("contentUrl", an.a.f("contentUrl", 18));
    hR.put("contributor", an.a.b("contributor", 19, ed.class));
    hR.put("dateCreated", an.a.f("dateCreated", 20));
    hR.put("dateModified", an.a.f("dateModified", 21));
    hR.put("datePublished", an.a.f("datePublished", 22));
    hR.put("description", an.a.f("description", 23));
    hR.put("duration", an.a.f("duration", 24));
    hR.put("embedUrl", an.a.f("embedUrl", 25));
    hR.put("endDate", an.a.f("endDate", 26));
    hR.put("familyName", an.a.f("familyName", 27));
    hR.put("gender", an.a.f("gender", 28));
    hR.put("geo", an.a.a("geo", 29, ed.class));
    hR.put("givenName", an.a.f("givenName", 30));
    hR.put("height", an.a.f("height", 31));
    hR.put("id", an.a.f("id", 32));
    hR.put("image", an.a.f("image", 33));
    hR.put("inAlbum", an.a.a("inAlbum", 34, ed.class));
    hR.put("latitude", an.a.d("latitude", 36));
    hR.put("location", an.a.a("location", 37, ed.class));
    hR.put("longitude", an.a.d("longitude", 38));
    hR.put("name", an.a.f("name", 39));
    hR.put("partOfTVSeries", an.a.a("partOfTVSeries", 40, ed.class));
    hR.put("performers", an.a.b("performers", 41, ed.class));
    hR.put("playerType", an.a.f("playerType", 42));
    hR.put("postOfficeBoxNumber", an.a.f("postOfficeBoxNumber", 43));
    hR.put("postalCode", an.a.f("postalCode", 44));
    hR.put("ratingValue", an.a.f("ratingValue", 45));
    hR.put("reviewRating", an.a.a("reviewRating", 46, ed.class));
    hR.put("startDate", an.a.f("startDate", 47));
    hR.put("streetAddress", an.a.f("streetAddress", 48));
    hR.put("text", an.a.f("text", 49));
    hR.put("thumbnail", an.a.a("thumbnail", 50, ed.class));
    hR.put("thumbnailUrl", an.a.f("thumbnailUrl", 51));
    hR.put("tickerSymbol", an.a.f("tickerSymbol", 52));
    hR.put("type", an.a.f("type", 53));
    hR.put("url", an.a.f("url", 54));
    hR.put("width", an.a.f("width", 55));
    hR.put("worstRating", an.a.f("worstRating", 56));
  }

  public ed()
  {
    this.T = 1;
    this.hS = new HashSet();
  }

  ed(Set<Integer> paramSet, int paramInt1, ed paramed1, List<String> paramList, ed paramed2, String paramString1, String paramString2, String paramString3, List<ed> paramList1, int paramInt2, List<ed> paramList2, ed paramed3, List<ed> paramList3, String paramString4, String paramString5, ed paramed4, String paramString6, String paramString7, String paramString8, List<ed> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, ed paramed5, String paramString18, String paramString19, String paramString20, String paramString21, ed paramed6, double paramDouble1, ed paramed7, double paramDouble2, String paramString22, ed paramed8, List<ed> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, ed paramed9, String paramString27, String paramString28, String paramString29, ed paramed10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.hS = paramSet;
    this.T = paramInt1;
    this.hT = paramed1;
    this.hU = paramList;
    this.hV = paramed2;
    this.hW = paramString1;
    this.hX = paramString2;
    this.hY = paramString3;
    this.hZ = paramList1;
    this.ia = paramInt2;
    this.ib = paramList2;
    this.ic = paramed3;
    this.id = paramList3;
    this.ie = paramString4;
    this.jdField_if = paramString5;
    this.ig = paramed4;
    this.ih = paramString6;
    this.ii = paramString7;
    this.ij = paramString8;
    this.ik = paramList4;
    this.il = paramString9;
    this.im = paramString10;
    this.in = paramString11;
    this.ch = paramString12;
    this.io = paramString13;
    this.ip = paramString14;
    this.iq = paramString15;
    this.ir = paramString16;
    this.is = paramString17;
    this.it = paramed5;
    this.iu = paramString18;
    this.iv = paramString19;
    this.iw = paramString20;
    this.ix = paramString21;
    this.iy = paramed6;
    this.ew = paramDouble1;
    this.iz = paramed7;
    this.ex = paramDouble2;
    this.mName = paramString22;
    this.iA = paramed8;
    this.iB = paramList5;
    this.iC = paramString23;
    this.iD = paramString24;
    this.iE = paramString25;
    this.iF = paramString26;
    this.iG = paramed9;
    this.iH = paramString27;
    this.iI = paramString28;
    this.iJ = paramString29;
    this.iK = paramed10;
    this.iL = paramString30;
    this.iM = paramString31;
    this.iN = paramString32;
    this.hE = paramString33;
    this.iO = paramString34;
    this.iP = paramString35;
  }

  public ed(Set<Integer> paramSet, ed paramed1, List<String> paramList, ed paramed2, String paramString1, String paramString2, String paramString3, List<ed> paramList1, int paramInt, List<ed> paramList2, ed paramed3, List<ed> paramList3, String paramString4, String paramString5, ed paramed4, String paramString6, String paramString7, String paramString8, List<ed> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, ed paramed5, String paramString18, String paramString19, String paramString20, String paramString21, ed paramed6, double paramDouble1, ed paramed7, double paramDouble2, String paramString22, ed paramed8, List<ed> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, ed paramed9, String paramString27, String paramString28, String paramString29, ed paramed10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.hS = paramSet;
    this.T = 1;
    this.hT = paramed1;
    this.hU = paramList;
    this.hV = paramed2;
    this.hW = paramString1;
    this.hX = paramString2;
    this.hY = paramString3;
    this.hZ = paramList1;
    this.ia = paramInt;
    this.ib = paramList2;
    this.ic = paramed3;
    this.id = paramList3;
    this.ie = paramString4;
    this.jdField_if = paramString5;
    this.ig = paramed4;
    this.ih = paramString6;
    this.ii = paramString7;
    this.ij = paramString8;
    this.ik = paramList4;
    this.il = paramString9;
    this.im = paramString10;
    this.in = paramString11;
    this.ch = paramString12;
    this.io = paramString13;
    this.ip = paramString14;
    this.iq = paramString15;
    this.ir = paramString16;
    this.is = paramString17;
    this.it = paramed5;
    this.iu = paramString18;
    this.iv = paramString19;
    this.iw = paramString20;
    this.ix = paramString21;
    this.iy = paramed6;
    this.ew = paramDouble1;
    this.iz = paramed7;
    this.ex = paramDouble2;
    this.mName = paramString22;
    this.iA = paramed8;
    this.iB = paramList5;
    this.iC = paramString23;
    this.iD = paramString24;
    this.iE = paramString25;
    this.iF = paramString26;
    this.iG = paramed9;
    this.iH = paramString27;
    this.iI = paramString28;
    this.iJ = paramString29;
    this.iK = paramed10;
    this.iL = paramString30;
    this.iM = paramString31;
    this.iN = paramString32;
    this.hE = paramString33;
    this.iO = paramString34;
    this.iP = paramString35;
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
    case 35:
    default:
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.N());
    case 2:
      return this.hT;
    case 3:
      return this.hU;
    case 4:
      return this.hV;
    case 5:
      return this.hW;
    case 6:
      return this.hX;
    case 7:
      return this.hY;
    case 8:
      return this.hZ;
    case 9:
      return Integer.valueOf(this.ia);
    case 10:
      return this.ib;
    case 11:
      return this.ic;
    case 12:
      return this.id;
    case 13:
      return this.ie;
    case 14:
      return this.jdField_if;
    case 15:
      return this.ig;
    case 16:
      return this.ih;
    case 17:
      return this.ii;
    case 18:
      return this.ij;
    case 19:
      return this.ik;
    case 20:
      return this.il;
    case 21:
      return this.im;
    case 22:
      return this.in;
    case 23:
      return this.ch;
    case 24:
      return this.io;
    case 25:
      return this.ip;
    case 26:
      return this.iq;
    case 27:
      return this.ir;
    case 28:
      return this.is;
    case 29:
      return this.it;
    case 30:
      return this.iu;
    case 31:
      return this.iv;
    case 32:
      return this.iw;
    case 33:
      return this.ix;
    case 34:
      return this.iy;
    case 36:
      return Double.valueOf(this.ew);
    case 37:
      return this.iz;
    case 38:
      return Double.valueOf(this.ex);
    case 39:
      return this.mName;
    case 40:
      return this.iA;
    case 41:
      return this.iB;
    case 42:
      return this.iC;
    case 43:
      return this.iD;
    case 44:
      return this.iE;
    case 45:
      return this.iF;
    case 46:
      return this.iG;
    case 47:
      return this.iH;
    case 48:
      return this.iI;
    case 49:
      return this.iJ;
    case 50:
      return this.iK;
    case 51:
      return this.iL;
    case 52:
      return this.iM;
    case 53:
      return this.iN;
    case 54:
      return this.hE;
    case 55:
      return this.iO;
    case 56:
    }
    return this.iP;
  }

  ed bA()
  {
    return this.hV;
  }

  List<ed> bB()
  {
    return this.hZ;
  }

  List<ed> bC()
  {
    return this.ib;
  }

  ed bD()
  {
    return this.ic;
  }

  List<ed> bE()
  {
    return this.id;
  }

  ed bF()
  {
    return this.ig;
  }

  List<ed> bG()
  {
    return this.ik;
  }

  ed bH()
  {
    return this.it;
  }

  ed bI()
  {
    return this.iy;
  }

  ed bJ()
  {
    return this.iz;
  }

  ed bK()
  {
    return this.iA;
  }

  List<ed> bL()
  {
    return this.iB;
  }

  ed bM()
  {
    return this.iG;
  }

  ed bN()
  {
    return this.iK;
  }

  public ed bO()
  {
    return this;
  }

  Set<Integer> by()
  {
    return this.hS;
  }

  ed bz()
  {
    return this.hT;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ed))
      return false;
    if (this == paramObject)
      return true;
    ed localed = (ed)paramObject;
    Iterator localIterator = hR.values().iterator();
    while (localIterator.hasNext())
    {
      an.a locala = (an.a)localIterator.next();
      if (a(locala))
      {
        if (localed.a(locala))
        {
          if (!b(locala).equals(localed.b(locala)))
            return false;
        }
        else
          return false;
      }
      else if (localed.a(locala))
        return false;
    }
    return true;
  }

  public ItemScope getAbout()
  {
    return this.hT;
  }

  public List<String> getAdditionalName()
  {
    return this.hU;
  }

  public ItemScope getAddress()
  {
    return this.hV;
  }

  public String getAddressCountry()
  {
    return this.hW;
  }

  public String getAddressLocality()
  {
    return this.hX;
  }

  public String getAddressRegion()
  {
    return this.hY;
  }

  public List<ItemScope> getAssociated_media()
  {
    return (ArrayList)this.hZ;
  }

  public int getAttendeeCount()
  {
    return this.ia;
  }

  public List<ItemScope> getAttendees()
  {
    return (ArrayList)this.ib;
  }

  public ItemScope getAudio()
  {
    return this.ic;
  }

  public List<ItemScope> getAuthor()
  {
    return (ArrayList)this.id;
  }

  public String getBestRating()
  {
    return this.ie;
  }

  public String getBirthDate()
  {
    return this.jdField_if;
  }

  public ItemScope getByArtist()
  {
    return this.ig;
  }

  public String getCaption()
  {
    return this.ih;
  }

  public String getContentSize()
  {
    return this.ii;
  }

  public String getContentUrl()
  {
    return this.ij;
  }

  public List<ItemScope> getContributor()
  {
    return (ArrayList)this.ik;
  }

  public String getDateCreated()
  {
    return this.il;
  }

  public String getDateModified()
  {
    return this.im;
  }

  public String getDatePublished()
  {
    return this.in;
  }

  public String getDescription()
  {
    return this.ch;
  }

  public String getDuration()
  {
    return this.io;
  }

  public String getEmbedUrl()
  {
    return this.ip;
  }

  public String getEndDate()
  {
    return this.iq;
  }

  public String getFamilyName()
  {
    return this.ir;
  }

  public String getGender()
  {
    return this.is;
  }

  public ItemScope getGeo()
  {
    return this.it;
  }

  public String getGivenName()
  {
    return this.iu;
  }

  public String getHeight()
  {
    return this.iv;
  }

  public String getId()
  {
    return this.iw;
  }

  public String getImage()
  {
    return this.ix;
  }

  public ItemScope getInAlbum()
  {
    return this.iy;
  }

  public double getLatitude()
  {
    return this.ew;
  }

  public ItemScope getLocation()
  {
    return this.iz;
  }

  public double getLongitude()
  {
    return this.ex;
  }

  public String getName()
  {
    return this.mName;
  }

  public ItemScope getPartOfTVSeries()
  {
    return this.iA;
  }

  public List<ItemScope> getPerformers()
  {
    return (ArrayList)this.iB;
  }

  public String getPlayerType()
  {
    return this.iC;
  }

  public String getPostOfficeBoxNumber()
  {
    return this.iD;
  }

  public String getPostalCode()
  {
    return this.iE;
  }

  public String getRatingValue()
  {
    return this.iF;
  }

  public ItemScope getReviewRating()
  {
    return this.iG;
  }

  public String getStartDate()
  {
    return this.iH;
  }

  public String getStreetAddress()
  {
    return this.iI;
  }

  public String getText()
  {
    return this.iJ;
  }

  public ItemScope getThumbnail()
  {
    return this.iK;
  }

  public String getThumbnailUrl()
  {
    return this.iL;
  }

  public String getTickerSymbol()
  {
    return this.iM;
  }

  public String getType()
  {
    return this.iN;
  }

  public String getUrl()
  {
    return this.hE;
  }

  public String getWidth()
  {
    return this.iO;
  }

  public String getWorstRating()
  {
    return this.iP;
  }

  public boolean hasAbout()
  {
    return this.hS.contains(Integer.valueOf(2));
  }

  public boolean hasAdditionalName()
  {
    return this.hS.contains(Integer.valueOf(3));
  }

  public boolean hasAddress()
  {
    return this.hS.contains(Integer.valueOf(4));
  }

  public boolean hasAddressCountry()
  {
    return this.hS.contains(Integer.valueOf(5));
  }

  public boolean hasAddressLocality()
  {
    return this.hS.contains(Integer.valueOf(6));
  }

  public boolean hasAddressRegion()
  {
    return this.hS.contains(Integer.valueOf(7));
  }

  public boolean hasAssociated_media()
  {
    return this.hS.contains(Integer.valueOf(8));
  }

  public boolean hasAttendeeCount()
  {
    return this.hS.contains(Integer.valueOf(9));
  }

  public boolean hasAttendees()
  {
    return this.hS.contains(Integer.valueOf(10));
  }

  public boolean hasAudio()
  {
    return this.hS.contains(Integer.valueOf(11));
  }

  public boolean hasAuthor()
  {
    return this.hS.contains(Integer.valueOf(12));
  }

  public boolean hasBestRating()
  {
    return this.hS.contains(Integer.valueOf(13));
  }

  public boolean hasBirthDate()
  {
    return this.hS.contains(Integer.valueOf(14));
  }

  public boolean hasByArtist()
  {
    return this.hS.contains(Integer.valueOf(15));
  }

  public boolean hasCaption()
  {
    return this.hS.contains(Integer.valueOf(16));
  }

  public boolean hasContentSize()
  {
    return this.hS.contains(Integer.valueOf(17));
  }

  public boolean hasContentUrl()
  {
    return this.hS.contains(Integer.valueOf(18));
  }

  public boolean hasContributor()
  {
    return this.hS.contains(Integer.valueOf(19));
  }

  public boolean hasDateCreated()
  {
    return this.hS.contains(Integer.valueOf(20));
  }

  public boolean hasDateModified()
  {
    return this.hS.contains(Integer.valueOf(21));
  }

  public boolean hasDatePublished()
  {
    return this.hS.contains(Integer.valueOf(22));
  }

  public boolean hasDescription()
  {
    return this.hS.contains(Integer.valueOf(23));
  }

  public boolean hasDuration()
  {
    return this.hS.contains(Integer.valueOf(24));
  }

  public boolean hasEmbedUrl()
  {
    return this.hS.contains(Integer.valueOf(25));
  }

  public boolean hasEndDate()
  {
    return this.hS.contains(Integer.valueOf(26));
  }

  public boolean hasFamilyName()
  {
    return this.hS.contains(Integer.valueOf(27));
  }

  public boolean hasGender()
  {
    return this.hS.contains(Integer.valueOf(28));
  }

  public boolean hasGeo()
  {
    return this.hS.contains(Integer.valueOf(29));
  }

  public boolean hasGivenName()
  {
    return this.hS.contains(Integer.valueOf(30));
  }

  public boolean hasHeight()
  {
    return this.hS.contains(Integer.valueOf(31));
  }

  public boolean hasId()
  {
    return this.hS.contains(Integer.valueOf(32));
  }

  public boolean hasImage()
  {
    return this.hS.contains(Integer.valueOf(33));
  }

  public boolean hasInAlbum()
  {
    return this.hS.contains(Integer.valueOf(34));
  }

  public boolean hasLatitude()
  {
    return this.hS.contains(Integer.valueOf(36));
  }

  public boolean hasLocation()
  {
    return this.hS.contains(Integer.valueOf(37));
  }

  public boolean hasLongitude()
  {
    return this.hS.contains(Integer.valueOf(38));
  }

  public boolean hasName()
  {
    return this.hS.contains(Integer.valueOf(39));
  }

  public boolean hasPartOfTVSeries()
  {
    return this.hS.contains(Integer.valueOf(40));
  }

  public boolean hasPerformers()
  {
    return this.hS.contains(Integer.valueOf(41));
  }

  public boolean hasPlayerType()
  {
    return this.hS.contains(Integer.valueOf(42));
  }

  public boolean hasPostOfficeBoxNumber()
  {
    return this.hS.contains(Integer.valueOf(43));
  }

  public boolean hasPostalCode()
  {
    return this.hS.contains(Integer.valueOf(44));
  }

  public boolean hasRatingValue()
  {
    return this.hS.contains(Integer.valueOf(45));
  }

  public boolean hasReviewRating()
  {
    return this.hS.contains(Integer.valueOf(46));
  }

  public boolean hasStartDate()
  {
    return this.hS.contains(Integer.valueOf(47));
  }

  public boolean hasStreetAddress()
  {
    return this.hS.contains(Integer.valueOf(48));
  }

  public boolean hasText()
  {
    return this.hS.contains(Integer.valueOf(49));
  }

  public boolean hasThumbnail()
  {
    return this.hS.contains(Integer.valueOf(50));
  }

  public boolean hasThumbnailUrl()
  {
    return this.hS.contains(Integer.valueOf(51));
  }

  public boolean hasTickerSymbol()
  {
    return this.hS.contains(Integer.valueOf(52));
  }

  public boolean hasType()
  {
    return this.hS.contains(Integer.valueOf(53));
  }

  public boolean hasUrl()
  {
    return this.hS.contains(Integer.valueOf(54));
  }

  public boolean hasWidth()
  {
    return this.hS.contains(Integer.valueOf(55));
  }

  public boolean hasWorstRating()
  {
    return this.hS.contains(Integer.valueOf(56));
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
    ee.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ed
 * JD-Core Version:    0.6.2
 */