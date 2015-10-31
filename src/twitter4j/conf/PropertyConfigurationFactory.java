package twitter4j.conf;

class PropertyConfigurationFactory
  implements ConfigurationFactory
{
  private static final PropertyConfiguration ROOT_CONFIGURATION = new PropertyConfiguration();

  public void dispose()
  {
  }

  public Configuration getInstance()
  {
    return ROOT_CONFIGURATION;
  }

  public Configuration getInstance(String paramString)
  {
    return new PropertyConfiguration(paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.conf.PropertyConfigurationFactory
 * JD-Core Version:    0.6.2
 */