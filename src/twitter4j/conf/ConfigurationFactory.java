package twitter4j.conf;

public abstract interface ConfigurationFactory
{
  public abstract void dispose();

  public abstract Configuration getInstance();

  public abstract Configuration getInstance(String paramString);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.conf.ConfigurationFactory
 * JD-Core Version:    0.6.2
 */