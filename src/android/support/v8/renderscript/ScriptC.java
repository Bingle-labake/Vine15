package android.support.v8.renderscript;

import android.content.res.Resources;

public class ScriptC extends Script
{
  private static final String TAG = "ScriptC";

  protected ScriptC(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  protected ScriptC(RenderScript paramRenderScript, Resources paramResources, int paramInt)
  {
    super(0, paramRenderScript);
    if (RenderScript.isNative)
    {
      this.mT = new ScriptCThunker((RenderScriptThunker)paramRenderScript, paramResources, paramInt);
      return;
    }
    int i = internalCreate(paramRenderScript, paramResources, paramInt);
    if (i == 0)
      throw new RSRuntimeException("Loading of ScriptC script failed.");
    setID(i);
  }

  // ERROR //
  private static int internalCreate(RenderScript paramRenderScript, Resources paramResources, int paramInt)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: aload_1
    //   4: iload_2
    //   5: invokevirtual 53	android/content/res/Resources:openRawResource	(I)Ljava/io/InputStream;
    //   8: astore 4
    //   10: sipush 1024
    //   13: newarray byte
    //   15: astore 7
    //   17: iconst_0
    //   18: istore 8
    //   20: aload 7
    //   22: arraylength
    //   23: iload 8
    //   25: isub
    //   26: istore 9
    //   28: iload 9
    //   30: ifne +36 -> 66
    //   33: iconst_2
    //   34: aload 7
    //   36: arraylength
    //   37: imul
    //   38: newarray byte
    //   40: astore 10
    //   42: aload 7
    //   44: iconst_0
    //   45: aload 10
    //   47: iconst_0
    //   48: aload 7
    //   50: arraylength
    //   51: invokestatic 59	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   54: aload 10
    //   56: astore 7
    //   58: aload 7
    //   60: arraylength
    //   61: iload 8
    //   63: isub
    //   64: istore 9
    //   66: aload 4
    //   68: aload 7
    //   70: iload 8
    //   72: iload 9
    //   74: invokevirtual 65	java/io/InputStream:read	([BII)I
    //   77: istore 11
    //   79: iload 11
    //   81: ifgt +39 -> 120
    //   84: aload 4
    //   86: invokevirtual 69	java/io/InputStream:close	()V
    //   89: aload_0
    //   90: aload_1
    //   91: iload_2
    //   92: invokevirtual 73	android/content/res/Resources:getResourceEntryName	(I)Ljava/lang/String;
    //   95: aload_0
    //   96: invokevirtual 77	android/support/v8/renderscript/RenderScript:getApplicationContext	()Landroid/content/Context;
    //   99: invokevirtual 83	android/content/Context:getCacheDir	()Ljava/io/File;
    //   102: invokevirtual 89	java/io/File:toString	()Ljava/lang/String;
    //   105: aload 7
    //   107: iload 8
    //   109: invokevirtual 93	android/support/v8/renderscript/RenderScript:nScriptCCreate	(Ljava/lang/String;Ljava/lang/String;[BI)I
    //   112: istore 12
    //   114: ldc 2
    //   116: monitorexit
    //   117: iload 12
    //   119: ireturn
    //   120: iload 8
    //   122: iload 11
    //   124: iadd
    //   125: istore 8
    //   127: goto -107 -> 20
    //   130: astore 5
    //   132: aload 4
    //   134: invokevirtual 69	java/io/InputStream:close	()V
    //   137: aload 5
    //   139: athrow
    //   140: astore 6
    //   142: new 95	android/content/res/Resources$NotFoundException
    //   145: dup
    //   146: invokespecial 97	android/content/res/Resources$NotFoundException:<init>	()V
    //   149: athrow
    //   150: astore_3
    //   151: ldc 2
    //   153: monitorexit
    //   154: aload_3
    //   155: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   10	17	130	finally
    //   20	28	130	finally
    //   33	54	130	finally
    //   58	66	130	finally
    //   66	79	130	finally
    //   84	89	140	java/io/IOException
    //   132	140	140	java/io/IOException
    //   3	10	150	finally
    //   84	89	150	finally
    //   89	114	150	finally
    //   132	140	150	finally
    //   142	150	150	finally
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptC
 * JD-Core Version:    0.6.2
 */