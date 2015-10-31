package co.vine.android.recorder;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class CameraSetting
  implements Externalizable
{
  private static final long serialVersionUID = 8590112321194730309L;
  public float backFacingAspectRatio;
  public int degrees;
  public int frameRate;
  public boolean frontFacing;
  public float frontFacingAspectRatio;
  public int imageFormat;
  public int originalH;
  public int originalW;
  public int tpf;

  public CameraSetting()
  {
  }

  public CameraSetting(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, boolean paramBoolean, float paramFloat1, float paramFloat2)
  {
    this.originalW = paramInt1;
    this.originalH = paramInt2;
    this.degrees = paramInt3;
    this.frameRate = paramInt4;
    this.tpf = (1000 / paramInt4);
    this.imageFormat = paramInt5;
    this.frontFacing = paramBoolean;
    this.frontFacingAspectRatio = paramFloat1;
    this.backFacingAspectRatio = paramFloat2;
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.originalW = paramObjectInput.readInt();
    this.originalH = paramObjectInput.readInt();
    this.degrees = paramObjectInput.readInt();
    this.frameRate = paramObjectInput.readInt();
    this.tpf = paramObjectInput.readInt();
    this.imageFormat = paramObjectInput.readInt();
    this.frontFacing = paramObjectInput.readBoolean();
    this.frontFacingAspectRatio = paramObjectInput.readFloat();
    this.backFacingAspectRatio = paramObjectInput.readFloat();
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeInt(this.originalW);
    paramObjectOutput.writeInt(this.originalH);
    paramObjectOutput.writeInt(this.degrees);
    paramObjectOutput.writeInt(this.frameRate);
    paramObjectOutput.writeInt(this.tpf);
    paramObjectOutput.writeInt(this.imageFormat);
    paramObjectOutput.writeBoolean(this.frontFacing);
    paramObjectOutput.writeFloat(this.frontFacingAspectRatio);
    paramObjectOutput.writeFloat(this.backFacingAspectRatio);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.CameraSetting
 * JD-Core Version:    0.6.2
 */