package android.support.v8.renderscript;

class ScriptIntrinsicBlurThunker extends ScriptIntrinsicBlur
{
  android.renderscript.ScriptIntrinsicBlur mN;

  protected ScriptIntrinsicBlurThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicBlurThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicBlurThunker localScriptIntrinsicBlurThunker = new ScriptIntrinsicBlurThunker(0, paramRenderScript);
    localScriptIntrinsicBlurThunker.mN = android.renderscript.ScriptIntrinsicBlur.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicBlurThunker;
  }

  public void forEach(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    if (localAllocationThunker != null)
      this.mN.forEach(localAllocationThunker.getNObj());
  }

  public Script.FieldID getFieldID_Input()
  {
    Script.FieldID localFieldID = createFieldID(1, null);
    localFieldID.mN = this.mN.getFieldID_Input();
    return localFieldID;
  }

  public Script.KernelID getKernelID()
  {
    Script.KernelID localKernelID = createKernelID(0, 2, null, null);
    localKernelID.mN = this.mN.getKernelID();
    return localKernelID;
  }

  android.renderscript.ScriptIntrinsicBlur getNObj()
  {
    return this.mN;
  }

  public void setInput(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setInput(localAllocationThunker.getNObj());
  }

  public void setRadius(float paramFloat)
  {
    this.mN.setRadius(paramFloat);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicBlurThunker
 * JD-Core Version:    0.6.2
 */