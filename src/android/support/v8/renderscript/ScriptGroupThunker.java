package android.support.v8.renderscript;

import android.renderscript.ScriptGroup.Builder;

class ScriptGroupThunker extends ScriptGroup
{
  android.renderscript.ScriptGroup mN;

  ScriptGroupThunker(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public void execute()
  {
    this.mN.execute();
  }

  android.renderscript.ScriptGroup getNObj()
  {
    return this.mN;
  }

  public void setInput(Script.KernelID paramKernelID, Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setInput(paramKernelID.mN, localAllocationThunker.getNObj());
  }

  public void setOutput(Script.KernelID paramKernelID, Allocation paramAllocation)
  {
    AllocationThunker localAllocationThunker = (AllocationThunker)paramAllocation;
    this.mN.setOutput(paramKernelID.mN, localAllocationThunker.getNObj());
  }

  public static final class Builder
  {
    ScriptGroup.Builder bN;
    RenderScript mRS;

    Builder(RenderScript paramRenderScript)
    {
      RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)paramRenderScript;
      this.mRS = paramRenderScript;
      this.bN = new ScriptGroup.Builder(localRenderScriptThunker.mN);
    }

    public Builder addConnection(Type paramType, Script.KernelID paramKernelID, Script.FieldID paramFieldID)
    {
      TypeThunker localTypeThunker = (TypeThunker)paramType;
      this.bN.addConnection(localTypeThunker.getNObj(), paramKernelID.mN, paramFieldID.mN);
      return this;
    }

    public Builder addConnection(Type paramType, Script.KernelID paramKernelID1, Script.KernelID paramKernelID2)
    {
      TypeThunker localTypeThunker = (TypeThunker)paramType;
      this.bN.addConnection(localTypeThunker.getNObj(), paramKernelID1.mN, paramKernelID2.mN);
      return this;
    }

    public Builder addKernel(Script.KernelID paramKernelID)
    {
      this.bN.addKernel(paramKernelID.mN);
      return this;
    }

    public ScriptGroupThunker create()
    {
      ScriptGroupThunker localScriptGroupThunker = new ScriptGroupThunker(0, this.mRS);
      localScriptGroupThunker.mN = this.bN.create();
      return localScriptGroupThunker;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptGroupThunker
 * JD-Core Version:    0.6.2
 */