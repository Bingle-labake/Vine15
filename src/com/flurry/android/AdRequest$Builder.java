package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;
import java.util.Map;

public class AdRequest$Builder extends SpecificRecordBuilderBase<AdRequest>
  implements RecordBuilder<AdRequest>
{
  private long bU;
  private CharSequence bX;
  private CharSequence bY;
  private CharSequence bZ;
  private List<AdReportedId> ca;
  private Location cb;
  private boolean cc;
  private List<Integer> cd;
  private AdViewContainer ce;
  private CharSequence cf;
  private CharSequence cg;
  private CharSequence ch;
  private CharSequence ci;
  private TestAds cj;
  private Map<CharSequence, CharSequence> ck;
  private boolean cl;
  private int cm;
  private boolean cn;
  private List<FrequencyCapInfo> co;

  private AdRequest$Builder(byte paramByte)
  {
    super(AdRequest.SCHEMA$);
  }

  public AdRequest build()
  {
    try
    {
      AdRequest localAdRequest = new AdRequest();
      CharSequence localCharSequence1;
      CharSequence localCharSequence2;
      label42: CharSequence localCharSequence3;
      label63: long l;
      label84: List localList1;
      label105: Location localLocation;
      label126: boolean bool1;
      label148: List localList2;
      label170: AdViewContainer localAdViewContainer;
      label192: CharSequence localCharSequence4;
      label214: CharSequence localCharSequence5;
      label236: CharSequence localCharSequence6;
      label258: CharSequence localCharSequence7;
      label280: TestAds localTestAds;
      label302: Map localMap;
      label324: boolean bool2;
      label346: int i;
      label368: boolean bool3;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence1 = this.bX;
        localAdRequest.bX = localCharSequence1;
        if (fieldSetFlags()[1] == 0)
          break label437;
        localCharSequence2 = this.bY;
        localAdRequest.bY = localCharSequence2;
        if (fieldSetFlags()[2] == 0)
          break label455;
        localCharSequence3 = this.bZ;
        localAdRequest.bZ = localCharSequence3;
        if (fieldSetFlags()[3] == 0)
          break label473;
        l = this.bU;
        localAdRequest.bU = l;
        if (fieldSetFlags()[4] == 0)
          break label494;
        localList1 = this.ca;
        localAdRequest.ca = localList1;
        if (fieldSetFlags()[5] == 0)
          break label512;
        localLocation = this.cb;
        localAdRequest.cb = localLocation;
        if (fieldSetFlags()[6] == 0)
          break label530;
        bool1 = this.cc;
        localAdRequest.cc = bool1;
        if (fieldSetFlags()[7] == 0)
          break label552;
        localList2 = this.cd;
        localAdRequest.cd = localList2;
        if (fieldSetFlags()[8] == 0)
          break label571;
        localAdViewContainer = this.ce;
        localAdRequest.ce = localAdViewContainer;
        if (fieldSetFlags()[9] == 0)
          break label590;
        localCharSequence4 = this.cf;
        localAdRequest.cf = localCharSequence4;
        if (fieldSetFlags()[10] == 0)
          break label609;
        localCharSequence5 = this.cg;
        localAdRequest.cg = localCharSequence5;
        if (fieldSetFlags()[11] == 0)
          break label628;
        localCharSequence6 = this.ch;
        localAdRequest.ch = localCharSequence6;
        if (fieldSetFlags()[12] == 0)
          break label647;
        localCharSequence7 = this.ci;
        localAdRequest.ci = localCharSequence7;
        if (fieldSetFlags()[13] == 0)
          break label666;
        localTestAds = this.cj;
        localAdRequest.cj = localTestAds;
        if (fieldSetFlags()[14] == 0)
          break label685;
        localMap = this.ck;
        localAdRequest.ck = localMap;
        if (fieldSetFlags()[15] == 0)
          break label704;
        bool2 = this.cl;
        localAdRequest.cl = bool2;
        if (fieldSetFlags()[16] == 0)
          break label726;
        i = this.cm;
        localAdRequest.cm = i;
        if (fieldSetFlags()[17] == 0)
          break label748;
        bool3 = this.cn;
        label390: localAdRequest.cn = bool3;
        if (fieldSetFlags()[18] == 0)
          break label770;
      }
      label512: label770: for (List localList3 = this.co; ; localList3 = (List)defaultValue(fields()[18]))
      {
        localAdRequest.co = localList3;
        return localAdRequest;
        localCharSequence1 = (CharSequence)defaultValue(fields()[0]);
        break;
        label437: localCharSequence2 = (CharSequence)defaultValue(fields()[1]);
        break label42;
        label455: localCharSequence3 = (CharSequence)defaultValue(fields()[2]);
        break label63;
        label473: l = ((Long)defaultValue(fields()[3])).longValue();
        break label84;
        label494: localList1 = (List)defaultValue(fields()[4]);
        break label105;
        localLocation = (Location)defaultValue(fields()[5]);
        break label126;
        label530: bool1 = ((Boolean)defaultValue(fields()[6])).booleanValue();
        break label148;
        label552: localList2 = (List)defaultValue(fields()[7]);
        break label170;
        label571: localAdViewContainer = (AdViewContainer)defaultValue(fields()[8]);
        break label192;
        label590: localCharSequence4 = (CharSequence)defaultValue(fields()[9]);
        break label214;
        label609: localCharSequence5 = (CharSequence)defaultValue(fields()[10]);
        break label236;
        label628: localCharSequence6 = (CharSequence)defaultValue(fields()[11]);
        break label258;
        label647: localCharSequence7 = (CharSequence)defaultValue(fields()[12]);
        break label280;
        label666: localTestAds = (TestAds)defaultValue(fields()[13]);
        break label302;
        label685: localMap = (Map)defaultValue(fields()[14]);
        break label324;
        label704: bool2 = ((Boolean)defaultValue(fields()[15])).booleanValue();
        break label346;
        label726: i = ((Integer)defaultValue(fields()[16])).intValue();
        break label368;
        label748: bool3 = ((Boolean)defaultValue(fields()[17])).booleanValue();
        break label390;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdReportedIds()
  {
    this.ca = null;
    fieldSetFlags()[4] = 0;
    return this;
  }

  public Builder clearAdSpaceName()
  {
    this.bZ = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearAdViewContainer()
  {
    this.ce = null;
    fieldSetFlags()[8] = 0;
    return this;
  }

  public Builder clearAgentVersion()
  {
    this.bY = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearApiKey()
  {
    this.bX = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearBindings()
  {
    this.cd = null;
    fieldSetFlags()[7] = 0;
    return this;
  }

  public Builder clearCanDoSKAppStore()
  {
    fieldSetFlags()[17] = 0;
    return this;
  }

  public Builder clearDevicePlatform()
  {
    this.ci = null;
    fieldSetFlags()[12] = 0;
    return this;
  }

  public Builder clearFrequencyCapInfos()
  {
    this.co = null;
    fieldSetFlags()[18] = 0;
    return this;
  }

  public Builder clearKeywords()
  {
    this.ck = null;
    fieldSetFlags()[14] = 0;
    return this;
  }

  public Builder clearLocale()
  {
    this.cf = null;
    fieldSetFlags()[9] = 0;
    return this;
  }

  public Builder clearLocation()
  {
    this.cb = null;
    fieldSetFlags()[5] = 0;
    return this;
  }

  public Builder clearNetworkStatus()
  {
    fieldSetFlags()[16] = 0;
    return this;
  }

  public Builder clearOsVersion()
  {
    this.ch = null;
    fieldSetFlags()[11] = 0;
    return this;
  }

  public Builder clearRefresh()
  {
    fieldSetFlags()[15] = 0;
    return this;
  }

  public Builder clearSessionId()
  {
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Builder clearTestAds()
  {
    this.cj = null;
    fieldSetFlags()[13] = 0;
    return this;
  }

  public Builder clearTestDevice()
  {
    fieldSetFlags()[6] = 0;
    return this;
  }

  public Builder clearTimezone()
  {
    this.cg = null;
    fieldSetFlags()[10] = 0;
    return this;
  }

  public List<AdReportedId> getAdReportedIds()
  {
    return this.ca;
  }

  public CharSequence getAdSpaceName()
  {
    return this.bZ;
  }

  public AdViewContainer getAdViewContainer()
  {
    return this.ce;
  }

  public CharSequence getAgentVersion()
  {
    return this.bY;
  }

  public CharSequence getApiKey()
  {
    return this.bX;
  }

  public List<Integer> getBindings()
  {
    return this.cd;
  }

  public Boolean getCanDoSKAppStore()
  {
    return Boolean.valueOf(this.cn);
  }

  public CharSequence getDevicePlatform()
  {
    return this.ci;
  }

  public List<FrequencyCapInfo> getFrequencyCapInfos()
  {
    return this.co;
  }

  public Map<CharSequence, CharSequence> getKeywords()
  {
    return this.ck;
  }

  public CharSequence getLocale()
  {
    return this.cf;
  }

  public Location getLocation()
  {
    return this.cb;
  }

  public Integer getNetworkStatus()
  {
    return Integer.valueOf(this.cm);
  }

  public CharSequence getOsVersion()
  {
    return this.ch;
  }

  public Boolean getRefresh()
  {
    return Boolean.valueOf(this.cl);
  }

  public Long getSessionId()
  {
    return Long.valueOf(this.bU);
  }

  public TestAds getTestAds()
  {
    return this.cj;
  }

  public Boolean getTestDevice()
  {
    return Boolean.valueOf(this.cc);
  }

  public CharSequence getTimezone()
  {
    return this.cg;
  }

  public boolean hasAdReportedIds()
  {
    return fieldSetFlags()[4];
  }

  public boolean hasAdSpaceName()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasAdViewContainer()
  {
    return fieldSetFlags()[8];
  }

  public boolean hasAgentVersion()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasApiKey()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasBindings()
  {
    return fieldSetFlags()[7];
  }

  public boolean hasCanDoSKAppStore()
  {
    return fieldSetFlags()[17];
  }

  public boolean hasDevicePlatform()
  {
    return fieldSetFlags()[12];
  }

  public boolean hasFrequencyCapInfos()
  {
    return fieldSetFlags()[18];
  }

  public boolean hasKeywords()
  {
    return fieldSetFlags()[14];
  }

  public boolean hasLocale()
  {
    return fieldSetFlags()[9];
  }

  public boolean hasLocation()
  {
    return fieldSetFlags()[5];
  }

  public boolean hasNetworkStatus()
  {
    return fieldSetFlags()[16];
  }

  public boolean hasOsVersion()
  {
    return fieldSetFlags()[11];
  }

  public boolean hasRefresh()
  {
    return fieldSetFlags()[15];
  }

  public boolean hasSessionId()
  {
    return fieldSetFlags()[3];
  }

  public boolean hasTestAds()
  {
    return fieldSetFlags()[13];
  }

  public boolean hasTestDevice()
  {
    return fieldSetFlags()[6];
  }

  public boolean hasTimezone()
  {
    return fieldSetFlags()[10];
  }

  public Builder setAdReportedIds(List<AdReportedId> paramList)
  {
    validate(fields()[4], paramList);
    this.ca = paramList;
    fieldSetFlags()[4] = 1;
    return this;
  }

  public Builder setAdSpaceName(CharSequence paramCharSequence)
  {
    validate(fields()[2], paramCharSequence);
    this.bZ = paramCharSequence;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setAdViewContainer(AdViewContainer paramAdViewContainer)
  {
    validate(fields()[8], paramAdViewContainer);
    this.ce = paramAdViewContainer;
    fieldSetFlags()[8] = 1;
    return this;
  }

  public Builder setAgentVersion(CharSequence paramCharSequence)
  {
    validate(fields()[1], paramCharSequence);
    this.bY = paramCharSequence;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setApiKey(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.bX = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setBindings(List<Integer> paramList)
  {
    validate(fields()[7], paramList);
    this.cd = paramList;
    fieldSetFlags()[7] = 1;
    return this;
  }

  public Builder setCanDoSKAppStore(boolean paramBoolean)
  {
    validate(fields()[17], Boolean.valueOf(paramBoolean));
    this.cn = paramBoolean;
    fieldSetFlags()[17] = 1;
    return this;
  }

  public Builder setDevicePlatform(CharSequence paramCharSequence)
  {
    validate(fields()[12], paramCharSequence);
    this.ci = paramCharSequence;
    fieldSetFlags()[12] = 1;
    return this;
  }

  public Builder setFrequencyCapInfos(List<FrequencyCapInfo> paramList)
  {
    validate(fields()[18], paramList);
    this.co = paramList;
    fieldSetFlags()[18] = 1;
    return this;
  }

  public Builder setKeywords(Map<CharSequence, CharSequence> paramMap)
  {
    validate(fields()[14], paramMap);
    this.ck = paramMap;
    fieldSetFlags()[14] = 1;
    return this;
  }

  public Builder setLocale(CharSequence paramCharSequence)
  {
    validate(fields()[9], paramCharSequence);
    this.cf = paramCharSequence;
    fieldSetFlags()[9] = 1;
    return this;
  }

  public Builder setLocation(Location paramLocation)
  {
    validate(fields()[5], paramLocation);
    this.cb = paramLocation;
    fieldSetFlags()[5] = 1;
    return this;
  }

  public Builder setNetworkStatus(int paramInt)
  {
    validate(fields()[16], Integer.valueOf(paramInt));
    this.cm = paramInt;
    fieldSetFlags()[16] = 1;
    return this;
  }

  public Builder setOsVersion(CharSequence paramCharSequence)
  {
    validate(fields()[11], paramCharSequence);
    this.ch = paramCharSequence;
    fieldSetFlags()[11] = 1;
    return this;
  }

  public Builder setRefresh(boolean paramBoolean)
  {
    validate(fields()[15], Boolean.valueOf(paramBoolean));
    this.cl = paramBoolean;
    fieldSetFlags()[15] = 1;
    return this;
  }

  public Builder setSessionId(long paramLong)
  {
    validate(fields()[3], Long.valueOf(paramLong));
    this.bU = paramLong;
    fieldSetFlags()[3] = 1;
    return this;
  }

  public Builder setTestAds(TestAds paramTestAds)
  {
    validate(fields()[13], paramTestAds);
    this.cj = paramTestAds;
    fieldSetFlags()[13] = 1;
    return this;
  }

  public Builder setTestDevice(boolean paramBoolean)
  {
    validate(fields()[6], Boolean.valueOf(paramBoolean));
    this.cc = paramBoolean;
    fieldSetFlags()[6] = 1;
    return this;
  }

  public Builder setTimezone(CharSequence paramCharSequence)
  {
    validate(fields()[10], paramCharSequence);
    this.cg = paramCharSequence;
    fieldSetFlags()[10] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdRequest.Builder
 * JD-Core Version:    0.6.2
 */