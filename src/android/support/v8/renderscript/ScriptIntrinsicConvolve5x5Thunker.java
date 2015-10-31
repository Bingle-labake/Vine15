package android.support.v8.renderscript;

class ScriptIntrinsicConvolve5x5Thunker extends ScriptIntrinsicConvolve5x5
{
  android.renderscript.ScriptIntrinsicConvolve5x5 mN;

  ScriptIntrinsicConvolve5x5Thunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicConvolve5x5Thunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicConvolve5x5Thunker localScriptIntrinsicConvolve5x5Thunker = new ScriptIntrinsicConvolve5x5Thunker(0, paramRenderScript);
    localScriptIntrinsicConvolve5x5Thunker.mN = android.renderscript.ScriptIntrinsicConvolve5x5.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicConvolve5x5Thunker;
  }

  public void forEach(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
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

  android.renderscript.ScriptIntrinsicConvolve5x5 getNObj()
  {
    return this.mN;
  }

  public void setCoefficients(float[] paramArrayOfFloat)
  {
    this.mN.setCoefficients(paramArrayOfFloat);
  }

  public void setInput(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setInput(localAllocationThunker.getNObj());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicConvolve5x5Thunker
 * JD-Core Version:    0.6.2
 */