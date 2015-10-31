package android.support.v8.renderscript;

import android.renderscript.Type.Builder;
import java.util.HashMap;

class TypeThunker extends Type
{
  static HashMap<android.renderscript.Type, Type> mMap = new HashMap();
  android.renderscript.Type mN;

  TypeThunker(RenderScript paramRenderScript, android.renderscript.Type paramType)
  {
    super(0, paramRenderScript);
    this.mN = paramType;
    internalCalc();
    this.mElement = new ElementThunker(paramRenderScript, paramType.getElement());
    synchronized (mMap)
    {
      mMap.put(this.mN, this);
      return;
    }
  }

  static Type create(RenderScript paramRenderScript, Element paramElement, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean1, boolean paramBoolean2, int paramInt4)
  {
    ElementThunker localElementThunker = (ElementThunker)paramElement;
    Type.Builder localBuilder = new Type.Builder(((RenderScriptThunker)paramRenderScript).mN, localElementThunker.mN);
    if (paramInt1 > 0)
      localBuilder.setX(paramInt1);
    if (paramInt2 > 0)
      localBuilder.setY(paramInt2);
    if (paramInt3 > 0)
      localBuilder.setZ(paramInt3);
    if (paramBoolean1)
      localBuilder.setMipmaps(paramBoolean1);
    if (paramBoolean2)
      localBuilder.setFaces(paramBoolean2);
    if (paramInt4 > 0)
      localBuilder.setYuvFormat(paramInt4);
    TypeThunker localTypeThunker = new TypeThunker(paramRenderScript, localBuilder.create());
    localTypeThunker.internalCalc();
    return localTypeThunker;
  }

  static Type find(android.renderscript.Type paramType)
  {
    return (Type)mMap.get(paramType);
  }

  android.renderscript.Type getNObj()
  {
    return this.mN;
  }

  void internalCalc()
  {
    this.mDimX = this.mN.getX();
    this.mDimY = this.mN.getY();
    this.mDimZ = this.mN.getZ();
    this.mDimFaces = this.mN.hasFaces();
    this.mDimMipmaps = this.mN.hasMipmaps();
    this.mDimYuv = this.mN.getYuv();
    calcElementCount();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.TypeThunker
 * JD-Core Version:    0.6.2
 */