package co.vine.android.recorder;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecList;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.util.Log;
import com.edisonwang.android.slog.FormattingTuple;
import com.edisonwang.android.slog.MessageFormatter;
import com.edisonwang.android.slog.SLog;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;

@TargetApi(16)
public class SdkEncoder
  implements EncoderManager.Encoder
{
  public SdkEncoder()
  {
    SLog.d("*****************************");
    int i = MediaCodecList.getCodecCount();
    for (int j = 0; j < i; j++)
    {
      MediaCodecInfo localMediaCodecInfo = MediaCodecList.getCodecInfoAt(j);
      SLog.d("Codec: {}.", localMediaCodecInfo.getName());
      for (String str : localMediaCodecInfo.getSupportedTypes())
      {
        MediaCodecInfo.CodecCapabilities localCodecCapabilities = localMediaCodecInfo.getCapabilitiesForType(str);
        SLog.d("Codec support {} with {} and {}.", str, localCodecCapabilities.colorFormats, localCodecCapabilities.profileLevels);
      }
    }
    SLog.d("*****************************");
  }

  public void transcode(EncoderManager.EncoderBoss paramEncoderBoss, String paramString1, String paramString2, ArrayList<Integer> paramArrayList)
    throws EncoderManager.EncodingException
  {
    label685: 
    while (true)
    {
      BufferedOutputStream localBufferedOutputStream;
      MediaCodec localMediaCodec1;
      MediaExtractor localMediaExtractor;
      int i;
      MediaCodec localMediaCodec2;
      MediaFormat localMediaFormat1;
      try
      {
        localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(new File(paramString2)));
        localMediaCodec1 = MediaCodec.createEncoderByType("video/avc");
        localMediaExtractor = new MediaExtractor();
        localMediaExtractor.setDataSource(paramString1);
        i = 0;
        int j = localMediaExtractor.getTrackCount();
        int k = i;
        localMediaCodec2 = null;
        localMediaFormat1 = null;
        if (k >= j)
          break label804;
        MediaFormat localMediaFormat2 = localMediaExtractor.getTrackFormat(i);
        String str = localMediaFormat2.getString("mime");
        if (str.startsWith("video/"))
        {
          localMediaExtractor.selectTrack(i);
          localMediaFormat1 = MediaFormat.createVideoFormat("video/avc", 480, 480);
          localMediaFormat1.setInteger("bitrate", 1000000);
          localMediaFormat1.setInteger("frame-rate", 30);
          localMediaFormat1.setInteger("color-format", 21);
          localMediaFormat1.setInteger("i-frame-interval", 5);
          localMediaCodec2 = MediaCodec.createDecoderByType(str);
          localMediaFormat2.setInteger("color-format", 19);
          localMediaCodec2.configure(localMediaFormat2, null, null, 0);
          break label804;
          throw new IOException(MessageFormatter.format("Invalid file: {}, {}.", localMediaCodec2, localMediaFormat1).getMessage());
        }
      }
      catch (Exception localException)
      {
        throw new EncoderManager.EncodingException(localException);
      }
      i++;
      continue;
      label346: 
      do
      {
        localMediaCodec1.configure(localMediaFormat1, null, null, 1);
        localMediaCodec1.start();
        localMediaCodec2.start();
        ByteBuffer[] arrayOfByteBuffer1 = localMediaCodec2.getInputBuffers();
        ByteBuffer[] arrayOfByteBuffer2 = localMediaCodec2.getOutputBuffers();
        ByteBuffer[] arrayOfByteBuffer3 = localMediaCodec1.getInputBuffers();
        ByteBuffer[] arrayOfByteBuffer4 = localMediaCodec1.getOutputBuffers();
        MediaCodec.BufferInfo localBufferInfo1 = new MediaCodec.BufferInfo();
        int m = 0;
        while (true)
        {
          int n;
          int i1;
          int i2;
          ByteBuffer localByteBuffer1;
          if (!Thread.interrupted())
          {
            if (m == 0)
            {
              n = localMediaCodec2.dequeueInputBuffer(-1L);
              if (n >= 0)
              {
                i1 = localMediaExtractor.readSampleData(arrayOfByteBuffer1[n], 0);
                if (i1 >= 0)
                  break label685;
                SLog.d("InputBuffer BUFFER_FLAG_END_OF_STREAM");
                localMediaCodec2.queueInputBuffer(n, 0, 0, 0L, 4);
                m = 1;
              }
            }
            i2 = localMediaCodec2.dequeueOutputBuffer(localBufferInfo1, -1L);
            switch (i2)
            {
            default:
              localByteBuffer1 = arrayOfByteBuffer2[i2];
              SLog.d("We can't use this buffer but render it due to the API limit, " + localByteBuffer1);
            case -3:
            case -2:
            case -1:
            }
          }
          try
          {
            int i3 = localMediaCodec1.dequeueInputBuffer(-1L);
            if (i3 >= 0)
            {
              ByteBuffer localByteBuffer2 = arrayOfByteBuffer3[i3];
              localByteBuffer2.clear();
              SLog.d("Input buffer: " + localByteBuffer2);
              localByteBuffer2.put(localByteBuffer1);
              localMediaCodec1.queueInputBuffer(i3, 0, localByteBuffer2.limit(), localBufferInfo1.presentationTimeUs, 0);
            }
            while (true)
            {
              MediaCodec.BufferInfo localBufferInfo2 = new MediaCodec.BufferInfo();
              int i4 = localMediaCodec1.dequeueOutputBuffer(localBufferInfo2, 0L);
              switch (i4)
              {
              default:
                ByteBuffer localByteBuffer3 = arrayOfByteBuffer4[i4];
                byte[] arrayOfByte = new byte[localBufferInfo2.size];
                localByteBuffer3.get(arrayOfByte);
                localBufferedOutputStream.write(arrayOfByte, 0, arrayOfByte.length);
                SLog.i("AvcEncoder", arrayOfByte.length + " bytes written");
                localMediaCodec1.releaseOutputBuffer(i4, false);
                localMediaCodec2.releaseOutputBuffer(i2, true);
                localMediaExtractor.advance();
                while ((0x4 & localBufferInfo1.flags) != 0)
                {
                  Log.d("DecodeActivity", "OutputBuffer BUFFER_FLAG_END_OF_STREAM");
                  localMediaCodec2.stop();
                  localMediaCodec2.release();
                  localMediaExtractor.release();
                  localMediaCodec1.stop();
                  localMediaCodec1.release();
                  localBufferedOutputStream.flush();
                  localBufferedOutputStream.close();
                  return;
                  localMediaCodec2.queueInputBuffer(n, 0, i1, localMediaExtractor.getSampleTime(), 0);
                  break label346;
                  SLog.d("INFO_OUTPUT_BUFFERS_CHANGED");
                  arrayOfByteBuffer2 = localMediaCodec2.getOutputBuffers();
                  continue;
                  SLog.d("New format found: {}", localMediaCodec2.getOutputFormat());
                  continue;
                  SLog.d("dequeueOutputBuffer timed out!");
                }
                SLog.e("Input buffer timeout.");
              case -3:
              case -2:
              case -1:
              }
            }
          }
          catch (Throwable localThrowable)
          {
            while (true)
            {
              SLog.e("Something wrong.", localThrowable);
              continue;
              SLog.d("INFO_OUTPUT_BUFFERS_CHANGED");
              arrayOfByteBuffer4 = localMediaCodec1.getOutputBuffers();
              continue;
              SLog.d("New format found: {}", localMediaCodec1.getOutputFormat());
              continue;
              SLog.d("dequeueOutputBuffer timed out!");
            }
          }
        }
        if (localMediaCodec2 == null)
          break;
      }
      while (localMediaFormat1 != null);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.SdkEncoder
 * JD-Core Version:    0.6.2
 */