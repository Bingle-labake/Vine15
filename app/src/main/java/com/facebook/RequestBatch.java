package com.facebook;

import android.os.Handler;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class RequestBatch extends AbstractList<Request>
{
  private static AtomicInteger idGenerator = new AtomicInteger();
  private String batchApplicationId;
  private Handler callbackHandler;
  private List<Callback> callbacks = new ArrayList();
  private final String id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
  private List<Request> requests = new ArrayList();
  private int timeoutInMilliseconds = 0;

  public RequestBatch()
  {
    this.requests = new ArrayList();
  }

  public RequestBatch(RequestBatch paramRequestBatch)
  {
    this.requests = new ArrayList(paramRequestBatch);
    this.callbackHandler = paramRequestBatch.callbackHandler;
    this.timeoutInMilliseconds = paramRequestBatch.timeoutInMilliseconds;
    this.callbacks = new ArrayList(paramRequestBatch.callbacks);
  }

  public RequestBatch(Collection<Request> paramCollection)
  {
    this.requests = new ArrayList(paramCollection);
  }

  public RequestBatch(Request[] paramArrayOfRequest)
  {
    this.requests = Arrays.asList(paramArrayOfRequest);
  }

  public final void add(int paramInt, Request paramRequest)
  {
    this.requests.add(paramInt, paramRequest);
  }

  public final boolean add(Request paramRequest)
  {
    return this.requests.add(paramRequest);
  }

  public void addCallback(Callback paramCallback)
  {
    if (!this.callbacks.contains(paramCallback))
      this.callbacks.add(paramCallback);
  }

  public final void clear()
  {
    this.requests.clear();
  }

  public final List<Response> executeAndWait()
  {
    return executeAndWaitImpl();
  }

  List<Response> executeAndWaitImpl()
  {
    return Request.executeBatchAndWait(this);
  }

  public final RequestAsyncTask executeAsync()
  {
    return executeAsyncImpl();
  }

  RequestAsyncTask executeAsyncImpl()
  {
    return Request.executeBatchAsync(this);
  }

  public final Request get(int paramInt)
  {
    return (Request)this.requests.get(paramInt);
  }

  final String getBatchApplicationId()
  {
    return this.batchApplicationId;
  }

  final Handler getCallbackHandler()
  {
    return this.callbackHandler;
  }

  final List<Callback> getCallbacks()
  {
    return this.callbacks;
  }

  final String getId()
  {
    return this.id;
  }

  final List<Request> getRequests()
  {
    return this.requests;
  }

  public int getTimeout()
  {
    return this.timeoutInMilliseconds;
  }

  public final Request remove(int paramInt)
  {
    return (Request)this.requests.remove(paramInt);
  }

  public void removeCallback(Callback paramCallback)
  {
    this.callbacks.remove(paramCallback);
  }

  public final Request set(int paramInt, Request paramRequest)
  {
    return (Request)this.requests.set(paramInt, paramRequest);
  }

  final void setBatchApplicationId(String paramString)
  {
    this.batchApplicationId = paramString;
  }

  final void setCallbackHandler(Handler paramHandler)
  {
    this.callbackHandler = paramHandler;
  }

  public void setTimeout(int paramInt)
  {
    if (paramInt < 0)
      throw new IllegalArgumentException("Argument timeoutInMilliseconds must be >= 0.");
    this.timeoutInMilliseconds = paramInt;
  }

  public final int size()
  {
    return this.requests.size();
  }

  public static abstract interface Callback
  {
    public abstract void onBatchCompleted(RequestBatch paramRequestBatch);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.RequestBatch
 * JD-Core Version:    0.6.2
 */