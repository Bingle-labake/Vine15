package android.support.v8.renderscript;

class ScriptIntrinsicConvolve3x3Thunker extends ScriptIntrinsicConvolve3x3
{
  android.renderscript.ScriptIntrinsicConvolve3x3 mN;

  ScriptIntrinsicConvolve3x3Thunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicConvolve3x3Thunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicConvolve3x3Thunker localScriptIntrinsicConvolve3x3Thunker = new ScriptIntrinsicConvolve3x3Thunker(0, paramRenderScript);
    localScriptIntrinsicConvolve3x3Thunker.mN = android.renderscript.ScriptIntrinsicConvolve3x3.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicConvolve3x3Thunker;
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

  android.renderscript.ScriptIntrinsicConvolve3x3 getNObj()
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
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicConvolve3x3Thunker
 * JD-Core Version:    0.6.2
 */