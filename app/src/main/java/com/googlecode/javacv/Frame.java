package com.googlecode.javacv;

import com.googlecode.javacv.cpp.opencv_core.IplImage;
import java.nio.Buffer;

public class Frame
{
  public opencv_core.IplImage image;
  public boolean keyFrame;
  public Buffer[] samples;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacv.Frame
 * JD-Core Version:    0.6.2
 */