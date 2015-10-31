package android.support.v8.renderscript;

class ScriptIntrinsicColorMatrixThunker extends ScriptIntrinsicColorMatrix
{
  android.renderscript.ScriptIntrinsicColorMatrix mN;

  private ScriptIntrinsicColorMatrixThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicColorMatrixThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicColorMatrixThunker localScriptIntrinsicColorMatrixThunker = new ScriptIntrinsicColorMatrixThunker(0, paramRenderScript);
    localScriptIntrinsicColorMatrixThunker.mN = android.renderscript.ScriptIntrinsicColorMatrix.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicColorMatrixThunker;
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

  android.renderscript.ScriptIntrinsicColorMatrix getNObj()
  {
    return this.mN;
  }

  public void setColorMatrix(Matrix3f paramMatrix3f)
  {
    this.mN.setColorMatrix(new android.renderscript.Matrix3f(paramMatrix3f.getArray()));
  }

  public void setColorMatrix(Matrix4f paramMatrix4f)
  {
    this.mN.setColorMatrix(new android.renderscript.Matrix4f(paramMatrix4f.getArray()));
  }

  public void setGreyscale()
  {
    this.mN.setGreyscale();
  }

  public void setRGBtoYUV()
  {
    this.mN.setRGBtoYUV();
  }

  public void setYUVtoRGB()
  {
    this.mN.setYUVtoRGB();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicColorMatrixThunker
 * JD-Core Version:    0.6.2
 */