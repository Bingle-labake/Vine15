package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import java.io.IOException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class GoogleCloudMessaging
{
  public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
  public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
  public static final String MESSAGE_TYPE_DELETED = "deleted_messages";
  public static final String MESSAGE_TYPE_MESSAGE = "gcm";
  public static final String MESSAGE_TYPE_SEND_ERROR = "send_error";
  static GoogleCloudMessaging ef;
  private Context eg;
  private PendingIntent eh;
  final BlockingQueue<Intent> ei = new LinkedBlockingQueue();
  private Handler ej = new Handler(Looper.getMainLooper())
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      Intent localIntent = (Intent)paramAnonymousMessage.obj;
      GoogleCloudMessaging.this.ei.add(localIntent);
    }
  };
  private Messenger ek = new Messenger(this.ej);

  private void aw()
  {
    Intent localIntent = new Intent("com.google.android.c2dm.intent.UNREGISTER");
    localIntent.setPackage("com.google.android.gms");
    this.ei.clear();
    localIntent.putExtra("google.messenger", this.ek);
    b(localIntent);
    this.eg.startService(localIntent);
  }

  private void b(String[] paramArrayOfString)
  {
    String str = c(paramArrayOfString);
    Intent localIntent = new Intent("com.google.android.c2dm.intent.REGISTER");
    localIntent.setPackage("com.google.android.gms");
    localIntent.putExtra("google.messenger", this.ek);
    b(localIntent);
    localIntent.putExtra("sender", str);
    this.eg.startService(localIntent);
  }

  public static GoogleCloudMessaging getInstance(Context paramContext)
  {
    try
    {
      if (ef == null)
      {
        ef = new GoogleCloudMessaging();
        ef.eg = paramContext;
      }
      GoogleCloudMessaging localGoogleCloudMessaging = ef;
      return localGoogleCloudMessaging;
    }
    finally
    {
    }
  }

  void ax()
  {
    try
    {
      if (this.eh != null)
      {
        this.eh.cancel();
        this.eh = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void b(Intent paramIntent)
  {
    try
    {
      if (this.eh == null)
        this.eh = PendingIntent.getBroadcast(this.eg, 0, new Intent(), 0);
      paramIntent.putExtra("app", this.eh);
      return;
    }
    finally
    {
    }
  }

  String c(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0))
      throw new IllegalArgumentException("No senderIds");
    StringBuilder localStringBuilder = new StringBuilder(paramArrayOfString[0]);
    for (int i = 1; i < paramArrayOfString.length; i++)
      localStringBuilder.append(',').append(paramArrayOfString[i]);
    return localStringBuilder.toString();
  }

  public void close()
  {
    ax();
  }

  public String getMessageType(Intent paramIntent)
  {
    String str;
    if (!"com.google.android.c2dm.intent.RECEIVE".equals(paramIntent.getAction()))
      str = null;
    do
    {
      return str;
      str = paramIntent.getStringExtra("message_type");
    }
    while (str != null);
    return "gcm";
  }

  public String register(String[] paramArrayOfString)
    throws IOException
  {
    if (Looper.getMainLooper() == Looper.myLooper())
      throw new IOException("MAIN_THREAD");
    this.ei.clear();
    b(paramArrayOfString);
    Intent localIntent;
    try
    {
      localIntent = (Intent)this.ei.poll(5000L, TimeUnit.MILLISECONDS);
      if (localIntent == null)
        throw new IOException("SERVICE_NOT_AVAILABLE");
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new IOException(localInterruptedException.getMessage());
    }
    String str1 = localIntent.getStringExtra("registration_id");
    if (str1 != null)
      return str1;
    localIntent.getStringExtra("error");
    String str2 = localIntent.getStringExtra("error");
    if (str2 != null)
      throw new IOException(str2);
    throw new IOException("SERVICE_NOT_AVAILABLE");
  }

  public void send(String paramString1, String paramString2, long paramLong, Bundle paramBundle)
    throws IOException
  {
    if (Looper.getMainLooper() == Looper.myLooper())
      throw new IOException("MAIN_THREAD");
    if (paramString1 == null)
      throw new IllegalArgumentException("Missing 'to'");
    Intent localIntent = new Intent("com.google.android.gcm.intent.SEND");
    localIntent.putExtras(paramBundle);
    b(localIntent);
    localIntent.putExtra("google.to", paramString1);
    localIntent.putExtra("google.message_id", paramString2);
    localIntent.putExtra("google.ttl", Long.toString(paramLong));
    this.eg.sendOrderedBroadcast(localIntent, null);
  }

  public void send(String paramString1, String paramString2, Bundle paramBundle)
    throws IOException
  {
    send(paramString1, paramString2, -1L, paramBundle);
  }

  public void unregister()
    throws IOException
  {
    if (Looper.getMainLooper() == Looper.myLooper())
      throw new IOException("MAIN_THREAD");
    aw();
    Intent localIntent;
    try
    {
      localIntent = (Intent)this.ei.poll(5000L, TimeUnit.MILLISECONDS);
      if (localIntent == null)
        throw new IOException("SERVICE_NOT_AVAILABLE");
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new IOException(localInterruptedException.getMessage());
    }
    if (localIntent.getStringExtra("unregistered") != null)
      return;
    String str = localIntent.getStringExtra("error");
    if (str != null)
      throw new IOException(str);
    throw new IOException("SERVICE_NOT_AVAILABLE");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.gcm.GoogleCloudMessaging
 * JD-Core Version:    0.6.2
 */