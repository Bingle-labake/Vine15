package com.android.debug.hv;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.Window;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

public class ViewServer
  implements Runnable
{
  private static final String BUILD_TYPE_USER = "user";
  private static final String COMMAND_PROTOCOL_VERSION = "PROTOCOL";
  private static final String COMMAND_SERVER_VERSION = "SERVER";
  private static final String COMMAND_WINDOW_MANAGER_AUTOLIST = "AUTOLIST";
  private static final String COMMAND_WINDOW_MANAGER_GET_FOCUS = "GET_FOCUS";
  private static final String COMMAND_WINDOW_MANAGER_LIST = "LIST";
  private static final String LOG_TAG = "ViewServer";
  private static final String VALUE_PROTOCOL_VERSION = "4";
  private static final String VALUE_SERVER_VERSION = "4";
  private static final int VIEW_SERVER_DEFAULT_PORT = 4939;
  private static final int VIEW_SERVER_MAX_CONNECTIONS = 10;
  private static ViewServer sServer;
  private final ReentrantReadWriteLock mFocusLock = new ReentrantReadWriteLock();
  private View mFocusedWindow;
  private final List<WindowListener> mListeners = new CopyOnWriteArrayList();
  private final int mPort;
  private ServerSocket mServer;
  private Thread mThread;
  private ExecutorService mThreadPool;
  private final HashMap<View, String> mWindows = new HashMap();
  private final ReentrantReadWriteLock mWindowsLock = new ReentrantReadWriteLock();

  private ViewServer()
  {
    this.mPort = -1;
  }

  private ViewServer(int paramInt)
  {
    this.mPort = paramInt;
  }

  private void addWindowListener(WindowListener paramWindowListener)
  {
    if (!this.mListeners.contains(paramWindowListener))
      this.mListeners.add(paramWindowListener);
  }

  private void fireFocusChangedEvent()
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
      ((WindowListener)localIterator.next()).focusChanged();
  }

  private void fireWindowsChangedEvent()
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
      ((WindowListener)localIterator.next()).windowsChanged();
  }

  public static ViewServer get(Context paramContext)
  {
    ApplicationInfo localApplicationInfo = paramContext.getApplicationInfo();
    if (("user".equals(Build.TYPE)) && ((0x2 & localApplicationInfo.flags) != 0))
    {
      if (sServer == null)
        sServer = new ViewServer(4939);
      if (sServer.isRunning());
    }
    while (true)
    {
      try
      {
        sServer.start();
        return sServer;
      }
      catch (IOException localIOException)
      {
        Log.d("ViewServer", "Error:", localIOException);
        continue;
      }
      sServer = new NoopViewServer(null);
    }
  }

  private void removeWindowListener(WindowListener paramWindowListener)
  {
    this.mListeners.remove(paramWindowListener);
  }

  // ERROR //
  private static boolean writeValue(Socket paramSocket, String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 194	java/io/BufferedWriter
    //   5: dup
    //   6: new 196	java/io/OutputStreamWriter
    //   9: dup
    //   10: aload_0
    //   11: invokevirtual 202	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
    //   14: invokespecial 205	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
    //   17: sipush 8192
    //   20: invokespecial 208	java/io/BufferedWriter:<init>	(Ljava/io/Writer;I)V
    //   23: astore_3
    //   24: aload_3
    //   25: aload_1
    //   26: invokevirtual 212	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   29: aload_3
    //   30: ldc 214
    //   32: invokevirtual 212	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   35: aload_3
    //   36: invokevirtual 217	java/io/BufferedWriter:flush	()V
    //   39: iconst_1
    //   40: istore 5
    //   42: aload_3
    //   43: ifnull +65 -> 108
    //   46: aload_3
    //   47: invokevirtual 220	java/io/BufferedWriter:close	()V
    //   50: iload 5
    //   52: ireturn
    //   53: astore 9
    //   55: iconst_0
    //   56: ireturn
    //   57: astore 10
    //   59: iconst_0
    //   60: istore 5
    //   62: aload_2
    //   63: ifnull -13 -> 50
    //   66: aload_2
    //   67: invokevirtual 220	java/io/BufferedWriter:close	()V
    //   70: iconst_0
    //   71: ireturn
    //   72: astore 6
    //   74: iconst_0
    //   75: ireturn
    //   76: astore 7
    //   78: aload_2
    //   79: ifnull +7 -> 86
    //   82: aload_2
    //   83: invokevirtual 220	java/io/BufferedWriter:close	()V
    //   86: aload 7
    //   88: athrow
    //   89: astore 8
    //   91: goto -5 -> 86
    //   94: astore 7
    //   96: aload_3
    //   97: astore_2
    //   98: goto -20 -> 78
    //   101: astore 4
    //   103: aload_3
    //   104: astore_2
    //   105: goto -46 -> 59
    //   108: iload 5
    //   110: ireturn
    //
    // Exception table:
    //   from	to	target	type
    //   46	50	53	java/io/IOException
    //   2	24	57	java/lang/Exception
    //   66	70	72	java/io/IOException
    //   2	24	76	finally
    //   82	86	89	java/io/IOException
    //   24	39	94	finally
    //   24	39	101	java/lang/Exception
  }

  public void addWindow(Activity paramActivity)
  {
    String str1 = paramActivity.getTitle().toString();
    if (TextUtils.isEmpty(str1));
    for (String str2 = paramActivity.getClass().getCanonicalName() + "/0x" + System.identityHashCode(paramActivity); ; str2 = str1 + "(" + paramActivity.getClass().getCanonicalName() + ")")
    {
      addWindow(paramActivity.getWindow().getDecorView(), str2);
      return;
    }
  }

  public void addWindow(View paramView, String paramString)
  {
    this.mWindowsLock.writeLock().lock();
    try
    {
      this.mWindows.put(paramView.getRootView(), paramString);
      this.mWindowsLock.writeLock().unlock();
      fireWindowsChangedEvent();
      return;
    }
    finally
    {
      this.mWindowsLock.writeLock().unlock();
    }
  }

  public boolean isRunning()
  {
    return (this.mThread != null) && (this.mThread.isAlive());
  }

  public void removeWindow(Activity paramActivity)
  {
    removeWindow(paramActivity.getWindow().getDecorView());
  }

  public void removeWindow(View paramView)
  {
    this.mWindowsLock.writeLock().lock();
    try
    {
      this.mWindows.remove(paramView.getRootView());
      this.mWindowsLock.writeLock().unlock();
      fireWindowsChangedEvent();
      return;
    }
    finally
    {
      this.mWindowsLock.writeLock().unlock();
    }
  }

  public void run()
  {
    try
    {
      this.mServer = new ServerSocket(this.mPort, 10, InetAddress.getLocalHost());
      while (true)
      {
        if ((this.mServer == null) || (Thread.currentThread() != this.mThread))
          return;
        try
        {
          localSocket = this.mServer.accept();
          if (this.mThreadPool == null)
            break;
          this.mThreadPool.submit(new ViewServerWorker(localSocket));
        }
        catch (Exception localException2)
        {
          Log.w("ViewServer", "Connection error: ", localException2);
        }
      }
    }
    catch (Exception localException1)
    {
      while (true)
      {
        Socket localSocket;
        Log.w("ViewServer", "Starting ServerSocket error: ", localException1);
        continue;
        try
        {
          localSocket.close();
        }
        catch (IOException localIOException)
        {
          localIOException.printStackTrace();
        }
      }
    }
  }

  public void setFocusedWindow(Activity paramActivity)
  {
    setFocusedWindow(paramActivity.getWindow().getDecorView());
  }

  public void setFocusedWindow(View paramView)
  {
    this.mFocusLock.writeLock().lock();
    Object localObject2;
    if (paramView == null)
      localObject2 = null;
    try
    {
      while (true)
      {
        this.mFocusedWindow = localObject2;
        this.mFocusLock.writeLock().unlock();
        fireFocusChangedEvent();
        return;
        View localView = paramView.getRootView();
        localObject2 = localView;
      }
    }
    finally
    {
      this.mFocusLock.writeLock().unlock();
    }
  }

  public boolean start()
    throws IOException
  {
    if (this.mThread != null)
      return false;
    this.mThread = new Thread(this, "Local View Server [port=" + this.mPort + "]");
    this.mThreadPool = Executors.newFixedThreadPool(10);
    this.mThread.start();
    return true;
  }

  // ERROR //
  public boolean stop()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 310	com/android/debug/hv/ViewServer:mThread	Ljava/lang/Thread;
    //   4: ifnull +75 -> 79
    //   7: aload_0
    //   8: getfield 310	com/android/debug/hv/ViewServer:mThread	Ljava/lang/Thread;
    //   11: invokevirtual 394	java/lang/Thread:interrupt	()V
    //   14: aload_0
    //   15: getfield 346	com/android/debug/hv/ViewServer:mThreadPool	Ljava/util/concurrent/ExecutorService;
    //   18: ifnull +13 -> 31
    //   21: aload_0
    //   22: getfield 346	com/android/debug/hv/ViewServer:mThreadPool	Ljava/util/concurrent/ExecutorService;
    //   25: invokeinterface 398 1 0
    //   30: pop
    //   31: aload_0
    //   32: aconst_null
    //   33: putfield 346	com/android/debug/hv/ViewServer:mThreadPool	Ljava/util/concurrent/ExecutorService;
    //   36: aload_0
    //   37: aconst_null
    //   38: putfield 310	com/android/debug/hv/ViewServer:mThread	Ljava/lang/Thread;
    //   41: aload_0
    //   42: getfield 336	com/android/debug/hv/ViewServer:mServer	Ljava/net/ServerSocket;
    //   45: invokevirtual 399	java/net/ServerSocket:close	()V
    //   48: aload_0
    //   49: aconst_null
    //   50: putfield 336	com/android/debug/hv/ViewServer:mServer	Ljava/net/ServerSocket;
    //   53: iconst_1
    //   54: ireturn
    //   55: astore 5
    //   57: ldc 28
    //   59: ldc_w 401
    //   62: invokestatic 404	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   65: pop
    //   66: goto -35 -> 31
    //   69: astore_3
    //   70: ldc 28
    //   72: ldc_w 406
    //   75: invokestatic 404	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   78: pop
    //   79: aload_0
    //   80: getfield 76	com/android/debug/hv/ViewServer:mWindowsLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   83: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   86: invokevirtual 294	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:lock	()V
    //   89: aload_0
    //   90: getfield 71	com/android/debug/hv/ViewServer:mWindows	Ljava/util/HashMap;
    //   93: invokevirtual 409	java/util/HashMap:clear	()V
    //   96: aload_0
    //   97: getfield 76	com/android/debug/hv/ViewServer:mWindowsLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   100: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   103: invokevirtual 306	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   106: aload_0
    //   107: getfield 78	com/android/debug/hv/ViewServer:mFocusLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   110: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   113: invokevirtual 294	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:lock	()V
    //   116: aload_0
    //   117: aconst_null
    //   118: putfield 94	com/android/debug/hv/ViewServer:mFocusedWindow	Landroid/view/View;
    //   121: aload_0
    //   122: getfield 78	com/android/debug/hv/ViewServer:mFocusLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   125: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   128: invokevirtual 306	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   131: iconst_0
    //   132: ireturn
    //   133: astore_1
    //   134: aload_0
    //   135: getfield 76	com/android/debug/hv/ViewServer:mWindowsLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   138: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   141: invokevirtual 306	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   144: aload_1
    //   145: athrow
    //   146: astore_2
    //   147: aload_0
    //   148: getfield 78	com/android/debug/hv/ViewServer:mFocusLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   151: invokevirtual 289	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   154: invokevirtual 306	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   157: aload_2
    //   158: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   21	31	55	java/lang/SecurityException
    //   41	53	69	java/io/IOException
    //   89	96	133	finally
    //   116	121	146	finally
  }

  private static class NoopViewServer extends ViewServer
  {
    private NoopViewServer()
    {
      super();
    }

    public void addWindow(Activity paramActivity)
    {
    }

    public void addWindow(View paramView, String paramString)
    {
    }

    public boolean isRunning()
    {
      return false;
    }

    public void removeWindow(Activity paramActivity)
    {
    }

    public void removeWindow(View paramView)
    {
    }

    public void run()
    {
    }

    public void setFocusedWindow(Activity paramActivity)
    {
    }

    public void setFocusedWindow(View paramView)
    {
    }

    public boolean start()
      throws IOException
    {
      return false;
    }

    public boolean stop()
    {
      return false;
    }
  }

  private static class UncloseableOutputStream extends OutputStream
  {
    private final OutputStream mStream;

    UncloseableOutputStream(OutputStream paramOutputStream)
    {
      this.mStream = paramOutputStream;
    }

    public void close()
      throws IOException
    {
    }

    public boolean equals(Object paramObject)
    {
      return this.mStream.equals(paramObject);
    }

    public void flush()
      throws IOException
    {
      this.mStream.flush();
    }

    public int hashCode()
    {
      return this.mStream.hashCode();
    }

    public String toString()
    {
      return this.mStream.toString();
    }

    public void write(int paramInt)
      throws IOException
    {
      this.mStream.write(paramInt);
    }

    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      this.mStream.write(paramArrayOfByte);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      this.mStream.write(paramArrayOfByte, paramInt1, paramInt2);
    }
  }

  private class ViewServerWorker
    implements Runnable, ViewServer.WindowListener
  {
    private Socket mClient;
    private final Object[] mLock = new Object[0];
    private boolean mNeedFocusedWindowUpdate;
    private boolean mNeedWindowListUpdate;

    public ViewServerWorker(Socket arg2)
    {
      Object localObject;
      this.mClient = localObject;
      this.mNeedWindowListUpdate = false;
      this.mNeedFocusedWindowUpdate = false;
    }

    private View findWindow(int paramInt)
    {
      if (paramInt == -1)
      {
        ViewServer.this.mWindowsLock.readLock().lock();
        try
        {
          View localView2 = ViewServer.this.mFocusedWindow;
          return localView2;
        }
        finally
        {
          ViewServer.this.mWindowsLock.readLock().unlock();
        }
      }
      ViewServer.this.mWindowsLock.readLock().lock();
      try
      {
        Iterator localIterator = ViewServer.this.mWindows.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          if (System.identityHashCode(localEntry.getKey()) == paramInt)
          {
            View localView1 = (View)localEntry.getKey();
            return localView1;
          }
        }
        return null;
      }
      finally
      {
        ViewServer.this.mWindowsLock.readLock().unlock();
      }
    }

    // ERROR //
    private boolean getFocusedWindow(Socket paramSocket)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_2
      //   2: new 105	java/io/BufferedWriter
      //   5: dup
      //   6: new 107	java/io/OutputStreamWriter
      //   9: dup
      //   10: aload_1
      //   11: invokevirtual 113	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
      //   14: invokespecial 116	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
      //   17: sipush 8192
      //   20: invokespecial 119	java/io/BufferedWriter:<init>	(Ljava/io/Writer;I)V
      //   23: astore_3
      //   24: aload_0
      //   25: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   28: invokestatic 122	com/android/debug/hv/ViewServer:access$600	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   31: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   34: invokevirtual 51	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
      //   37: aload_0
      //   38: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   41: invokestatic 55	com/android/debug/hv/ViewServer:access$400	(Lcom/android/debug/hv/ViewServer;)Landroid/view/View;
      //   44: astore 11
      //   46: aload_0
      //   47: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   50: invokestatic 122	com/android/debug/hv/ViewServer:access$600	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   53: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   56: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   59: aload 11
      //   61: ifnull +76 -> 137
      //   64: aload_0
      //   65: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   68: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   71: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   74: invokevirtual 51	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
      //   77: aload_0
      //   78: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   81: invokestatic 62	com/android/debug/hv/ViewServer:access$500	(Lcom/android/debug/hv/ViewServer;)Ljava/util/HashMap;
      //   84: aload_0
      //   85: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   88: invokestatic 55	com/android/debug/hv/ViewServer:access$400	(Lcom/android/debug/hv/ViewServer;)Landroid/view/View;
      //   91: invokevirtual 126	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
      //   94: checkcast 128	java/lang/String
      //   97: astore 13
      //   99: aload_0
      //   100: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   103: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   106: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   109: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   112: aload_3
      //   113: aload 11
      //   115: invokestatic 95	java/lang/System:identityHashCode	(Ljava/lang/Object;)I
      //   118: invokestatic 134	java/lang/Integer:toHexString	(I)Ljava/lang/String;
      //   121: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   124: aload_3
      //   125: bipush 32
      //   127: invokevirtual 141	java/io/BufferedWriter:write	(I)V
      //   130: aload_3
      //   131: aload 13
      //   133: invokevirtual 145	java/io/BufferedWriter:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
      //   136: pop
      //   137: aload_3
      //   138: bipush 10
      //   140: invokevirtual 141	java/io/BufferedWriter:write	(I)V
      //   143: aload_3
      //   144: invokevirtual 148	java/io/BufferedWriter:flush	()V
      //   147: aload_3
      //   148: ifnull +111 -> 259
      //   151: aload_3
      //   152: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   155: iload_2
      //   156: ireturn
      //   157: astore 10
      //   159: aload_0
      //   160: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   163: invokestatic 122	com/android/debug/hv/ViewServer:access$600	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   166: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   169: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   172: aload 10
      //   174: athrow
      //   175: astore 7
      //   177: aload_3
      //   178: astore 8
      //   180: iconst_0
      //   181: istore_2
      //   182: aload 8
      //   184: ifnull -29 -> 155
      //   187: aload 8
      //   189: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   192: iconst_0
      //   193: ireturn
      //   194: astore 9
      //   196: iconst_0
      //   197: ireturn
      //   198: astore 12
      //   200: aload_0
      //   201: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   204: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   207: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   210: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   213: aload 12
      //   215: athrow
      //   216: astore 4
      //   218: aload_3
      //   219: astore 5
      //   221: aload 5
      //   223: ifnull +8 -> 231
      //   226: aload 5
      //   228: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   231: aload 4
      //   233: athrow
      //   234: astore 15
      //   236: iconst_0
      //   237: ireturn
      //   238: astore 6
      //   240: goto -9 -> 231
      //   243: astore 4
      //   245: aconst_null
      //   246: astore 5
      //   248: goto -27 -> 221
      //   251: astore 16
      //   253: aconst_null
      //   254: astore 8
      //   256: goto -76 -> 180
      //   259: iload_2
      //   260: ireturn
      //
      // Exception table:
      //   from	to	target	type
      //   37	46	157	finally
      //   24	37	175	java/lang/Exception
      //   46	59	175	java/lang/Exception
      //   64	77	175	java/lang/Exception
      //   99	137	175	java/lang/Exception
      //   137	147	175	java/lang/Exception
      //   159	175	175	java/lang/Exception
      //   200	216	175	java/lang/Exception
      //   187	192	194	java/io/IOException
      //   77	99	198	finally
      //   24	37	216	finally
      //   46	59	216	finally
      //   64	77	216	finally
      //   99	137	216	finally
      //   137	147	216	finally
      //   159	175	216	finally
      //   200	216	216	finally
      //   151	155	234	java/io/IOException
      //   226	231	238	java/io/IOException
      //   2	24	243	finally
      //   2	24	251	java/lang/Exception
    }

    // ERROR //
    private boolean listWindows(Socket paramSocket)
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_2
      //   2: aload_0
      //   3: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   6: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   9: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   12: invokevirtual 51	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
      //   15: new 105	java/io/BufferedWriter
      //   18: dup
      //   19: new 107	java/io/OutputStreamWriter
      //   22: dup
      //   23: aload_1
      //   24: invokevirtual 113	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
      //   27: invokespecial 116	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
      //   30: sipush 8192
      //   33: invokespecial 119	java/io/BufferedWriter:<init>	(Ljava/io/Writer;I)V
      //   36: astore 8
      //   38: aload_0
      //   39: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   42: invokestatic 62	com/android/debug/hv/ViewServer:access$500	(Lcom/android/debug/hv/ViewServer;)Ljava/util/HashMap;
      //   45: invokevirtual 68	java/util/HashMap:entrySet	()Ljava/util/Set;
      //   48: invokeinterface 74 1 0
      //   53: astore 10
      //   55: aload 10
      //   57: invokeinterface 80 1 0
      //   62: ifeq +97 -> 159
      //   65: aload 10
      //   67: invokeinterface 84 1 0
      //   72: checkcast 86	java/util/Map$Entry
      //   75: astore 12
      //   77: aload 8
      //   79: aload 12
      //   81: invokeinterface 89 1 0
      //   86: invokestatic 95	java/lang/System:identityHashCode	(Ljava/lang/Object;)I
      //   89: invokestatic 134	java/lang/Integer:toHexString	(I)Ljava/lang/String;
      //   92: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   95: aload 8
      //   97: bipush 32
      //   99: invokevirtual 141	java/io/BufferedWriter:write	(I)V
      //   102: aload 8
      //   104: aload 12
      //   106: invokeinterface 155 1 0
      //   111: checkcast 157	java/lang/CharSequence
      //   114: invokevirtual 145	java/io/BufferedWriter:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
      //   117: pop
      //   118: aload 8
      //   120: bipush 10
      //   122: invokevirtual 141	java/io/BufferedWriter:write	(I)V
      //   125: goto -70 -> 55
      //   128: astore 9
      //   130: aload 8
      //   132: astore 4
      //   134: aload_0
      //   135: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   138: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   141: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   144: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   147: aload 4
      //   149: ifnull +8 -> 157
      //   152: aload 4
      //   154: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   157: iconst_0
      //   158: ireturn
      //   159: aload 8
      //   161: ldc 159
      //   163: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   166: aload 8
      //   168: invokevirtual 148	java/io/BufferedWriter:flush	()V
      //   171: aload_0
      //   172: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   175: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   178: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   181: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   184: aload 8
      //   186: ifnull +64 -> 250
      //   189: aload 8
      //   191: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   194: iconst_1
      //   195: ireturn
      //   196: astore 11
      //   198: iconst_0
      //   199: ireturn
      //   200: astore 5
      //   202: iconst_0
      //   203: ireturn
      //   204: astore 6
      //   206: aload_0
      //   207: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   210: invokestatic 40	com/android/debug/hv/ViewServer:access$300	(Lcom/android/debug/hv/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
      //   213: invokevirtual 46	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
      //   216: invokevirtual 58	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
      //   219: aload_2
      //   220: ifnull +7 -> 227
      //   223: aload_2
      //   224: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   227: aload 6
      //   229: athrow
      //   230: astore 7
      //   232: goto -5 -> 227
      //   235: astore 6
      //   237: aload 8
      //   239: astore_2
      //   240: goto -34 -> 206
      //   243: astore_3
      //   244: aconst_null
      //   245: astore 4
      //   247: goto -113 -> 134
      //   250: iconst_1
      //   251: ireturn
      //
      // Exception table:
      //   from	to	target	type
      //   38	55	128	java/lang/Exception
      //   55	125	128	java/lang/Exception
      //   159	171	128	java/lang/Exception
      //   189	194	196	java/io/IOException
      //   152	157	200	java/io/IOException
      //   2	38	204	finally
      //   223	227	230	java/io/IOException
      //   38	55	235	finally
      //   55	125	235	finally
      //   159	171	235	finally
      //   2	38	243	java/lang/Exception
    }

    // ERROR //
    private boolean windowCommand(Socket paramSocket, String paramString1, String paramString2)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore 4
      //   3: aconst_null
      //   4: astore 5
      //   6: aload_3
      //   7: bipush 32
      //   9: invokevirtual 165	java/lang/String:indexOf	(I)I
      //   12: istore 11
      //   14: aconst_null
      //   15: astore 5
      //   17: iload 11
      //   19: iconst_m1
      //   20: if_icmpne +9 -> 29
      //   23: aload_3
      //   24: invokevirtual 169	java/lang/String:length	()I
      //   27: istore 11
      //   29: aload_3
      //   30: iconst_0
      //   31: iload 11
      //   33: invokevirtual 173	java/lang/String:substring	(II)Ljava/lang/String;
      //   36: bipush 16
      //   38: invokestatic 179	java/lang/Long:parseLong	(Ljava/lang/String;I)J
      //   41: l2i
      //   42: istore 12
      //   44: iload 11
      //   46: aload_3
      //   47: invokevirtual 169	java/lang/String:length	()I
      //   50: if_icmpge +39 -> 89
      //   53: iload 11
      //   55: iconst_1
      //   56: iadd
      //   57: istore 13
      //   59: aload_3
      //   60: iload 13
      //   62: invokevirtual 181	java/lang/String:substring	(I)Ljava/lang/String;
      //   65: astore_3
      //   66: aload_0
      //   67: iload 12
      //   69: invokespecial 183	com/android/debug/hv/ViewServer$ViewServerWorker:findWindow	(I)Landroid/view/View;
      //   72: astore 14
      //   74: aload 14
      //   76: ifnonnull +19 -> 95
      //   79: iconst_0
      //   80: ifeq +7 -> 87
      //   83: aconst_null
      //   84: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   87: iconst_0
      //   88: ireturn
      //   89: ldc 185
      //   91: astore_3
      //   92: goto -26 -> 66
      //   95: ldc 187
      //   97: ldc 189
      //   99: iconst_4
      //   100: anewarray 191	java/lang/Class
      //   103: dup
      //   104: iconst_0
      //   105: ldc 97
      //   107: aastore
      //   108: dup
      //   109: iconst_1
      //   110: ldc 128
      //   112: aastore
      //   113: dup
      //   114: iconst_2
      //   115: ldc 128
      //   117: aastore
      //   118: dup
      //   119: iconst_3
      //   120: ldc 193
      //   122: aastore
      //   123: invokevirtual 197	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
      //   126: astore 15
      //   128: aload 15
      //   130: iconst_1
      //   131: invokevirtual 203	java/lang/reflect/Method:setAccessible	(Z)V
      //   134: iconst_4
      //   135: anewarray 4	java/lang/Object
      //   138: astore 16
      //   140: aload 16
      //   142: iconst_0
      //   143: aload 14
      //   145: aastore
      //   146: aload 16
      //   148: iconst_1
      //   149: aload_2
      //   150: aastore
      //   151: aload 16
      //   153: iconst_2
      //   154: aload_3
      //   155: aastore
      //   156: aload 16
      //   158: iconst_3
      //   159: new 205	com/android/debug/hv/ViewServer$UncloseableOutputStream
      //   162: dup
      //   163: aload_1
      //   164: invokevirtual 113	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
      //   167: invokespecial 206	com/android/debug/hv/ViewServer$UncloseableOutputStream:<init>	(Ljava/io/OutputStream;)V
      //   170: aastore
      //   171: aload 15
      //   173: aconst_null
      //   174: aload 16
      //   176: invokevirtual 210	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   179: pop
      //   180: aload_1
      //   181: invokevirtual 213	java/net/Socket:isOutputShutdown	()Z
      //   184: istore 18
      //   186: aconst_null
      //   187: astore 5
      //   189: iload 18
      //   191: ifne +39 -> 230
      //   194: new 105	java/io/BufferedWriter
      //   197: dup
      //   198: new 107	java/io/OutputStreamWriter
      //   201: dup
      //   202: aload_1
      //   203: invokevirtual 113	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
      //   206: invokespecial 116	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
      //   209: invokespecial 216	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
      //   212: astore 19
      //   214: aload 19
      //   216: ldc 218
      //   218: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   221: aload 19
      //   223: invokevirtual 148	java/io/BufferedWriter:flush	()V
      //   226: aload 19
      //   228: astore 5
      //   230: aload 5
      //   232: ifnull +8 -> 240
      //   235: aload 5
      //   237: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   240: iload 4
      //   242: ireturn
      //   243: astore 20
      //   245: iconst_0
      //   246: istore 4
      //   248: goto -8 -> 240
      //   251: astore 8
      //   253: ldc 220
      //   255: new 222	java/lang/StringBuilder
      //   258: dup
      //   259: invokespecial 223	java/lang/StringBuilder:<init>	()V
      //   262: ldc 225
      //   264: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   267: aload_2
      //   268: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   271: ldc 230
      //   273: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   276: aload_3
      //   277: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   280: invokevirtual 234	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   283: aload 8
      //   285: invokestatic 240	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   288: pop
      //   289: iconst_0
      //   290: istore 4
      //   292: aload 5
      //   294: ifnull -54 -> 240
      //   297: aload 5
      //   299: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   302: iconst_0
      //   303: istore 4
      //   305: goto -65 -> 240
      //   308: astore 10
      //   310: iconst_0
      //   311: istore 4
      //   313: goto -73 -> 240
      //   316: astore 6
      //   318: aload 5
      //   320: ifnull +8 -> 328
      //   323: aload 5
      //   325: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   328: aload 6
      //   330: athrow
      //   331: astore 7
      //   333: goto -5 -> 328
      //   336: astore 6
      //   338: aload 19
      //   340: astore 5
      //   342: goto -24 -> 318
      //   345: astore 8
      //   347: aload 19
      //   349: astore 5
      //   351: goto -98 -> 253
      //   354: astore 21
      //   356: iconst_0
      //   357: ireturn
      //
      // Exception table:
      //   from	to	target	type
      //   235	240	243	java/io/IOException
      //   6	14	251	java/lang/Exception
      //   23	29	251	java/lang/Exception
      //   29	53	251	java/lang/Exception
      //   59	66	251	java/lang/Exception
      //   66	74	251	java/lang/Exception
      //   95	186	251	java/lang/Exception
      //   194	214	251	java/lang/Exception
      //   297	302	308	java/io/IOException
      //   6	14	316	finally
      //   23	29	316	finally
      //   29	53	316	finally
      //   59	66	316	finally
      //   66	74	316	finally
      //   95	186	316	finally
      //   194	214	316	finally
      //   253	289	316	finally
      //   323	328	331	java/io/IOException
      //   214	226	336	finally
      //   214	226	345	java/lang/Exception
      //   83	87	354	java/io/IOException
    }

    // ERROR //
    private boolean windowManagerAutolistLoop()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   4: aload_0
      //   5: invokestatic 245	com/android/debug/hv/ViewServer:access$700	(Lcom/android/debug/hv/ViewServer;Lcom/android/debug/hv/ViewServer$WindowListener;)V
      //   8: aconst_null
      //   9: astore_1
      //   10: new 105	java/io/BufferedWriter
      //   13: dup
      //   14: new 107	java/io/OutputStreamWriter
      //   17: dup
      //   18: aload_0
      //   19: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   22: invokevirtual 113	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
      //   25: invokespecial 116	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;)V
      //   28: invokespecial 216	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
      //   31: astore_2
      //   32: invokestatic 250	java/lang/Thread:interrupted	()Z
      //   35: ifne +179 -> 214
      //   38: aload_0
      //   39: getfield 26	com/android/debug/hv/ViewServer$ViewServerWorker:mLock	[Ljava/lang/Object;
      //   42: astore 9
      //   44: aload 9
      //   46: monitorenter
      //   47: aload_0
      //   48: getfield 30	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedWindowListUpdate	Z
      //   51: ifne +60 -> 111
      //   54: aload_0
      //   55: getfield 32	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedFocusedWindowUpdate	Z
      //   58: ifne +53 -> 111
      //   61: aload_0
      //   62: getfield 26	com/android/debug/hv/ViewServer$ViewServerWorker:mLock	[Ljava/lang/Object;
      //   65: invokevirtual 253	java/lang/Object:wait	()V
      //   68: goto -21 -> 47
      //   71: astore 10
      //   73: aload 9
      //   75: monitorexit
      //   76: aload 10
      //   78: athrow
      //   79: astore 5
      //   81: aload_2
      //   82: astore_1
      //   83: ldc 220
      //   85: ldc 255
      //   87: aload 5
      //   89: invokestatic 240	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   92: pop
      //   93: aload_1
      //   94: ifnull +7 -> 101
      //   97: aload_1
      //   98: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   101: aload_0
      //   102: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   105: aload_0
      //   106: invokestatic 258	com/android/debug/hv/ViewServer:access$800	(Lcom/android/debug/hv/ViewServer;Lcom/android/debug/hv/ViewServer$WindowListener;)V
      //   109: iconst_1
      //   110: ireturn
      //   111: aload_0
      //   112: getfield 30	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedWindowListUpdate	Z
      //   115: istore 11
      //   117: iconst_0
      //   118: istore 12
      //   120: iload 11
      //   122: ifeq +11 -> 133
      //   125: aload_0
      //   126: iconst_0
      //   127: putfield 30	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedWindowListUpdate	Z
      //   130: iconst_1
      //   131: istore 12
      //   133: aload_0
      //   134: getfield 32	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedFocusedWindowUpdate	Z
      //   137: istore 13
      //   139: iconst_0
      //   140: istore 14
      //   142: iload 13
      //   144: ifeq +11 -> 155
      //   147: aload_0
      //   148: iconst_0
      //   149: putfield 32	com/android/debug/hv/ViewServer$ViewServerWorker:mNeedFocusedWindowUpdate	Z
      //   152: iconst_1
      //   153: istore 14
      //   155: aload 9
      //   157: monitorexit
      //   158: iload 12
      //   160: ifeq +14 -> 174
      //   163: aload_2
      //   164: ldc_w 260
      //   167: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   170: aload_2
      //   171: invokevirtual 148	java/io/BufferedWriter:flush	()V
      //   174: iload 14
      //   176: ifeq -144 -> 32
      //   179: aload_2
      //   180: ldc_w 262
      //   183: invokevirtual 138	java/io/BufferedWriter:write	(Ljava/lang/String;)V
      //   186: aload_2
      //   187: invokevirtual 148	java/io/BufferedWriter:flush	()V
      //   190: goto -158 -> 32
      //   193: astore_3
      //   194: aload_2
      //   195: astore_1
      //   196: aload_1
      //   197: ifnull +7 -> 204
      //   200: aload_1
      //   201: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   204: aload_0
      //   205: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   208: aload_0
      //   209: invokestatic 258	com/android/debug/hv/ViewServer:access$800	(Lcom/android/debug/hv/ViewServer;Lcom/android/debug/hv/ViewServer$WindowListener;)V
      //   212: aload_3
      //   213: athrow
      //   214: aload_2
      //   215: ifnull +7 -> 222
      //   218: aload_2
      //   219: invokevirtual 151	java/io/BufferedWriter:close	()V
      //   222: aload_0
      //   223: getfield 21	com/android/debug/hv/ViewServer$ViewServerWorker:this$0	Lcom/android/debug/hv/ViewServer;
      //   226: aload_0
      //   227: invokestatic 258	com/android/debug/hv/ViewServer:access$800	(Lcom/android/debug/hv/ViewServer;Lcom/android/debug/hv/ViewServer$WindowListener;)V
      //   230: goto -121 -> 109
      //   233: astore 8
      //   235: goto -13 -> 222
      //   238: astore 7
      //   240: goto -139 -> 101
      //   243: astore 4
      //   245: goto -41 -> 204
      //   248: astore_3
      //   249: goto -53 -> 196
      //   252: astore 5
      //   254: aconst_null
      //   255: astore_1
      //   256: goto -173 -> 83
      //
      // Exception table:
      //   from	to	target	type
      //   47	68	71	finally
      //   73	76	71	finally
      //   111	117	71	finally
      //   125	130	71	finally
      //   133	139	71	finally
      //   147	152	71	finally
      //   155	158	71	finally
      //   32	47	79	java/lang/Exception
      //   76	79	79	java/lang/Exception
      //   163	174	79	java/lang/Exception
      //   179	190	79	java/lang/Exception
      //   32	47	193	finally
      //   76	79	193	finally
      //   163	174	193	finally
      //   179	190	193	finally
      //   218	222	233	java/io/IOException
      //   97	101	238	java/io/IOException
      //   200	204	243	java/io/IOException
      //   10	32	248	finally
      //   83	93	248	finally
      //   10	32	252	java/lang/Exception
    }

    public void focusChanged()
    {
      synchronized (this.mLock)
      {
        this.mNeedFocusedWindowUpdate = true;
        this.mLock.notifyAll();
        return;
      }
    }

    // ERROR //
    public void run()
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_1
      //   2: new 269	java/io/BufferedReader
      //   5: dup
      //   6: new 271	java/io/InputStreamReader
      //   9: dup
      //   10: aload_0
      //   11: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   14: invokevirtual 275	java/net/Socket:getInputStream	()Ljava/io/InputStream;
      //   17: invokespecial 278	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
      //   20: sipush 1024
      //   23: invokespecial 281	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
      //   26: astore_2
      //   27: aload_2
      //   28: invokevirtual 284	java/io/BufferedReader:readLine	()Ljava/lang/String;
      //   31: astore 10
      //   33: aload 10
      //   35: bipush 32
      //   37: invokevirtual 165	java/lang/String:indexOf	(I)I
      //   40: istore 11
      //   42: iload 11
      //   44: iconst_m1
      //   45: if_icmpne +89 -> 134
      //   48: aload 10
      //   50: astore 12
      //   52: ldc 185
      //   54: astore 13
      //   56: ldc_w 286
      //   59: aload 12
      //   61: invokevirtual 290	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
      //   64: ifeq +94 -> 158
      //   67: aload_0
      //   68: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   71: ldc_w 292
      //   74: invokestatic 296	com/android/debug/hv/ViewServer:access$200	(Ljava/net/Socket;Ljava/lang/String;)Z
      //   77: istore 15
      //   79: iload 15
      //   81: ifne +30 -> 111
      //   84: ldc 220
      //   86: new 222	java/lang/StringBuilder
      //   89: dup
      //   90: invokespecial 223	java/lang/StringBuilder:<init>	()V
      //   93: ldc_w 298
      //   96: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   99: aload 12
      //   101: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   104: invokevirtual 234	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   107: invokestatic 301	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
      //   110: pop
      //   111: aload_2
      //   112: ifnull +7 -> 119
      //   115: aload_2
      //   116: invokevirtual 302	java/io/BufferedReader:close	()V
      //   119: aload_0
      //   120: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   123: ifnull +279 -> 402
      //   126: aload_0
      //   127: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   130: invokevirtual 303	java/net/Socket:close	()V
      //   133: return
      //   134: aload 10
      //   136: iconst_0
      //   137: iload 11
      //   139: invokevirtual 173	java/lang/String:substring	(II)Ljava/lang/String;
      //   142: astore 12
      //   144: aload 10
      //   146: iload 11
      //   148: iconst_1
      //   149: iadd
      //   150: invokevirtual 181	java/lang/String:substring	(I)Ljava/lang/String;
      //   153: astore 13
      //   155: goto -99 -> 56
      //   158: ldc_w 305
      //   161: aload 12
      //   163: invokevirtual 290	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
      //   166: ifeq +18 -> 184
      //   169: aload_0
      //   170: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   173: ldc_w 292
      //   176: invokestatic 296	com/android/debug/hv/ViewServer:access$200	(Ljava/net/Socket;Ljava/lang/String;)Z
      //   179: istore 15
      //   181: goto -102 -> 79
      //   184: ldc_w 307
      //   187: aload 12
      //   189: invokevirtual 290	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
      //   192: ifeq +16 -> 208
      //   195: aload_0
      //   196: aload_0
      //   197: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   200: invokespecial 309	com/android/debug/hv/ViewServer$ViewServerWorker:listWindows	(Ljava/net/Socket;)Z
      //   203: istore 15
      //   205: goto -126 -> 79
      //   208: ldc_w 311
      //   211: aload 12
      //   213: invokevirtual 290	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
      //   216: ifeq +16 -> 232
      //   219: aload_0
      //   220: aload_0
      //   221: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   224: invokespecial 313	com/android/debug/hv/ViewServer$ViewServerWorker:getFocusedWindow	(Ljava/net/Socket;)Z
      //   227: istore 15
      //   229: goto -150 -> 79
      //   232: ldc_w 315
      //   235: aload 12
      //   237: invokevirtual 290	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
      //   240: ifeq +12 -> 252
      //   243: aload_0
      //   244: invokespecial 317	com/android/debug/hv/ViewServer$ViewServerWorker:windowManagerAutolistLoop	()Z
      //   247: istore 15
      //   249: goto -170 -> 79
      //   252: aload_0
      //   253: aload_0
      //   254: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   257: aload 12
      //   259: aload 13
      //   261: invokespecial 319	com/android/debug/hv/ViewServer$ViewServerWorker:windowCommand	(Ljava/net/Socket;Ljava/lang/String;Ljava/lang/String;)Z
      //   264: istore 14
      //   266: iload 14
      //   268: istore 15
      //   270: goto -191 -> 79
      //   273: astore 18
      //   275: aload 18
      //   277: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   280: goto -161 -> 119
      //   283: astore 17
      //   285: aload 17
      //   287: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   290: return
      //   291: astore_3
      //   292: ldc 220
      //   294: ldc 255
      //   296: aload_3
      //   297: invokestatic 240	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   300: pop
      //   301: aload_1
      //   302: ifnull +7 -> 309
      //   305: aload_1
      //   306: invokevirtual 302	java/io/BufferedReader:close	()V
      //   309: aload_0
      //   310: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   313: ifnull -180 -> 133
      //   316: aload_0
      //   317: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   320: invokevirtual 303	java/net/Socket:close	()V
      //   323: return
      //   324: astore 8
      //   326: aload 8
      //   328: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   331: return
      //   332: astore 9
      //   334: aload 9
      //   336: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   339: goto -30 -> 309
      //   342: astore 4
      //   344: aload_1
      //   345: ifnull +7 -> 352
      //   348: aload_1
      //   349: invokevirtual 302	java/io/BufferedReader:close	()V
      //   352: aload_0
      //   353: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   356: ifnull +10 -> 366
      //   359: aload_0
      //   360: getfield 28	com/android/debug/hv/ViewServer$ViewServerWorker:mClient	Ljava/net/Socket;
      //   363: invokevirtual 303	java/net/Socket:close	()V
      //   366: aload 4
      //   368: athrow
      //   369: astore 6
      //   371: aload 6
      //   373: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   376: goto -24 -> 352
      //   379: astore 5
      //   381: aload 5
      //   383: invokevirtual 322	java/io/IOException:printStackTrace	()V
      //   386: goto -20 -> 366
      //   389: astore 4
      //   391: aload_2
      //   392: astore_1
      //   393: goto -49 -> 344
      //   396: astore_3
      //   397: aload_2
      //   398: astore_1
      //   399: goto -107 -> 292
      //   402: return
      //
      // Exception table:
      //   from	to	target	type
      //   115	119	273	java/io/IOException
      //   126	133	283	java/io/IOException
      //   2	27	291	java/io/IOException
      //   316	323	324	java/io/IOException
      //   305	309	332	java/io/IOException
      //   2	27	342	finally
      //   292	301	342	finally
      //   348	352	369	java/io/IOException
      //   359	366	379	java/io/IOException
      //   27	42	389	finally
      //   56	79	389	finally
      //   84	111	389	finally
      //   134	155	389	finally
      //   158	181	389	finally
      //   184	205	389	finally
      //   208	229	389	finally
      //   232	249	389	finally
      //   252	266	389	finally
      //   27	42	396	java/io/IOException
      //   56	79	396	java/io/IOException
      //   84	111	396	java/io/IOException
      //   134	155	396	java/io/IOException
      //   158	181	396	java/io/IOException
      //   184	205	396	java/io/IOException
      //   208	229	396	java/io/IOException
      //   232	249	396	java/io/IOException
      //   252	266	396	java/io/IOException
    }

    public void windowsChanged()
    {
      synchronized (this.mLock)
      {
        this.mNeedWindowListUpdate = true;
        this.mLock.notifyAll();
        return;
      }
    }
  }

  private static abstract interface WindowListener
  {
    public abstract void focusChanged();

    public abstract void windowsChanged();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.android.debug.hv.ViewServer
 * JD-Core Version:    0.6.2
 */