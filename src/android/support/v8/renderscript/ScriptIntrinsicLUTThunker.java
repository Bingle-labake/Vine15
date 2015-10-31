package android.support.v8.renderscript;

class ScriptIntrinsicLUTThunker extends ScriptIntrinsicLUT
{
  android.renderscript.ScriptIntrinsicLUT mN;

  private ScriptIntrinsicLUTThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicLUTThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicLUTThunker localScriptIntrinsicLUTThunker = new ScriptIntrinsicLUTThunker(0, paramRenderScript);
    localScriptIntrinsicLUTThunker.mN = android.renderscript.ScriptIntrinsicLUT.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicLUTThunker;
  }

  public void forEach(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEach(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public Script.KernelID getKernelID()
  {
    Script.KernelID localKernelID = createKernelID(0, 3, null, null);
    localKernelID.mN = this.mN.getKernelID();
    return localKernelID;
  }

  android.renderscript.ScriptIntrinsicLUT getNObj()
  {
    return this.mN;
  }

  public void setAlpha(int paramInt1, int paramInt2)
  {
    this.mN.setAlpha(paramInt1, paramInt2);
  }

  public void setBlue(int paramInt1, int paramInt2)
  {
    this.mN.setBlue(paramInt1, paramInt2);
  }

  public void setGreen(int paramInt1, int paramInt2)
  {
    this.mN.setGreen(paramInt1, paramInt2);
  }

  public void setRed(int paramInt1, int paramInt2)
  {
    this.mN.setRed(paramInt1, paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicLUTThunker
 * JD-Core Version:    0.6.2
 */