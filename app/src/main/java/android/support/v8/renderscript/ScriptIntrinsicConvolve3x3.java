package android.support.v8.renderscript;

public class ScriptIntrinsicConvolve3x3 extends ScriptIntrinsic
{
  private Allocation mInput;
  private final float[] mValues = new float[9];

  ScriptIntrinsicConvolve3x3(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicConvolve3x3 create(RenderScript paramRenderScript, Element paramElement)
  {
    if (RenderScript.isNative)
    {
      ((RenderScriptThunker)paramRenderScript);
      return ScriptIntrinsicConvolve3x3Thunker.create(paramRenderScript, paramElement);
    }
    float[] arrayOfFloat = { 0.0F, 0.0F, 0.0F, 0.0F, 1.0F, 0.0F, 0.0F, 0.0F, 0.0F };
    if (!paramElement.isCompatible(Element.U8_4(paramRenderScript)))
      throw new RSIllegalArgumentException("Unsuported element type.");
    ScriptIntrinsicConvolve3x3 localScriptIntrinsicConvolve3x3 = new ScriptIntrinsicConvolve3x3(paramRenderScript.nScriptIntrinsicCreate(1, paramElement.getID(paramRenderScript)), paramRenderScript);
    localScriptIntrinsicConvolve3x3.setCoefficients(arrayOfFloat);
    return localScriptIntrinsicConvolve3x3;
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

  public void setCoefficients(float[] paramArrayOfFloat)
  {
    FieldPacker localFieldPacker = new FieldPacker(36);
    for (int i = 0; i < this.mValues.length; i++)
    {
      this.mValues[i] = paramArrayOfFloat[i];
      localFieldPacker.addF32(this.mValues[i]);
    }
    setVar(0, localFieldPacker);
  }

  public void setInput(Allocation paramAllocation)
  {
    this.mInput = paramAllocation;
    setVar(1, paramAllocation);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicConvolve3x3
 * JD-Core Version:    0.6.2
 */