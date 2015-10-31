package co.vine.android.api;

import android.util.SparseIntArray;
import co.vine.android.util.FlexibleStringHashMap;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VineVenue
  implements Externalizable
{
  static final Pattern FOURSQUARE_CATEGORY = Pattern.compile("/([^/]+?)/([^/]+?)_\\d*?.png");
  public static final int TYPE_ARTS_ENTERTAINMENT = 11;
  public static final int TYPE_BIG_HUMAN = 2;
  public static final int TYPE_EBAY = 3;
  public static final int TYPE_EDUCATION = 18;
  public static final int TYPE_FACEBOOK = 5;
  public static final int TYPE_GILT = 4;
  public static final int TYPE_GOOGLE = 6;
  public static final int TYPE_JETSETTER = 19;
  public static final int TYPE_NATURE = 14;
  public static final int TYPE_NIGHTLIFE = 13;
  public static final int TYPE_OFFICE = 15;
  public static final int TYPE_OTHER = 20;
  public static final int TYPE_RESIDENTIAL = 10;
  public static final int TYPE_RESTAURANT = 12;
  public static final int TYPE_SHOPS = 16;
  public static final int TYPE_SQUARE = 8;
  public static final int TYPE_SQUARESPACE = 7;
  public static final int TYPE_TRAVEL = 17;
  public static final int TYPE_TWITTER = 9;
  public static final int TYPE_VINE = 1;
  public static final SparseIntArray iconMap = new SparseIntArray();
  private static final long serialVersionUID = 362104582584848336L;
  private static final HashMap<String, Integer> venueMap = new FlexibleStringHashMap();
  public String address;
  public String categoryIconUrl;
  public String categoryId;
  public String categoryName;
  public String city;
  public String countryCode;
  public int displayType;
  public String state;
  public String venueName;

  static
  {
    iconMap.put(1, 2130837827);
    iconMap.put(2, 2130837809);
    iconMap.put(3, 2130837810);
    iconMap.put(4, 2130837813);
    iconMap.put(5, 2130837812);
    iconMap.put(6, 2130837814);
    iconMap.put(7, 2130837823);
    iconMap.put(8, 2130837822);
    iconMap.put(9, 2130837825);
    iconMap.put(10, 2130837819);
    iconMap.put(11, 2130837811);
    iconMap.put(12, 2130837820);
    iconMap.put(13, 2130837817);
    iconMap.put(14, 2130837816);
    iconMap.put(15, 2130837818);
    iconMap.put(16, 2130837821);
    iconMap.put(17, 2130837824);
    iconMap.put(18, 2130837826);
    iconMap.put(19, 2130837815);
    iconMap.put(20, 2130837843);
    venueMap.put("vine hq", Integer.valueOf(1));
    venueMap.put("verse hq", Integer.valueOf(1));
    venueMap.put("twitter nyc", Integer.valueOf(9));
    venueMap.put("twitter, inc", Integer.valueOf(9));
    venueMap.put("square, inc", Integer.valueOf(8));
    venueMap.put("squarespace hq", Integer.valueOf(7));
    venueMap.put("jetsetter", Integer.valueOf(19));
    venueMap.put("gilt city", Integer.valueOf(4));
    venueMap.put("gilt groupe", Integer.valueOf(4));
    venueMap.put("facebook", Integer.valueOf(5));
    venueMap.put("ebay", Integer.valueOf(3));
    venueMap.put("big human", Integer.valueOf(2));
    venueMap.put("arts_entertainment", Integer.valueOf(11));
    venueMap.put("education", Integer.valueOf(18));
    venueMap.put("event", Integer.valueOf(11));
    venueMap.put("food", Integer.valueOf(12));
    venueMap.put("home", Integer.valueOf(10));
    venueMap.put("nightlife", Integer.valueOf(13));
    venueMap.put("parks_outdoors", Integer.valueOf(14));
    venueMap.put("travel", Integer.valueOf(17));
    venueMap.put("shops", Integer.valueOf(16));
    venueMap.put("nightlife", Integer.valueOf(13));
    venueMap.put("tech startup", Integer.valueOf(15));
  }

  public VineVenue()
  {
  }

  public VineVenue(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8)
  {
    if (paramString6 != null);
    for (String str1 = paramString6.toLowerCase(); ; str1 = null)
    {
      String str2 = null;
      if (paramString2 != null)
        str2 = paramString2.toLowerCase();
      this.categoryIconUrl = paramString1;
      this.categoryName = paramString2;
      this.categoryId = paramString3;
      this.city = paramString4;
      this.countryCode = paramString5;
      this.venueName = paramString6;
      this.state = paramString7;
      this.address = paramString8;
      Integer localInteger = (Integer)venueMap.get(str1);
      if ((localInteger == null) || (localInteger.intValue() <= 0))
      {
        localInteger = (Integer)venueMap.get(str2);
        if (((localInteger == null) || (localInteger.intValue() <= 0)) && (paramString1 != null))
        {
          Matcher localMatcher = FOURSQUARE_CATEGORY.matcher(paramString1);
          if (localMatcher.find())
          {
            String str3 = localMatcher.group(2).toLowerCase();
            localInteger = (Integer)venueMap.get(str3);
            if ((localInteger == null) || (localInteger.intValue() <= 0))
            {
              String str4 = localMatcher.group(1).toLowerCase();
              localInteger = (Integer)venueMap.get(str4);
            }
          }
        }
      }
      if ((localInteger == null) || (localInteger.intValue() <= 0))
        localInteger = Integer.valueOf(20);
      this.displayType = localInteger.intValue();
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineVenue localVineVenue;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineVenue = (VineVenue)paramObject;
      if (this.displayType != localVineVenue.displayType)
        return false;
      if (this.address != null)
      {
        if (this.address.equals(localVineVenue.address));
      }
      else
        while (localVineVenue.address != null)
          return false;
      if (this.categoryIconUrl != null)
      {
        if (this.categoryIconUrl.equals(localVineVenue.categoryIconUrl));
      }
      else
        while (localVineVenue.categoryIconUrl != null)
          return false;
      if (this.categoryId != null)
      {
        if (this.categoryId.equals(localVineVenue.categoryId));
      }
      else
        while (localVineVenue.categoryId != null)
          return false;
      if (this.categoryName != null)
      {
        if (this.categoryName.equals(localVineVenue.categoryName));
      }
      else
        while (localVineVenue.categoryName != null)
          return false;
      if (this.city != null)
      {
        if (this.city.equals(localVineVenue.city));
      }
      else
        while (localVineVenue.city != null)
          return false;
      if (this.countryCode != null)
      {
        if (this.countryCode.equals(localVineVenue.countryCode));
      }
      else
        while (localVineVenue.countryCode != null)
          return false;
      if (this.state != null)
      {
        if (this.state.equals(localVineVenue.state));
      }
      else
        while (localVineVenue.state != null)
          return false;
      if (this.venueName == null)
        break;
    }
    while (this.venueName.equals(localVineVenue.venueName));
    while (true)
    {
      return false;
      if (localVineVenue.venueName == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int n;
    label59: int i2;
    label85: int i4;
    label111: int i6;
    label137: int i7;
    if (this.categoryIconUrl != null)
    {
      i = this.categoryIconUrl.hashCode();
      int j = i * 31;
      if (this.categoryName == null)
        break label215;
      k = this.categoryName.hashCode();
      int m = 31 * (j + k);
      if (this.categoryId == null)
        break label220;
      n = this.categoryId.hashCode();
      int i1 = 31 * (m + n);
      if (this.city == null)
        break label226;
      i2 = this.city.hashCode();
      int i3 = 31 * (i1 + i2);
      if (this.countryCode == null)
        break label232;
      i4 = this.countryCode.hashCode();
      int i5 = 31 * (i3 + i4);
      if (this.venueName == null)
        break label238;
      i6 = this.venueName.hashCode();
      i7 = 31 * (i5 + i6);
      if (this.state == null)
        break label244;
    }
    label215: label220: label226: label232: label238: label244: for (int i8 = this.state.hashCode(); ; i8 = 0)
    {
      int i9 = 31 * (i7 + i8);
      String str = this.address;
      int i10 = 0;
      if (str != null)
        i10 = this.address.hashCode();
      return 31 * (i9 + i10) + this.displayType;
      i = 0;
      break;
      k = 0;
      break label35;
      n = 0;
      break label59;
      i2 = 0;
      break label85;
      i4 = 0;
      break label111;
      i6 = 0;
      break label137;
    }
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.categoryIconUrl = ((String)paramObjectInput.readObject());
    this.categoryName = ((String)paramObjectInput.readObject());
    this.categoryId = ((String)paramObjectInput.readObject());
    this.city = ((String)paramObjectInput.readObject());
    this.countryCode = ((String)paramObjectInput.readObject());
    this.venueName = ((String)paramObjectInput.readObject());
    this.state = ((String)paramObjectInput.readObject());
    this.address = ((String)paramObjectInput.readObject());
    this.displayType = paramObjectInput.readInt();
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(this.categoryIconUrl);
    paramObjectOutput.writeObject(this.categoryName);
    paramObjectOutput.writeObject(this.categoryId);
    paramObjectOutput.writeObject(this.city);
    paramObjectOutput.writeObject(this.countryCode);
    paramObjectOutput.writeObject(this.venueName);
    paramObjectOutput.writeObject(this.state);
    paramObjectOutput.writeObject(this.address);
    paramObjectOutput.writeInt(this.displayType);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineVenue
 * JD-Core Version:    0.6.2
 */