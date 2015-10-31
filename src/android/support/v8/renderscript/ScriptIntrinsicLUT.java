package android.support.v8.renderscript;

public class ScriptIntrinsicLUT extends ScriptIntrinsic
{
  private final byte[] mCache = new byte[1024];
  private boolean mDirty = true;
  private final Matrix4f mMatrix = new Matrix4f();
  private Allocation mTables;

  protected ScriptIntrinsicLUT(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicLUT create(RenderScript paramRenderScript, Element paramElement)
  {
    if (RenderScript.isNative)
    {
      ((RenderScriptThunker)paramRenderScript);
      return ScriptIntrinsicLUTThunker.create(paramRenderScript, paramElement);
    }
    ScriptIntrinsicLUT localScriptIntrinsicLUT = new ScriptIntrinsicLUT(paramRenderScript.nScriptIntrinsicCreate(3, paramElement.getID(paramRenderScript)), paramRenderScript);
    localScriptIntrinsicLUT.mTables = Allocation.createSized(paramRenderScript, Element.U8(paramRenderScript), 1024);
    for (int i = 0; i < 256; i++)
    {
      localScriptIntrinsicLUT.mCache[i] = ((byte)i);
      localScriptIntrinsicLUT.mCache[(i + 256)] = ((byte)i);
      localScriptIntrinsicLUT.mCache[(i + 512)] = ((byte)i);
      localScriptIntrinsicLUT.mCache[(i + 768)] = ((byte)i);
    }
    localScriptIntrinsicLUT.setVar(0, localScriptIntrinsicLUT.mTables);
    return localScriptIntrinsicLUT;
  }

  private void validate(int paramInt1, int paramInt2)
  {
    if ((paramInt1 < 0) || (paramInt1 > 255))
      throw new RSIllegalArgumentException("Index out of range (0-255).");
    if ((paramInt2 < 0) || (paramInt2 > 255))
      throw new RSIllegalArgumentException("Value out of range (0-255).");
  }

  public void forEach(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    if (this.mDirty)
    {
      this.mDirty = false;
      this.mTables.copyFromUnchecked(this.mCache);
    }
    forEach(0, paramAllocation1, paramAllocation2, null);
  }

  public Script.KernelID getKernelID()
  {
    return createKernelID(0, 3, null, null);
  }

  public void setAlpha(int paramInt1, int paramInt2)
  {
    validate(paramInt1, paramInt2);
    this.mCache[(paramInt1 + 768)] = ((byte)paramInt2);
    this.mDirty = true;
  }

  public void setBlue(int paramInt1, int paramInt2)
  {
    validate(paramInt1, paramInt2);
    this.mCache[(paramInt1 + 512)] = ((byte)paramInt2);
    this.mDirty = true;
  }

  public void setGreen(int paramInt1, int paramInt2)
  {
    validate(paramInt1, paramInt2);
    this.mCache[(paramInt1 + 256)] = ((byte)paramInt2);
    this.mDirty = true;
  }

  public void setRed(int paramInt1, int paramInt2)
  {
    validate(paramInt1, paramInt2);
    this.mCache[paramInt1] = ((byte)paramInt2);
    this.mDirty = true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicLUT
 * JD-Core Version:    0.6.2
 */