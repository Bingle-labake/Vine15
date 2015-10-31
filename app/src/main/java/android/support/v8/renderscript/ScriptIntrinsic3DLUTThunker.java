package android.support.v8.renderscript;

class ScriptIntrinsic3DLUTThunker extends ScriptIntrinsic3DLUT
{
  android.renderscript.ScriptIntrinsic3DLUT mN;

  private ScriptIntrinsic3DLUTThunker(int paramInt, RenderScript paramRenderScript, Element paramElement)
  {
    super(paramInt, paramRenderScript, paramElement);
  }

  public static ScriptIntrinsic3DLUTThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsic3DLUTThunker localScriptIntrinsic3DLUTThunker = new ScriptIntrinsic3DLUTThunker(0, paramRenderScript, paramElement);
    localScriptIntrinsic3DLUTThunker.mN = android.renderscript.ScriptIntrinsic3DLUT.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsic3DLUTThunker;
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

  android.renderscript.ScriptIntrinsic3DLUT getNObj()
  {
    return this.mN;
  }

  public void setLUT(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setLUT(localAllocationThunker.getNObj());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsic3DLUTThunker
 * JD-Core Version:    0.6.2
 */