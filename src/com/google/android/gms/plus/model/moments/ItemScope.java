package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.ed;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public abstract interface ItemScope extends Freezable<ItemScope>
{
  public abstract ItemScope getAbout();

  public abstract List<String> getAdditionalName();

  public abstract ItemScope getAddress();

  public abstract String getAddressCountry();

  public abstract String getAddressLocality();

  public abstract String getAddressRegion();

  public abstract List<ItemScope> getAssociated_media();

  public abstract int getAttendeeCount();

  public abstract List<ItemScope> getAttendees();

  public abstract ItemScope getAudio();

  public abstract List<ItemScope> getAuthor();

  public abstract String getBestRating();

  public abstract String getBirthDate();

  public abstract ItemScope getByArtist();

  public abstract String getCaption();

  public abstract String getContentSize();

  public abstract String getContentUrl();

  public abstract List<ItemScope> getContributor();

  public abstract String getDateCreated();

  public abstract String getDateModified();

  public abstract String getDatePublished();

  public abstract String getDescription();

  public abstract String getDuration();

  public abstract String getEmbedUrl();

  public abstract String getEndDate();

  public abstract String getFamilyName();

  public abstract String getGender();

  public abstract ItemScope getGeo();

  public abstract String getGivenName();

  public abstract String getHeight();

  public abstract String getId();

  public abstract String getImage();

  public abstract ItemScope getInAlbum();

  public abstract double getLatitude();

  public abstract ItemScope getLocation();

  public abstract double getLongitude();

  public abstract String getName();

  public abstract ItemScope getPartOfTVSeries();

  public abstract List<ItemScope> getPerformers();

  public abstract String getPlayerType();

  public abstract String getPostOfficeBoxNumber();

  public abstract String getPostalCode();

  public abstract String getRatingValue();

  public abstract ItemScope getReviewRating();

  public abstract String getStartDate();

  public abstract String getStreetAddress();

  public abstract String getText();

  public abstract ItemScope getThumbnail();

  public abstract String getThumbnailUrl();

  public abstract String getTickerSymbol();

  public abstract String getType();

  public abstract String getUrl();

  public abstract String getWidth();

  public abstract String getWorstRating();

  public abstract boolean hasAbout();

  public abstract boolean hasAdditionalName();

  public abstract boolean hasAddress();

  public abstract boolean hasAddressCountry();

  public abstract boolean hasAddressLocality();

  public abstract boolean hasAddressRegion();

  public abstract boolean hasAssociated_media();

  public abstract boolean hasAttendeeCount();

  public abstract boolean hasAttendees();

  public abstract boolean hasAudio();

  public abstract boolean hasAuthor();

  public abstract boolean hasBestRating();

  public abstract boolean hasBirthDate();

  public abstract boolean hasByArtist();

  public abstract boolean hasCaption();

  public abstract boolean hasContentSize();

  public abstract boolean hasContentUrl();

  public abstract boolean hasContributor();

  public abstract boolean hasDateCreated();

  public abstract boolean hasDateModified();

  public abstract boolean hasDatePublished();

  public abstract boolean hasDescription();

  public abstract boolean hasDuration();

  public abstract boolean hasEmbedUrl();

  public abstract boolean hasEndDate();

  public abstract boolean hasFamilyName();

  public abstract boolean hasGender();

  public abstract boolean hasGeo();

  public abstract boolean hasGivenName();

  public abstract boolean hasHeight();

  public abstract boolean hasId();

  public abstract boolean hasImage();

  public abstract boolean hasInAlbum();

  public abstract boolean hasLatitude();

  public abstract boolean hasLocation();

  public abstract boolean hasLongitude();

  public abstract boolean hasName();

  public abstract boolean hasPartOfTVSeries();

  public abstract boolean hasPerformers();

  public abstract boolean hasPlayerType();

  public abstract boolean hasPostOfficeBoxNumber();

  public abstract boolean hasPostalCode();

  public abstract boolean hasRatingValue();

  public abstract boolean hasReviewRating();

  public abstract boolean hasStartDate();

  public abstract boolean hasStreetAddress();

  public abstract boolean hasText();

  public abstract boolean hasThumbnail();

  public abstract boolean hasThumbnailUrl();

  public abstract boolean hasTickerSymbol();

  public abstract boolean hasType();

  public abstract boolean hasUrl();

  public abstract boolean hasWidth();

  public abstract boolean hasWorstRating();

  public static class Builder
  {
    private String ch;
    private double ew;
    private double ex;
    private String hE;
    private final Set<Integer> hS = new HashSet();
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

    public ItemScope build()
    {
      return new ed(this.hS, this.hT, this.hU, this.hV, this.hW, this.hX, this.hY, this.hZ, this.ia, this.ib, this.ic, this.id, this.ie, this.jdField_if, this.ig, this.ih, this.ii, this.ij, this.ik, this.il, this.im, this.in, this.ch, this.io, this.ip, this.iq, this.ir, this.is, this.it, this.iu, this.iv, this.iw, this.ix, this.iy, this.ew, this.iz, this.ex, this.mName, this.iA, this.iB, this.iC, this.iD, this.iE, this.iF, this.iG, this.iH, this.iI, this.iJ, this.iK, this.iL, this.iM, this.iN, this.hE, this.iO, this.iP);
    }

    public Builder setAbout(ItemScope paramItemScope)
    {
      this.hT = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(2));
      return this;
    }

    public Builder setAdditionalName(List<String> paramList)
    {
      this.hU = paramList;
      this.hS.add(Integer.valueOf(3));
      return this;
    }

    public Builder setAddress(ItemScope paramItemScope)
    {
      this.hV = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(4));
      return this;
    }

    public Builder setAddressCountry(String paramString)
    {
      this.hW = paramString;
      this.hS.add(Integer.valueOf(5));
      return this;
    }

    public Builder setAddressLocality(String paramString)
    {
      this.hX = paramString;
      this.hS.add(Integer.valueOf(6));
      return this;
    }

    public Builder setAddressRegion(String paramString)
    {
      this.hY = paramString;
      this.hS.add(Integer.valueOf(7));
      return this;
    }

    public Builder setAssociated_media(List<ItemScope> paramList)
    {
      this.hZ = paramList;
      this.hS.add(Integer.valueOf(8));
      return this;
    }

    public Builder setAttendeeCount(int paramInt)
    {
      this.ia = paramInt;
      this.hS.add(Integer.valueOf(9));
      return this;
    }

    public Builder setAttendees(List<ItemScope> paramList)
    {
      this.ib = paramList;
      this.hS.add(Integer.valueOf(10));
      return this;
    }

    public Builder setAudio(ItemScope paramItemScope)
    {
      this.ic = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(11));
      return this;
    }

    public Builder setAuthor(List<ItemScope> paramList)
    {
      this.id = paramList;
      this.hS.add(Integer.valueOf(12));
      return this;
    }

    public Builder setBestRating(String paramString)
    {
      this.ie = paramString;
      this.hS.add(Integer.valueOf(13));
      return this;
    }

    public Builder setBirthDate(String paramString)
    {
      this.jdField_if = paramString;
      this.hS.add(Integer.valueOf(14));
      return this;
    }

    public Builder setByArtist(ItemScope paramItemScope)
    {
      this.ig = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(15));
      return this;
    }

    public Builder setCaption(String paramString)
    {
      this.ih = paramString;
      this.hS.add(Integer.valueOf(16));
      return this;
    }

    public Builder setContentSize(String paramString)
    {
      this.ii = paramString;
      this.hS.add(Integer.valueOf(17));
      return this;
    }

    public Builder setContentUrl(String paramString)
    {
      this.ij = paramString;
      this.hS.add(Integer.valueOf(18));
      return this;
    }

    public Builder setContributor(List<ItemScope> paramList)
    {
      this.ik = paramList;
      this.hS.add(Integer.valueOf(19));
      return this;
    }

    public Builder setDateCreated(String paramString)
    {
      this.il = paramString;
      this.hS.add(Integer.valueOf(20));
      return this;
    }

    public Builder setDateModified(String paramString)
    {
      this.im = paramString;
      this.hS.add(Integer.valueOf(21));
      return this;
    }

    public Builder setDatePublished(String paramString)
    {
      this.in = paramString;
      this.hS.add(Integer.valueOf(22));
      return this;
    }

    public Builder setDescription(String paramString)
    {
      this.ch = paramString;
      this.hS.add(Integer.valueOf(23));
      return this;
    }

    public Builder setDuration(String paramString)
    {
      this.io = paramString;
      this.hS.add(Integer.valueOf(24));
      return this;
    }

    public Builder setEmbedUrl(String paramString)
    {
      this.ip = paramString;
      this.hS.add(Integer.valueOf(25));
      return this;
    }

    public Builder setEndDate(String paramString)
    {
      this.iq = paramString;
      this.hS.add(Integer.valueOf(26));
      return this;
    }

    public Builder setFamilyName(String paramString)
    {
      this.ir = paramString;
      this.hS.add(Integer.valueOf(27));
      return this;
    }

    public Builder setGender(String paramString)
    {
      this.is = paramString;
      this.hS.add(Integer.valueOf(28));
      return this;
    }

    public Builder setGeo(ItemScope paramItemScope)
    {
      this.it = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(29));
      return this;
    }

    public Builder setGivenName(String paramString)
    {
      this.iu = paramString;
      this.hS.add(Integer.valueOf(30));
      return this;
    }

    public Builder setHeight(String paramString)
    {
      this.iv = paramString;
      this.hS.add(Integer.valueOf(31));
      return this;
    }

    public Builder setId(String paramString)
    {
      this.iw = paramString;
      this.hS.add(Integer.valueOf(32));
      return this;
    }

    public Builder setImage(String paramString)
    {
      this.ix = paramString;
      this.hS.add(Integer.valueOf(33));
      return this;
    }

    public Builder setInAlbum(ItemScope paramItemScope)
    {
      this.iy = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(34));
      return this;
    }

    public Builder setLatitude(double paramDouble)
    {
      this.ew = paramDouble;
      this.hS.add(Integer.valueOf(36));
      return this;
    }

    public Builder setLocation(ItemScope paramItemScope)
    {
      this.iz = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(37));
      return this;
    }

    public Builder setLongitude(double paramDouble)
    {
      this.ex = paramDouble;
      this.hS.add(Integer.valueOf(38));
      return this;
    }

    public Builder setName(String paramString)
    {
      this.mName = paramString;
      this.hS.add(Integer.valueOf(39));
      return this;
    }

    public Builder setPartOfTVSeries(ItemScope paramItemScope)
    {
      this.iA = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(40));
      return this;
    }

    public Builder setPerformers(List<ItemScope> paramList)
    {
      this.iB = paramList;
      this.hS.add(Integer.valueOf(41));
      return this;
    }

    public Builder setPlayerType(String paramString)
    {
      this.iC = paramString;
      this.hS.add(Integer.valueOf(42));
      return this;
    }

    public Builder setPostOfficeBoxNumber(String paramString)
    {
      this.iD = paramString;
      this.hS.add(Integer.valueOf(43));
      return this;
    }

    public Builder setPostalCode(String paramString)
    {
      this.iE = paramString;
      this.hS.add(Integer.valueOf(44));
      return this;
    }

    public Builder setRatingValue(String paramString)
    {
      this.iF = paramString;
      this.hS.add(Integer.valueOf(45));
      return this;
    }

    public Builder setReviewRating(ItemScope paramItemScope)
    {
      this.iG = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(46));
      return this;
    }

    public Builder setStartDate(String paramString)
    {
      this.iH = paramString;
      this.hS.add(Integer.valueOf(47));
      return this;
    }

    public Builder setStreetAddress(String paramString)
    {
      this.iI = paramString;
      this.hS.add(Integer.valueOf(48));
      return this;
    }

    public Builder setText(String paramString)
    {
      this.iJ = paramString;
      this.hS.add(Integer.valueOf(49));
      return this;
    }

    public Builder setThumbnail(ItemScope paramItemScope)
    {
      this.iK = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(50));
      return this;
    }

    public Builder setThumbnailUrl(String paramString)
    {
      this.iL = paramString;
      this.hS.add(Integer.valueOf(51));
      return this;
    }

    public Builder setTickerSymbol(String paramString)
    {
      this.iM = paramString;
      this.hS.add(Integer.valueOf(52));
      return this;
    }

    public Builder setType(String paramString)
    {
      this.iN = paramString;
      this.hS.add(Integer.valueOf(53));
      return this;
    }

    public Builder setUrl(String paramString)
    {
      this.hE = paramString;
      this.hS.add(Integer.valueOf(54));
      return this;
    }

    public Builder setWidth(String paramString)
    {
      this.iO = paramString;
      this.hS.add(Integer.valueOf(55));
      return this;
    }

    public Builder setWorstRating(String paramString)
    {
      this.iP = paramString;
      this.hS.add(Integer.valueOf(56));
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.model.moments.ItemScope
 * JD-Core Version:    0.6.2
 */