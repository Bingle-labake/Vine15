package android.support.v8.renderscript;

public class ScriptIntrinsicConvolve5x5 extends ScriptIntrinsic
{
  private Allocation mInput;
  private final float[] mValues = new float[25];

  ScriptIntrinsicConvolve5x5(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public static ScriptIntrinsicConvolve5x5 create(RenderScript paramRenderScript, Element paramElement)
  {
    if (RenderScript.isNative)
    {
      ((RenderScriptThunker)paramRenderScript);
      return ScriptIntrinsicConvolve5x5Thunker.create(paramRenderScript, paramElement);
    }
    return new ScriptIntrinsicConvolve5x5(paramRenderScript.nScriptIntrinsicCreate(4, paramElement.getID(paramRenderScript)), paramRenderScript);
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
    FieldPacker localFieldPacker = new FieldPacker(100);
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
 * Qualified Name:     android.support.v8.renderscript.ScriptIntrinsicConvolve5x5
 * JD-Core Version:    0.6.2
 */