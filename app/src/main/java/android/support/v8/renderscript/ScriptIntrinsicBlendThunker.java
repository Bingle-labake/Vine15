package android.support.v8.renderscript;

class ScriptIntrinsicBlendThunker extends ScriptIntrinsicBlend
{
  android.renderscript.ScriptIntrinsicBlend mN;

  ScriptIntrinsicBlendThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicBlendThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicBlendThunker localScriptIntrinsicBlendThunker = new ScriptIntrinsicBlendThunker(0, paramRenderScript);
    localScriptIntrinsicBlendThunker.mN = android.renderscript.ScriptIntrinsicBlend.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicBlendThunker;
  }

  public void forEachAdd(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachAdd(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachClear(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachClear(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachDst(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachDst(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachDstAtop(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachDstAtop(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachDstIn(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachDstIn(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachDstOut(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachDstOut(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachDstOver(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachDstOver(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachMultiply(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachMultiply(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSrc(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSrc(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSrcAtop(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSrcAtop(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSrcIn(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSrcIn(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSrcOut(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSrcOut(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSrcOver(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSrcOver(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachSubtract(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachSubtract(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public void forEachXor(Allocation paramAllocation1, Allocation paramAllocation2)
  {
    AllocationThunker localAllocationThunker1 = (AllocationThunker)paramAllocation1;
    AllocationThunker localAllocationThunker2 = (AllocationThunker)paramAllocation2;
    this.mN.forEachXor(localAllocationThunker1.getNObj(), localAllocationThunker2.getNObj());
  }

  public Script.KernelID getKernelIDAdd()
  {
    Script.KernelID localKernelID = createKernelID(34, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDAdd();
    return localKernelID;
  }

  public Script.KernelID getKernelIDClear()
  {
    Script.KernelID localKernelID = createKernelID(0, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDClear();
    return localKernelID;
  }

  public Script.KernelID getKernelIDDst()
  {
    Script.KernelID localKernelID = createKernelID(2, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDDst();
    return localKernelID;
  }

  public Script.KernelID getKernelIDDstAtop()
  {
    Script.KernelID localKernelID = createKernelID(10, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDDstAtop();
    return localKernelID;
  }

  public Script.KernelID getKernelIDDstIn()
  {
    Script.KernelID localKernelID = createKernelID(6, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDDstIn();
    return localKernelID;
  }

  public Script.KernelID getKernelIDDstOut()
  {
    Script.KernelID localKernelID = createKernelID(8, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDDstOut();
    return localKernelID;
  }

  public Script.KernelID getKernelIDDstOver()
  {
    Script.KernelID localKernelID = createKernelID(4, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDDstOver();
    return localKernelID;
  }

  public Script.KernelID getKernelIDMultiply()
  {
    Script.KernelID localKernelID = createKernelID(14, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDMultiply();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSrc()
  {
    Script.KernelID localKernelID = createKernelID(1, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSrc();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSrcAtop()
  {
    Script.KernelID localKernelID = createKernelID(9, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSrcAtop();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSrcIn()
  {
    Script.KernelID localKernelID = createKernelID(5, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSrcIn();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSrcOut()
  {
    Script.KernelID localKernelID = createKernelID(7, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSrcOut();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSrcOver()
  {
    Script.KernelID localKernelID = createKernelID(3, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSrcOver();
    return localKernelID;
  }

  public Script.KernelID getKernelIDSubtract()
  {
    Script.KernelID localKernelID = createKernelID(35, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDSubtract();
    return localKernelID;
  }

  public Script.KernelID getKernelIDXor()
  {
    Script.KernelID localKernelID = createKernelID(11, 3, null, null);
    localKernelID.mN = this.mN.getKernelIDXor();
    return localKernelID;
  }

  android.renderscript.ScriptIntrinsicBlend getNObj()
  {
    return this.mN;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicBlendThunker
 * JD-Core Version:    0.6.2
 */