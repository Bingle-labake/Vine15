package android.support.v8.renderscript;

public class ScriptIntrinsicBlur extends ScriptIntrinsic
{
  private Allocation mInput;
  private final float[] mValues = new float[9];

  protected ScriptIntrinsicBlur(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicBlur create(RenderScript paramRenderScript, Element paramElement)
  {
    if (RenderScript.isNative)
    {
      ((RenderScriptThunker)paramRenderScript);
      return ScriptIntrinsicBlurThunker.create(paramRenderScript, paramElement);
    }
    if ((!paramElement.isCompatible(Element.U8_4(paramRenderScript))) && (!paramElement.isCompatible(Element.U8(paramRenderScript))))
      throw new RSIllegalArgumentException("Unsuported element type.");
    ScriptIntrinsicBlur localScriptIntrinsicBlur = new ScriptIntrinsicBlur(paramRenderScript.nScriptIntrinsicCreate(5, paramElement.getID(paramRenderScript)), paramRenderScript);
    localScriptIntrinsicBlur.setRadius(5.0F);
    return localScriptIntrinsicBlur;
  }

  public void forEach(Allocation paramAllocation)
  {
    forEach(0, null, paramAllocation, null);
  }

  public Script.FieldID getFieldID_Input()
  {
    return createFieldID(1, null);
  }

  public Script.KernelID getKernelID()
  {
    return createKernelID(0, 2, null, null);
  }

  public void setInput(Allocation paramAllocation)
  {
    this.mInput = paramAllocation;
    setVar(1, paramAllocation);
  }

  public void setRadius(float paramFloat)
  {
    if ((paramFloat <= 0.0F) || (paramFloat > 25.0F))
      throw new RSIllegalArgumentException("Radius out of range (0 < r <= 25).");
    setVar(0, paramFloat);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicBlur
 * JD-Core Version:    0.6.2
 */