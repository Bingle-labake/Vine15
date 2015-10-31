package android.support.v8.renderscript;

import java.util.ArrayList;

public class ScriptGroup extends BaseObj
{
  IO[] mInputs;
  IO[] mOutputs;

  ScriptGroup(int paramInt, RenderScript paramRenderScript)
  {
    super(paramInt, paramRenderScript);
  }

  public void execute()
  {
    this.mRS.nScriptGroupExecute(getID(this.mRS));
  }

  public void setInput(Script.KernelID paramKernelID, Allocation paramAllocation)
  {
    for (int i = 0; i < this.mInputs.length; i++)
      if (this.mInputs[i].mKID == paramKernelID)
      {
        this.mInputs[i].mAllocation = paramAllocation;
        this.mRS.nScriptGroupSetInput(getID(this.mRS), paramKernelID.getID(this.mRS), this.mRS.safeID(paramAllocation));
        return;
      }
    throw new RSIllegalArgumentException("Script not found");
  }

  public void setOutput(Script.KernelID paramKernelID, Allocation paramAllocation)
  {
    for (int i = 0; i < this.mOutputs.length; i++)
      if (this.mOutputs[i].mKID == paramKernelID)
      {
        this.mOutputs[i].mAllocation = paramAllocation;
        this.mRS.nScriptGroupSetOutput(getID(this.mRS), paramKernelID.getID(this.mRS), this.mRS.safeID(paramAllocation));
        return;
      }
    throw new RSIllegalArgumentException("Script not found");
  }

  public static final class Builder
  {
    private int mKernelCount;
    private ArrayList<ScriptGroup.ConnectLine> mLines = new ArrayList();
    private ArrayList<ScriptGroup.Node> mNodes = new ArrayList();
    private RenderScript mRS;
    private ScriptGroupThunker.Builder mT;

    public Builder(RenderScript paramRenderScript)
    {
      if (RenderScript.isNative)
        this.mT = new ScriptGroupThunker.Builder(paramRenderScript);
      this.mRS = paramRenderScript;
    }

    private ScriptGroup.Node findNode(Script.KernelID paramKernelID)
    {
      for (int i = 0; i < this.mNodes.size(); i++)
      {
        ScriptGroup.Node localNode = (ScriptGroup.Node)this.mNodes.get(i);
        for (int j = 0; j < localNode.mKernels.size(); j++)
          if (paramKernelID == localNode.mKernels.get(j))
            return localNode;
      }
      return null;
    }

    private ScriptGroup.Node findNode(Script paramScript)
    {
      for (int i = 0; i < this.mNodes.size(); i++)
        if (paramScript == ((ScriptGroup.Node)this.mNodes.get(i)).mScript)
          return (ScriptGroup.Node)this.mNodes.get(i);
      return null;
    }

    private void mergeDAGs(int paramInt1, int paramInt2)
    {
      for (int i = 0; i < this.mNodes.size(); i++)
        if (((ScriptGroup.Node)this.mNodes.get(i)).dagNumber == paramInt2)
          ((ScriptGroup.Node)this.mNodes.get(i)).dagNumber = paramInt1;
    }

    private void validateCycle(ScriptGroup.Node paramNode1, ScriptGroup.Node paramNode2)
    {
      for (int i = 0; i < paramNode1.mOutputs.size(); i++)
      {
        ScriptGroup.ConnectLine localConnectLine = (ScriptGroup.ConnectLine)paramNode1.mOutputs.get(i);
        if (localConnectLine.mToK != null)
        {
          ScriptGroup.Node localNode2 = findNode(localConnectLine.mToK.mScript);
          if (localNode2.equals(paramNode2))
            throw new RSInvalidStateException("Loops in group not allowed.");
          validateCycle(localNode2, paramNode2);
        }
        if (localConnectLine.mToF != null)
        {
          ScriptGroup.Node localNode1 = findNode(localConnectLine.mToF.mScript);
          if (localNode1.equals(paramNode2))
            throw new RSInvalidStateException("Loops in group not allowed.");
          validateCycle(localNode1, paramNode2);
        }
      }
    }

    private void validateDAG()
    {
      for (int i = 0; i < this.mNodes.size(); i++)
      {
        ScriptGroup.Node localNode = (ScriptGroup.Node)this.mNodes.get(i);
        if (localNode.mInputs.size() == 0)
        {
          if ((localNode.mOutputs.size() == 0) && (this.mNodes.size() > 1))
            throw new RSInvalidStateException("Groups cannot contain unconnected scripts");
          validateDAGRecurse(localNode, i + 1);
        }
      }
      int j = ((ScriptGroup.Node)this.mNodes.get(0)).dagNumber;
      for (int k = 0; k < this.mNodes.size(); k++)
        if (((ScriptGroup.Node)this.mNodes.get(k)).dagNumber != j)
          throw new RSInvalidStateException("Multiple DAGs in group not allowed.");
    }

    private void validateDAGRecurse(ScriptGroup.Node paramNode, int paramInt)
    {
      if ((paramNode.dagNumber != 0) && (paramNode.dagNumber != paramInt))
        mergeDAGs(paramNode.dagNumber, paramInt);
      while (true)
      {
        return;
        paramNode.dagNumber = paramInt;
        for (int i = 0; i < paramNode.mOutputs.size(); i++)
        {
          ScriptGroup.ConnectLine localConnectLine = (ScriptGroup.ConnectLine)paramNode.mOutputs.get(i);
          if (localConnectLine.mToK != null)
            validateDAGRecurse(findNode(localConnectLine.mToK.mScript), paramInt);
          if (localConnectLine.mToF != null)
            validateDAGRecurse(findNode(localConnectLine.mToF.mScript), paramInt);
        }
      }
    }

    public Builder addConnection(Type paramType, Script.KernelID paramKernelID, Script.FieldID paramFieldID)
    {
      if (this.mT != null)
      {
        this.mT.addConnection(paramType, paramKernelID, paramFieldID);
        return this;
      }
      ScriptGroup.Node localNode1 = findNode(paramKernelID);
      if (localNode1 == null)
        throw new RSInvalidStateException("From script not found.");
      ScriptGroup.Node localNode2 = findNode(paramFieldID.mScript);
      if (localNode2 == null)
        throw new RSInvalidStateException("To script not found.");
      ScriptGroup.ConnectLine localConnectLine = new ScriptGroup.ConnectLine(paramType, paramKernelID, paramFieldID);
      this.mLines.add(new ScriptGroup.ConnectLine(paramType, paramKernelID, paramFieldID));
      localNode1.mOutputs.add(localConnectLine);
      localNode2.mInputs.add(localConnectLine);
      validateCycle(localNode1, localNode1);
      return this;
    }

    public Builder addConnection(Type paramType, Script.KernelID paramKernelID1, Script.KernelID paramKernelID2)
    {
      if (this.mT != null)
      {
        this.mT.addConnection(paramType, paramKernelID1, paramKernelID2);
        return this;
      }
      ScriptGroup.Node localNode1 = findNode(paramKernelID1);
      if (localNode1 == null)
        throw new RSInvalidStateException("From script not found.");
      ScriptGroup.Node localNode2 = findNode(paramKernelID2);
      if (localNode2 == null)
        throw new RSInvalidStateException("To script not found.");
      ScriptGroup.ConnectLine localConnectLine = new ScriptGroup.ConnectLine(paramType, paramKernelID1, paramKernelID2);
      this.mLines.add(new ScriptGroup.ConnectLine(paramType, paramKernelID1, paramKernelID2));
      localNode1.mOutputs.add(localConnectLine);
      localNode2.mInputs.add(localConnectLine);
      validateCycle(localNode1, localNode1);
      return this;
    }

    public Builder addKernel(Script.KernelID paramKernelID)
    {
      if (this.mT != null)
        this.mT.addKernel(paramKernelID);
      do
      {
        return this;
        if (this.mLines.size() != 0)
          throw new RSInvalidStateException("Kernels may not be added once connections exist.");
      }
      while (findNode(paramKernelID) != null);
      this.mKernelCount = (1 + this.mKernelCount);
      ScriptGroup.Node localNode = findNode(paramKernelID.mScript);
      if (localNode == null)
      {
        localNode = new ScriptGroup.Node(paramKernelID.mScript);
        this.mNodes.add(localNode);
      }
      localNode.mKernels.add(paramKernelID);
      return this;
    }

    public ScriptGroup create()
    {
      Object localObject;
      if (this.mT != null)
        localObject = this.mT.create();
      while (true)
      {
        return localObject;
        if (this.mNodes.size() == 0)
          throw new RSInvalidStateException("Empty script groups are not allowed");
        for (int i = 0; i < this.mNodes.size(); i++)
          ((ScriptGroup.Node)this.mNodes.get(i)).dagNumber = 0;
        validateDAG();
        ArrayList localArrayList1 = new ArrayList();
        ArrayList localArrayList2 = new ArrayList();
        int[] arrayOfInt1 = new int[this.mKernelCount];
        int j = 0;
        for (int k = 0; k < this.mNodes.size(); k++)
        {
          ScriptGroup.Node localNode = (ScriptGroup.Node)this.mNodes.get(k);
          int i3 = 0;
          while (i3 < localNode.mKernels.size())
          {
            Script.KernelID localKernelID = (Script.KernelID)localNode.mKernels.get(i3);
            int i4 = j + 1;
            arrayOfInt1[j] = localKernelID.getID(this.mRS);
            int i5 = 0;
            int i6 = 0;
            for (int i7 = 0; i7 < localNode.mInputs.size(); i7++)
              if (((ScriptGroup.ConnectLine)localNode.mInputs.get(i7)).mToK == localKernelID)
                i5 = 1;
            for (int i8 = 0; i8 < localNode.mOutputs.size(); i8++)
              if (((ScriptGroup.ConnectLine)localNode.mOutputs.get(i8)).mFrom == localKernelID)
                i6 = 1;
            if (i5 == 0)
              localArrayList1.add(new ScriptGroup.IO(localKernelID));
            if (i6 == 0)
              localArrayList2.add(new ScriptGroup.IO(localKernelID));
            i3++;
            j = i4;
          }
        }
        if (j != this.mKernelCount)
          throw new RSRuntimeException("Count mismatch, should not happen.");
        int[] arrayOfInt2 = new int[this.mLines.size()];
        int[] arrayOfInt3 = new int[this.mLines.size()];
        int[] arrayOfInt4 = new int[this.mLines.size()];
        int[] arrayOfInt5 = new int[this.mLines.size()];
        for (int m = 0; m < this.mLines.size(); m++)
        {
          ScriptGroup.ConnectLine localConnectLine = (ScriptGroup.ConnectLine)this.mLines.get(m);
          arrayOfInt2[m] = localConnectLine.mFrom.getID(this.mRS);
          if (localConnectLine.mToK != null)
            arrayOfInt3[m] = localConnectLine.mToK.getID(this.mRS);
          if (localConnectLine.mToF != null)
            arrayOfInt4[m] = localConnectLine.mToF.getID(this.mRS);
          arrayOfInt5[m] = localConnectLine.mAllocationType.getID(this.mRS);
        }
        int n = this.mRS.nScriptGroupCreate(arrayOfInt1, arrayOfInt2, arrayOfInt3, arrayOfInt4, arrayOfInt5);
        if (n == 0)
          throw new RSRuntimeException("Object creation error, should not happen.");
        RenderScript localRenderScript = this.mRS;
        localObject = new ScriptGroup(n, localRenderScript);
        ScriptGroup.IO[] arrayOfIO1 = new ScriptGroup.IO[localArrayList2.size()];
        ((ScriptGroup)localObject).mOutputs = arrayOfIO1;
        for (int i1 = 0; i1 < localArrayList2.size(); i1++)
          ((ScriptGroup)localObject).mOutputs[i1] = ((ScriptGroup.IO)localArrayList2.get(i1));
        ScriptGroup.IO[] arrayOfIO2 = new ScriptGroup.IO[localArrayList1.size()];
        ((ScriptGroup)localObject).mInputs = arrayOfIO2;
        for (int i2 = 0; i2 < localArrayList1.size(); i2++)
          ((ScriptGroup)localObject).mInputs[i2] = ((ScriptGroup.IO)localArrayList1.get(i2));
      }
    }
  }

  static class ConnectLine
  {
    Type mAllocationType;
    Script.KernelID mFrom;
    Script.FieldID mToF;
    Script.KernelID mToK;

    ConnectLine(Type paramType, Script.KernelID paramKernelID, Script.FieldID paramFieldID)
    {
      this.mFrom = paramKernelID;
      this.mToF = paramFieldID;
      this.mAllocationType = paramType;
    }

    ConnectLine(Type paramType, Script.KernelID paramKernelID1, Script.KernelID paramKernelID2)
    {
      this.mFrom = paramKernelID1;
      this.mToK = paramKernelID2;
      this.mAllocationType = paramType;
    }
  }

  static class IO
  {
    Allocation mAllocation;
    Script.KernelID mKID;

    IO(Script.KernelID paramKernelID)
    {
      this.mKID = paramKernelID;
    }
  }

  static class Node
  {
    int dagNumber;
    ArrayList<ScriptGroup.ConnectLine> mInputs = new ArrayList();
    ArrayList<Script.KernelID> mKernels = new ArrayList();
    Node mNext;
    ArrayList<ScriptGroup.ConnectLine> mOutputs = new ArrayList();
    Script mScript;

    Node(Script paramScript)
    {
      this.mScript = paramScript;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.ScriptGroup
 * JD-Core Version:    0.6.2
 */