package android.support.v8.renderscript;

public class ScriptIntrinsicYuvToRGBThunker extends ScriptIntrinsicYuvToRGB
{
  android.renderscript.ScriptIntrinsicYuvToRGB mN;

  private ScriptIntrinsicYuvToRGBThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicYuvToRGBThunker create(RenderScript paramRenderScript, Element paramElement)
  {
    RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    ScriptIntrinsicYuvToRGBThunker localScriptIntrinsicYuvToRGBThunker = new ScriptIntrinsicYuvToRGBThunker(0, paramRenderScript);
    localScriptIntrinsicYuvToRGBThunker.mN = android.renderscript.ScriptIntrinsicYuvToRGB.create(localRenderScriptThunker.mN, localElementThunker.getNObj());
    return localScriptIntrinsicYuvToRGBThunker;
  }

  public void forEach(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.forEach(localAllocationThunker.getNObj());
  }

  public Script.FieldID getFieldID_Input()
  {
    Script.FieldID localFieldID = createFieldID(0, null);
    localFieldID.mN = this.mN.getFieldID_Input();
    return localFieldID;
  }

  public Script.KernelID getKernelID()
  {
    Script.KernelID localKernelID = createKernelID(0, 2, null, null);
    localKernelID.mN = this.mN.getKernelID();
    return localKernelID;
  }

  android.renderscript.ScriptIntrinsicYuvToRGB getNObj()
  {
    return this.mN;
  }

  public void setInput(Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setInput(localAllocationThunker.getNObj());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicYuvToRGBThunker
 * JD-Core Version:    0.6.2
 */