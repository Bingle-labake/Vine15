package twitter4j.internal.json;

import twitter4j.conf.Configuration;

public class z_T4JInternalJSONImplFactory
  implements z_T4JInternalFactory
{
  private static final long serialVersionUID = 5217622295050444866L;
  private Configuration conf;

  public z_T4JInternalJSONImplFactory(Configuration paramConfiguration)
  {
    this.conf = paramConfiguration;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    z_T4JInternalJSONImplFactory localz_T4JInternalJSONImplFactory;
    do
    {
      return true;
      if (!(paramObject instanceof z_T4JInternalJSONImplFactory))
        return false;
      localz_T4JInternalJSONImplFactory = (z_T4JInternalJSONImplFactory)paramObject;
      if (this.conf == null)
        break;
    }
    while (this.conf.equals(localz_T4JInternalJSONImplFactory.conf));
    while (true)
    {
      return false;
      if (localz_T4JInternalJSONImplFactory.conf == null)
        break;
    }
  }

  public int hashCode()
  {
    if (this.conf != null)
      return this.conf.hashCode();
    return 0;
  }

  public String toString()
  {
    return "JSONImplFactory{conf=" + this.conf + '}';
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.json.z_T4JInternalJSONImplFactory
 * JD-Core Version:    0.6.2
 */