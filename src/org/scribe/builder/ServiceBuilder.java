package org.scribe.builder;

import java.io.OutputStream;
import org.scribe.builder.api.Api;
import org.scribe.exceptions.OAuthException;
import org.scribe.model.OAuthConfig;
import org.scribe.model.SignatureType;
import org.scribe.oauth.OAuthService;
import org.scribe.utils.Preconditions;

public class ServiceBuilder
{
  private Api api;
  private String apiKey;
  private String apiSecret;
  private String callback = "oob";
  private OutputStream debugStream = null;
  private String scope;
  private SignatureType signatureType = SignatureType.Header;

  private Api createApi(Class<? extends Api> paramClass)
  {
    Preconditions.checkNotNull(paramClass, "Api class cannot be null");
    try
    {
      Api localApi = (Api)paramClass.newInstance();
      return localApi;
    }
    catch (Exception localException)
    {
      throw new OAuthException("Error while creating the Api object", localException);
    }
  }

  public ServiceBuilder apiKey(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Invalid Api key");
    this.apiKey = paramString;
    return this;
  }

  public ServiceBuilder apiSecret(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Invalid Api secret");
    this.apiSecret = paramString;
    return this;
  }

  public OAuthService build()
  {
    Preconditions.checkNotNull(this.api, "You must specify a valid api through the provider() method");
    Preconditions.checkEmptyString(this.apiKey, "You must provide an api key");
    Preconditions.checkEmptyString(this.apiSecret, "You must provide an api secret");
    return this.api.createService(new OAuthConfig(this.apiKey, this.apiSecret, this.callback, this.signatureType, this.scope, this.debugStream));
  }

  public ServiceBuilder callback(String paramString)
  {
    Preconditions.checkValidOAuthCallback(paramString, "Callback must be a valid URL or 'oob'");
    this.callback = paramString;
    return this;
  }

  public ServiceBuilder debug()
  {
    debugStream(System.out);
    return this;
  }

  public ServiceBuilder debugStream(OutputStream paramOutputStream)
  {
    Preconditions.checkNotNull(paramOutputStream, "debug stream can't be null");
    this.debugStream = paramOutputStream;
    return this;
  }

  public ServiceBuilder provider(Class<? extends Api> paramClass)
  {
    this.api = createApi(paramClass);
    return this;
  }

  public ServiceBuilder provider(Api paramApi)
  {
    Preconditions.checkNotNull(paramApi, "Api cannot be null");
    this.api = paramApi;
    return this;
  }

  public ServiceBuilder scope(String paramString)
  {
    Preconditions.checkEmptyString(paramString, "Invalid OAuth scope");
    this.scope = paramString;
    return this;
  }

  public ServiceBuilder signatureType(SignatureType paramSignatureType)
  {
    Preconditions.checkNotNull(paramSignatureType, "Signature type can't be null");
    this.signatureType = paramSignatureType;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.ServiceBuilder
 * JD-Core Version:    0.6.2
 */