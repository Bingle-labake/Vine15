package co.vine.android.recorder;

import android.content.Context;
import co.vine.android.util.SystemUtil;
import com.edisonwang.android.slog.SLog;
import com.googlecode.javacpp.BytePointer;
import com.googlecode.javacpp.DoublePointer;
import com.googlecode.javacpp.FloatPointer;
import com.googlecode.javacpp.IntPointer;
import com.googlecode.javacpp.Loader;
import com.googlecode.javacpp.Pointer;
import com.googlecode.javacpp.PointerPointer;
import com.googlecode.javacpp.ShortPointer;
import com.googlecode.javacv.Frame;
import com.googlecode.javacv.cpp.avcodec;
import com.googlecode.javacv.cpp.avcodec.AVCodec;
import com.googlecode.javacv.cpp.avcodec.AVCodecContext;
import com.googlecode.javacv.cpp.avcodec.AVPacket;
import com.googlecode.javacv.cpp.avcodec.AVPicture;
import com.googlecode.javacv.cpp.avformat;
import com.googlecode.javacv.cpp.avformat.AVFormatContext;
import com.googlecode.javacv.cpp.avformat.AVIOContext;
import com.googlecode.javacv.cpp.avformat.AVOutputFormat;
import com.googlecode.javacv.cpp.avformat.AVStream;
import com.googlecode.javacv.cpp.avutil;
import com.googlecode.javacv.cpp.avutil.AVDictionary;
import com.googlecode.javacv.cpp.avutil.AVFrame;
import com.googlecode.javacv.cpp.avutil.AVRational;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import com.googlecode.javacv.cpp.swresample;
import com.googlecode.javacv.cpp.swresample.SwrContext;
import com.googlecode.javacv.cpp.swscale;
import com.googlecode.javacv.cpp.swscale.SwsContext;
import java.io.File;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.ShortBuffer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class VineFFmpegFrameRecorder
{
  public static final int[] LOCK;
  private static Exception loadingException;
  protected int audioBitrate;
  protected int audioChannels;
  protected int audioCodec;
  protected String audioCodecName;
  protected HashMap<String, String> audioOptions = new HashMap();
  protected double audioQuality = -1.0D;
  private avcodec.AVCodecContext audio_c;
  private long audio_clock;
  private avcodec.AVCodec audio_codec;
  private int audio_input_frame_size;
  private BytePointer audio_outbuf;
  private int audio_outbuf_size;
  public avcodec.AVPacket audio_pkt;
  private avformat.AVStream audio_st;
  private String filename;
  protected String format;
  private avutil.AVFrame frame;
  protected int frameNumber = 0;
  protected double frameRate;
  private int[] got_audio_packet;
  private int[] got_video_packet;
  private boolean hasData = false;
  protected int imageHeight;
  protected int imageWidth;
  private swscale.SwsContext img_convert_ctx;
  protected boolean interleaved;
  private volatile boolean isReleased = false;
  private avformat.AVFormatContext oc;
  private avformat.AVOutputFormat oformat;
  private avutil.AVFrame picture;
  private BytePointer picture_buf;
  protected int pixelFormat;
  protected int sampleFormat;
  protected int sampleRate;
  private swresample.SwrContext samples_convert_ctx;
  private Pointer[] samples_in;
  private PointerPointer samples_in_ptr;
  private BytePointer[] samples_out;
  private PointerPointer samples_out_ptr;
  protected long timestamp = 0L;
  private avutil.AVFrame tmp_picture;
  protected int videoBitrate;
  protected int videoCodec;
  protected String videoCodecName;
  protected HashMap<String, String> videoOptions = new HashMap();
  protected double videoQuality = -1.0D;
  private avcodec.AVCodecContext video_c;
  private avcodec.AVCodec video_codec;
  private BytePointer video_outbuf;
  private int video_outbuf_size;
  public avcodec.AVPacket video_pkt;
  private avformat.AVStream video_st;

  static
  {
    if (!VineFFmpegFrameRecorder.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      LOCK = new int[0];
      loadingException = null;
      synchronized (LOCK)
      {
        avcodec.avcodec_register_all();
        avformat.av_register_all();
        return;
      }
    }
  }

  public VineFFmpegFrameRecorder(File paramFile, int paramInt)
  {
    this(paramFile, 0, 0, paramInt);
  }

  public VineFFmpegFrameRecorder(File paramFile, int paramInt1, int paramInt2)
  {
    this(paramFile, paramInt1, paramInt2, 0);
  }

  public VineFFmpegFrameRecorder(File paramFile, int paramInt1, int paramInt2, int paramInt3)
  {
    this(paramFile.getAbsolutePath(), paramInt1, paramInt2, paramInt3);
  }

  public VineFFmpegFrameRecorder(String paramString, int paramInt)
  {
    this(paramString, 0, 0, paramInt);
  }

  public VineFFmpegFrameRecorder(String paramString, int paramInt1, int paramInt2)
  {
    this(paramString, paramInt1, paramInt2, 0);
  }

  public VineFFmpegFrameRecorder(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    this(paramString, paramInt1, paramInt2, paramInt3, null, null);
  }

  public VineFFmpegFrameRecorder(String paramString, int paramInt1, int paramInt2, int paramInt3, avcodec.AVPacket paramAVPacket1, avcodec.AVPacket paramAVPacket2)
  {
    SLog.d("Creating a recorder thats {} * {}", Integer.valueOf(paramInt1), Integer.valueOf(paramInt2));
    this.filename = paramString;
    this.imageWidth = paramInt1;
    this.imageHeight = paramInt2;
    this.audioChannels = paramInt3;
    this.pixelFormat = -1;
    this.videoCodec = 0;
    this.videoBitrate = 1000000;
    this.frameRate = 30.0D;
    this.sampleFormat = -1;
    this.audioCodec = 0;
    this.audioBitrate = 64000;
    this.sampleRate = 44100;
    this.interleaved = true;
    if (paramAVPacket1 != null)
    {
      this.video_pkt = paramAVPacket1;
      if (paramAVPacket2 == null)
        break label179;
    }
    while (true)
    {
      this.audio_pkt = paramAVPacket2;
      return;
      paramAVPacket1 = new avcodec.AVPacket();
      break;
      label179: paramAVPacket2 = new avcodec.AVPacket();
    }
  }

  public static void tryLoad(Context paramContext)
    throws VineFFmpegFrameRecorder.Exception
  {
    if (loadingException != null)
      throw loadingException;
    try
    {
      Loader.load(avutil.class);
      Loader.load(avcodec.class);
      Loader.load(avformat.class);
      Loader.load(swscale.class);
      Loader.load(swresample.class);
      RecordConfigUtils.setLoadWasEverSuccessful(paramContext, true);
      return;
    }
    catch (Throwable localThrowable)
    {
      if ((localThrowable instanceof Exception))
      {
        Exception localException2 = (Exception)localThrowable;
        loadingException = localException2;
        throw localException2;
      }
      Exception localException1 = new Exception("Failed to load " + VineFFmpegFrameRecorder.class, localThrowable);
      loadingException = localException1;
      throw localException1;
    }
  }

  private int writeVideoFrame()
    throws VineFFmpegFrameRecorder.Exception
  {
    synchronized (this.oc)
    {
      if ((this.interleaved) && (this.audio_st != null))
      {
        i = avformat.av_interleaved_write_frame(this.oc, this.video_pkt);
        if (i >= 0)
          break label125;
        throw new Exception("av_interleaved_write_frame() error " + i + " while writing interleaved video frame.");
      }
    }
    int i = avformat.av_write_frame(this.oc, this.video_pkt);
    if (i < 0)
      throw new Exception("av_write_frame() error " + i + " while writing video frame.");
    label125: return i;
  }

  public int encode(opencv_core.IplImage paramIplImage, byte[] paramArrayOfByte, int paramInt)
    throws VineFFmpegFrameRecorder.Exception
  {
    int i = -1;
    if (record(paramIplImage, i, true))
    {
      BytePointer localBytePointer = this.video_pkt.data();
      i = this.video_pkt.size();
      localBytePointer.get(paramArrayOfByte, paramInt, i);
    }
    return i;
  }

  protected void finalize()
    throws Throwable
  {
    super.finalize();
    release();
  }

  public String getAudioCodecName()
  {
    return this.audioCodecName;
  }

  public String getFilename()
  {
    return this.filename;
  }

  public String getFormat()
  {
    return this.format;
  }

  public int getFrameNumber()
  {
    if (this.picture == null)
      return (int)this.audio_pkt.pts();
    return (int)this.picture.pts();
  }

  public double getFrameRate()
  {
    return this.frameRate;
  }

  public long getTimestamp()
  {
    if (this.picture == null)
      return 1000000L * this.audio_clock / this.sampleRate;
    return Math.round(1000000L * getFrameNumber() / getFrameRate());
  }

  public String getVideoCodecName()
  {
    return this.videoCodecName;
  }

  public int getVideoCodecPixFormat()
  {
    return this.video_c.pix_fmt();
  }

  public boolean hasData()
  {
    return this.hasData;
  }

  public boolean isReleased()
  {
    return this.isReleased;
  }

  public void record(Frame paramFrame)
    throws VineFFmpegFrameRecorder.Exception
  {
    if ((paramFrame == null) || ((paramFrame.image == null) && (paramFrame.samples == null)))
      record((opencv_core.IplImage)null);
    do
    {
      return;
      if (paramFrame.image != null)
        paramFrame.keyFrame = record(paramFrame.image);
    }
    while (paramFrame.samples == null);
    paramFrame.keyFrame = record(paramFrame.samples);
  }

  boolean record(avutil.AVFrame paramAVFrame)
    throws VineFFmpegFrameRecorder.Exception
  {
    avcodec.av_init_packet(this.audio_pkt);
    this.audio_pkt.data(this.audio_outbuf);
    this.audio_pkt.size(this.audio_outbuf_size);
    int i = avcodec.avcodec_encode_audio2(this.audio_c, this.audio_pkt, paramAVFrame, this.got_audio_packet);
    if (i < 0)
      throw new Exception("avcodec_encode_audio2() error " + i + ": Could not encode audio packet.");
    if (paramAVFrame != null)
      this.audio_clock += paramAVFrame.nb_samples();
    int j = this.got_audio_packet[0];
    boolean bool = false;
    if (j != 0)
    {
      if (this.audio_pkt.pts() != avutil.AV_NOPTS_VALUE)
        this.audio_pkt.pts(avutil.av_rescale_q(this.audio_pkt.pts(), this.audio_c.time_base(), this.audio_c.time_base()));
      if (this.audio_pkt.dts() != avutil.AV_NOPTS_VALUE)
        this.audio_pkt.dts(avutil.av_rescale_q(this.audio_pkt.dts(), this.audio_c.time_base(), this.audio_c.time_base()));
      this.audio_pkt.flags(0x1 | this.audio_pkt.flags());
      this.audio_pkt.stream_index(this.audio_st.index());
      synchronized (this.oc)
      {
        if ((this.interleaved) && (this.video_st != null))
        {
          int m = avformat.av_interleaved_write_frame(this.oc, this.audio_pkt);
          if (m >= 0)
            break label383;
          throw new Exception("av_interleaved_write_frame() error " + m + " while writing interleaved audio frame.");
        }
      }
      int k = avformat.av_write_frame(this.oc, this.audio_pkt);
      if (k < 0)
        throw new Exception("av_write_frame() error " + k + " while writing audio frame.");
      label383: bool = true;
    }
    return bool;
  }

  public boolean record(opencv_core.IplImage paramIplImage)
    throws VineFFmpegFrameRecorder.Exception
  {
    return record(paramIplImage, -1, false);
  }

  public boolean record(opencv_core.IplImage paramIplImage, int paramInt, boolean paramBoolean)
    throws VineFFmpegFrameRecorder.Exception
  {
    if (this.video_st == null)
      throw new Exception("No video output stream (Is imageWidth > 0 && imageHeight > 0 and has start() been called?)");
    if (paramIplImage == null);
    while ((0x20 & this.oformat.flags()) != 0)
      if (paramIplImage == null)
      {
        return false;
        this.hasData = true;
        int i = paramIplImage.width();
        int j = paramIplImage.height();
        int k = paramIplImage.widthStep();
        BytePointer localBytePointer = paramIplImage.imageData();
        int i3;
        int i4;
        if (paramInt == -1)
        {
          i3 = paramIplImage.depth();
          i4 = paramIplImage.nChannels();
          if (((i3 != 8) && (i3 != -2147483640)) || (i4 != 3))
            break label227;
          paramInt = 3;
        }
        while (true)
          if ((this.video_c.pix_fmt() != paramInt) || (this.video_c.width() != i) || (this.video_c.height() != j))
          {
            swscale.SwsContext localSwsContext = this.img_convert_ctx;
            int m = this.video_c.width();
            int n = this.video_c.height();
            int i1 = this.video_c.pix_fmt();
            DoublePointer localDoublePointer = (DoublePointer)null;
            this.img_convert_ctx = swscale.sws_getCachedContext(localSwsContext, i, j, paramInt, m, n, i1, 2, null, null, localDoublePointer);
            if (this.img_convert_ctx == null)
            {
              throw new Exception("sws_getCachedContext() error: Cannot initialize the conversion context.");
              label227: if (((i3 == 8) || (i3 == -2147483640)) && (i4 == 1))
              {
                paramInt = 8;
              }
              else
              {
                if (((i3 == 16) || (i3 == -2147483632)) && (i4 == 1))
                {
                  if (ByteOrder.nativeOrder().equals(ByteOrder.BIG_ENDIAN));
                  for (paramInt = 31; ; paramInt = 32)
                    break;
                }
                if (((i3 == 8) || (i3 == -2147483640)) && (i4 == 4))
                {
                  paramInt = 28;
                }
                else if (((i3 == 8) || (i3 == -2147483640)) && (i4 == 2))
                {
                  paramInt = 26;
                  k = i;
                }
                else
                {
                  throw new Exception("Could not guess pixel format of image: depth=" + i3 + ", channels=" + i4);
                }
              }
            }
            else
            {
              avcodec.avpicture_fill(new avcodec.AVPicture(this.tmp_picture), localBytePointer, paramInt, i, j);
              avcodec.avpicture_fill(new avcodec.AVPicture(this.picture), this.picture_buf, this.video_c.pix_fmt(), this.video_c.width(), this.video_c.height());
              this.tmp_picture.linesize(0, k);
              swscale.sws_scale(this.img_convert_ctx, new PointerPointer(this.tmp_picture), this.tmp_picture.linesize(), 0, j, new PointerPointer(this.picture), this.picture.linesize());
              break;
            }
          }
        avcodec.avpicture_fill(new avcodec.AVPicture(this.picture), localBytePointer, paramInt, i, j);
        this.picture.linesize(0, k);
      }
      else
      {
        avcodec.av_init_packet(this.video_pkt);
        this.video_pkt.flags(0x1 | this.video_pkt.flags());
        this.video_pkt.stream_index(this.video_st.index());
        this.video_pkt.data(new BytePointer(this.picture));
        this.video_pkt.size(Loader.sizeof(avcodec.AVPicture.class));
      }
    while (true)
    {
      if (!paramBoolean)
        writeVideoFrame();
      if (this.picture.key_frame() == 0)
        break label920;
      return true;
      avcodec.av_init_packet(this.video_pkt);
      this.video_pkt.data(this.video_outbuf);
      this.video_pkt.size(this.video_outbuf_size);
      this.picture.quality(this.video_c.global_quality());
      avcodec.AVCodecContext localAVCodecContext = this.video_c;
      avcodec.AVPacket localAVPacket = this.video_pkt;
      if (paramIplImage == null);
      for (avutil.AVFrame localAVFrame = null; ; localAVFrame = this.picture)
      {
        int i2 = avcodec.avcodec_encode_video2(localAVCodecContext, localAVPacket, localAVFrame, this.got_video_packet);
        if (i2 >= 0)
          break;
        throw new Exception("avcodec_encode_video2() error " + i2 + ": Could not encode video packet.");
      }
      this.picture.pts(1L + this.picture.pts());
      if (this.got_video_packet[0] == 0)
        break;
      if (!paramBoolean)
      {
        if (this.video_pkt.pts() != avutil.AV_NOPTS_VALUE)
          this.video_pkt.pts(avutil.av_rescale_q(this.video_pkt.pts(), this.video_c.time_base(), this.video_st.time_base()));
        if (this.video_pkt.dts() != avutil.AV_NOPTS_VALUE)
          this.video_pkt.dts(avutil.av_rescale_q(this.video_pkt.dts(), this.video_c.time_base(), this.video_st.time_base()));
        this.video_pkt.stream_index(this.video_st.index());
      }
    }
    return false;
    label920: return false;
  }

  public boolean record(Buffer[] paramArrayOfBuffer)
    throws VineFFmpegFrameRecorder.Exception
  {
    if (this.audio_st == null)
      throw new Exception("No audio output stream (Is audioChannels > 0 and has start() been called?)");
    this.hasData = true;
    int i = paramArrayOfBuffer[0].limit() - paramArrayOfBuffer[0].position();
    int j;
    int k;
    int m;
    label66: int n;
    int i1;
    label91: int i2;
    int i16;
    label97: ByteBuffer localByteBuffer;
    if (paramArrayOfBuffer.length > 1)
    {
      j = 1;
      k = this.audio_c.sample_fmt();
      if (this.samples_out.length <= 1)
        break label191;
      m = 1;
      n = avutil.av_get_bytes_per_sample(k);
      if (!(paramArrayOfBuffer[0] instanceof ByteBuffer))
        break label225;
      if (paramArrayOfBuffer.length <= 1)
        break label200;
      i1 = 5;
      i2 = 1;
      i16 = 0;
      if (i16 >= paramArrayOfBuffer.length)
        break label802;
      localByteBuffer = (ByteBuffer)paramArrayOfBuffer[i16];
      if ((!(this.samples_in[i16] instanceof BytePointer)) || (this.samples_in[i16].capacity() < i) || (!localByteBuffer.hasArray()))
        break label206;
      ((BytePointer)this.samples_in[i16]).position(0).put(localByteBuffer.array(), localByteBuffer.position(), i);
    }
    while (true)
    {
      i16++;
      break label97;
      j = this.audioChannels;
      break;
      label191: m = this.audioChannels;
      break label66;
      label200: i1 = 0;
      break label91;
      label206: this.samples_in[i16] = new BytePointer(localByteBuffer);
    }
    label225: if ((paramArrayOfBuffer[0] instanceof ShortBuffer))
    {
      int i15;
      label250: ShortBuffer localShortBuffer;
      if (paramArrayOfBuffer.length > 1)
      {
        i1 = 6;
        i2 = 2;
        i15 = 0;
        if (i15 >= paramArrayOfBuffer.length)
          break label802;
        localShortBuffer = (ShortBuffer)paramArrayOfBuffer[i15];
        if ((!(this.samples_in[i15] instanceof ShortPointer)) || (this.samples_in[i15].capacity() < i) || (!localShortBuffer.hasArray()))
          break label344;
        ((ShortPointer)this.samples_in[i15]).position(0).put(localShortBuffer.array(), paramArrayOfBuffer[i15].position(), i);
      }
      while (true)
      {
        i15++;
        break label250;
        i1 = 1;
        break;
        this.samples_in[i15] = new ShortPointer(localShortBuffer);
      }
    }
    else if ((paramArrayOfBuffer[0] instanceof IntBuffer))
    {
      int i14;
      IntBuffer localIntBuffer;
      if (paramArrayOfBuffer.length > 1)
      {
        i1 = 7;
        i2 = 4;
        i14 = 0;
        if (i14 >= paramArrayOfBuffer.length)
          break label802;
        localIntBuffer = (IntBuffer)paramArrayOfBuffer[i14];
        if ((!(this.samples_in[i14] instanceof IntPointer)) || (this.samples_in[i14].capacity() < i) || (!localIntBuffer.hasArray()))
          break label482;
        ((IntPointer)this.samples_in[i14]).position(0).put(localIntBuffer.array(), paramArrayOfBuffer[i14].position(), i);
      }
      while (true)
      {
        i14++;
        break label388;
        i1 = 2;
        break;
        label482: this.samples_in[i14] = new IntPointer(localIntBuffer);
      }
    }
    else if ((paramArrayOfBuffer[0] instanceof FloatBuffer))
    {
      int i13;
      FloatBuffer localFloatBuffer;
      if (paramArrayOfBuffer.length > 1)
      {
        i1 = 8;
        i2 = 4;
        i13 = 0;
        if (i13 >= paramArrayOfBuffer.length)
          break label802;
        localFloatBuffer = (FloatBuffer)paramArrayOfBuffer[i13];
        if ((!(this.samples_in[i13] instanceof FloatPointer)) || (this.samples_in[i13].capacity() < i) || (!localFloatBuffer.hasArray()))
          break label618;
        ((FloatPointer)this.samples_in[i13]).position(0).put(localFloatBuffer.array(), localFloatBuffer.position(), i);
      }
      while (true)
      {
        i13++;
        break label526;
        i1 = 3;
        break;
        label618: this.samples_in[i13] = new FloatPointer(localFloatBuffer);
      }
    }
    else if ((paramArrayOfBuffer[0] instanceof DoubleBuffer))
    {
      int i3;
      DoubleBuffer localDoubleBuffer;
      if (paramArrayOfBuffer.length > 1)
      {
        i1 = 9;
        i2 = 8;
        i3 = 0;
        if (i3 >= paramArrayOfBuffer.length)
          break label802;
        localDoubleBuffer = (DoubleBuffer)paramArrayOfBuffer[i3];
        if ((!(this.samples_in[i3] instanceof DoublePointer)) || (this.samples_in[i3].capacity() < i) || (!localDoubleBuffer.hasArray()))
          break label755;
        ((DoublePointer)this.samples_in[i3]).position(0).put(localDoubleBuffer.array(), localDoubleBuffer.position(), i);
      }
      while (true)
      {
        i3++;
        break label663;
        i1 = 4;
        break;
        label755: this.samples_in[i3] = new DoublePointer(localDoubleBuffer);
      }
    }
    else
    {
      throw new Exception("Audio samples Buffer has unsupported type: " + paramArrayOfBuffer);
    }
    label344: if (this.samples_convert_ctx == null)
    {
      this.samples_convert_ctx = swresample.swr_alloc_set_opts(null, this.audio_c.channel_layout(), k, this.audio_c.sample_rate(), this.audio_c.channel_layout(), i1, this.audio_c.sample_rate(), 0, null);
      if (this.samples_convert_ctx == null)
        throw new Exception("swr_alloc_set_opts() error: Cannot allocate the conversion context.");
      int i12 = swresample.swr_init(this.samples_convert_ctx);
      if (i12 < 0)
        throw new Exception("swr_init() error " + i12 + ": Cannot initialize the conversion context.");
    }
    label388: label526: label663: label802: for (int i4 = 0; i4 < paramArrayOfBuffer.length; i4++)
      this.samples_in[i4].position(i2 * this.samples_in[i4].position()).limit(i2 * (i + this.samples_in[i4].position()));
    while (true)
    {
      this.frame.quality(this.audio_c.global_quality());
      record(this.frame);
      do
      {
        if (this.samples_in[0].position() >= this.samples_in[0].limit())
          break;
        int i5 = Math.min((this.samples_in[0].limit() - this.samples_in[0].position()) / (j * i2), (this.samples_out[0].limit() - this.samples_out[0].position()) / (m * n));
        for (int i6 = 0; i6 < paramArrayOfBuffer.length; i6++)
          this.samples_in_ptr.put(i6, this.samples_in[i6]);
        for (int i7 = 0; i7 < this.samples_out.length; i7++)
          this.samples_out_ptr.put(i7, this.samples_out[i7]);
        int i8 = swresample.swr_convert(this.samples_convert_ctx, this.samples_out_ptr, i5, this.samples_in_ptr, i5);
        if (i8 < 0)
          throw new Exception("swr_convert() error " + i8 + ": Cannot convert audio samples.");
        for (int i9 = 0; i9 < paramArrayOfBuffer.length; i9++)
          this.samples_in[i9].position(this.samples_in[i9].position() + i2 * (i8 * j));
        for (int i10 = 0; i10 < this.samples_out.length; i10++)
          this.samples_out[i10].position(this.samples_out[i10].position() + n * (i8 * m));
      }
      while (this.samples_out[0].position() < this.samples_out[0].limit());
      this.frame.nb_samples(this.audio_input_frame_size);
      avcodec.avcodec_fill_audio_frame(this.frame, this.audio_c.channels(), k, this.samples_out[0], this.samples_out[0].limit(), 0);
      for (int i11 = 0; i11 < this.samples_out.length; i11++)
      {
        this.frame.data(i11, this.samples_out[i11].position(0));
        this.frame.linesize(i11, this.samples_out[i11].limit());
      }
    }
    return this.frame.key_frame() != 0;
  }

  public void release()
    throws VineFFmpegFrameRecorder.Exception
  {
    this.isReleased = true;
    if (this.video_c != null)
    {
      avcodec.avcodec_close(this.video_c);
      this.video_c = null;
    }
    if (this.audio_c != null)
    {
      avcodec.avcodec_close(this.audio_c);
      this.audio_c = null;
    }
    if (this.picture_buf != null)
    {
      avutil.av_free(this.picture_buf);
      this.picture_buf = null;
    }
    if (this.picture != null)
    {
      avcodec.avcodec_free_frame(this.picture);
      this.picture = null;
    }
    if (this.tmp_picture != null)
    {
      avcodec.avcodec_free_frame(this.tmp_picture);
      this.tmp_picture = null;
    }
    if (this.video_outbuf != null)
    {
      avutil.av_free(this.video_outbuf);
      this.video_outbuf = null;
    }
    if (this.frame != null)
    {
      avcodec.avcodec_free_frame(this.frame);
      this.frame = null;
    }
    if (this.samples_out != null)
    {
      for (int k = 0; k < this.samples_out.length; k++)
        avutil.av_free(this.samples_out[k].position(0));
      this.samples_out = null;
    }
    if (this.audio_outbuf != null)
    {
      avutil.av_free(this.audio_outbuf);
      this.audio_outbuf = null;
    }
    this.video_st = null;
    this.audio_st = null;
    if (this.oc != null)
    {
      int i = this.oc.nb_streams();
      for (int j = 0; j < i; j++)
      {
        avutil.av_free(this.oc.streams(j).codec());
        avutil.av_free(this.oc.streams(j));
      }
      avutil.av_free(this.oc);
      this.oc = null;
    }
    if (this.img_convert_ctx != null)
    {
      swscale.sws_freeContext(this.img_convert_ctx);
      this.img_convert_ctx = null;
    }
    if (this.samples_convert_ctx != null)
    {
      swresample.swr_free(this.samples_convert_ctx);
      this.samples_convert_ctx = null;
    }
  }

  public void setAudioCodec(int paramInt)
  {
    this.audioCodec = paramInt;
  }

  public void setAudioCodecName(String paramString)
  {
    this.audioCodecName = paramString;
  }

  public void setFormat(String paramString)
  {
    this.format = paramString;
  }

  public void setFrameNumber(int paramInt)
  {
    if (this.picture == null)
    {
      this.frameNumber = paramInt;
      return;
    }
    this.picture.pts(paramInt);
  }

  public void setFrameRate(double paramDouble)
  {
    this.frameRate = paramDouble;
  }

  public void setSampleFormat(int paramInt)
  {
    this.sampleFormat = paramInt;
  }

  public void setSampleRate(int paramInt)
  {
    this.sampleRate = paramInt;
  }

  public void setTimestamp(long paramLong)
  {
    if (this.picture != null)
      setFrameNumber((int)Math.round(paramLong * getFrameRate() / 1000000.0D));
  }

  public int setTimestampAndGetFrameNumber(long paramLong)
  {
    int i = (int)Math.round(paramLong * getFrameRate() / 1000000.0D);
    setFrameNumber(i);
    return i;
  }

  public void setVideoCodec(int paramInt)
  {
    this.videoCodec = paramInt;
  }

  public void setVideoCodecName(String paramString)
  {
    this.videoCodecName = paramString;
  }

  public void start()
    throws VineFFmpegFrameRecorder.Exception
  {
    this.picture = null;
    this.tmp_picture = null;
    this.picture_buf = null;
    this.frame = null;
    this.video_outbuf = null;
    this.audio_outbuf = null;
    this.oc = null;
    this.video_c = null;
    this.audio_c = null;
    this.video_st = null;
    this.audio_st = null;
    this.got_video_packet = new int[1];
    this.got_audio_packet = new int[1];
    if ((this.format == null) || (this.format.length() == 0));
    for (String str1 = null; ; str1 = this.format)
    {
      avformat.AVOutputFormat localAVOutputFormat1 = avformat.av_guess_format(str1, this.filename, null);
      this.oformat = localAVOutputFormat1;
      if (localAVOutputFormat1 != null)
        break;
      int i2 = this.filename.indexOf("://");
      if (i2 > 0)
        str1 = this.filename.substring(0, i2);
      avformat.AVOutputFormat localAVOutputFormat2 = avformat.av_guess_format(str1, this.filename, null);
      this.oformat = localAVOutputFormat2;
      if (localAVOutputFormat2 != null)
        break;
      throw new Exception("av_guess_format() error: Could not guess output format for \"" + this.filename + "\" and " + this.format + " format.");
    }
    String str2 = this.oformat.name().getString();
    avformat.AVFormatContext localAVFormatContext = avformat.avformat_alloc_context();
    this.oc = localAVFormatContext;
    if (localAVFormatContext == null)
      throw new Exception("avformat_alloc_context() error: Could not allocate format context");
    this.oc.oformat(this.oformat);
    this.oc.filename().putString(this.filename);
    if ((this.imageWidth > 0) && (this.imageHeight > 0))
    {
      if (this.videoCodec != 0)
        this.oformat.video_codec(this.videoCodec);
      while (true)
      {
        avcodec.AVCodec localAVCodec3 = avcodec.avcodec_find_encoder_by_name(this.videoCodecName);
        this.video_codec = localAVCodec3;
        if (localAVCodec3 != null)
          break;
        avcodec.AVCodec localAVCodec4 = avcodec.avcodec_find_encoder(this.oformat.video_codec());
        this.video_codec = localAVCodec4;
        if (localAVCodec4 != null)
          break;
        release();
        throw new Exception("avcodec_find_encoder() error: Video codec not found.");
        if ("flv".equals(str2))
          this.oformat.video_codec(22);
        else if ("mp4".equals(str2))
          this.oformat.video_codec(13);
        else if ("3gp".equals(str2))
          this.oformat.video_codec(5);
        else if ("avi".equals(str2))
          this.oformat.video_codec(26);
      }
      avutil.AVRational localAVRational1 = avutil.av_d2q(this.frameRate, 1001000);
      avutil.AVRational localAVRational2 = this.video_codec.supported_framerates();
      if (localAVRational2 != null)
        localAVRational1 = localAVRational2.position(avutil.av_find_nearest_q_idx(localAVRational1, localAVRational2));
      avformat.AVStream localAVStream2 = avformat.avformat_new_stream(this.oc, this.video_codec);
      this.video_st = localAVStream2;
      if (localAVStream2 == null)
      {
        release();
        throw new Exception("avformat_new_stream() error: Could not allocate video stream.");
      }
      this.video_c = this.video_st.codec();
      this.video_c.codec_id(this.oformat.video_codec());
      this.video_c.codec_type(0);
      this.video_c.bit_rate(this.videoBitrate);
      this.video_c.width(16 * ((15 + this.imageWidth) / 16));
      this.video_c.height(this.imageHeight);
      this.video_c.time_base(avutil.av_inv_q(localAVRational1));
      this.video_c.gop_size(12);
      if (this.videoQuality >= 0.0D)
      {
        this.video_c.flags(0x2 | this.video_c.flags());
        this.video_c.global_quality((int)Math.round(118.0D * this.videoQuality));
      }
      if (this.pixelFormat == -1)
        break label884;
      this.video_c.pix_fmt(this.pixelFormat);
      if (this.video_c.codec_id() != 2)
        break label958;
      this.video_c.max_b_frames(2);
      label730: if ((0x40 & this.oformat.flags()) != 0)
        this.video_c.flags(0x400000 | this.video_c.flags());
      if ((0x200 & this.video_codec.capabilities()) != 0)
        this.video_c.strict_std_compliance(-2);
    }
    if ((this.audioChannels > 0) && (this.audioBitrate > 0) && (this.sampleRate > 0))
    {
      if (this.audioCodec != 0)
        this.oformat.audio_codec(this.audioCodec);
      while (true)
      {
        avcodec.AVCodec localAVCodec1 = avcodec.avcodec_find_encoder_by_name(this.audioCodecName);
        this.audio_codec = localAVCodec1;
        if (localAVCodec1 != null)
          break label1264;
        avcodec.AVCodec localAVCodec2 = avcodec.avcodec_find_encoder(this.oformat.audio_codec());
        this.audio_codec = localAVCodec2;
        if (localAVCodec2 != null)
          break label1264;
        release();
        throw new Exception("avcodec_find_encoder() error: Audio codec not found.");
        label884: if ((this.video_c.codec_id() == 14) || (this.video_c.codec_id() == 62) || (this.video_c.codec_id() == 26) || (this.video_c.codec_id() == 34))
        {
          this.video_c.pix_fmt(avutil.AV_PIX_FMT_RGB32);
          break;
        }
        this.video_c.pix_fmt(0);
        break;
        label958: if (this.video_c.codec_id() == 1)
        {
          this.video_c.mb_decision(2);
          break label730;
        }
        if (this.video_c.codec_id() == 5)
        {
          if ((this.imageWidth <= 128) && (this.imageHeight <= 96))
          {
            this.video_c.width(128).height(96);
            break label730;
          }
          if ((this.imageWidth <= 176) && (this.imageHeight <= 144))
          {
            this.video_c.width(176).height(144);
            break label730;
          }
          if ((this.imageWidth <= 352) && (this.imageHeight <= 288))
          {
            this.video_c.width(352).height(288);
            break label730;
          }
          if ((this.imageWidth <= 704) && (this.imageHeight <= 576))
          {
            this.video_c.width(704).height(576);
            break label730;
          }
          this.video_c.width(1408).height(1152);
          break label730;
        }
        if (this.video_c.codec_id() != 28)
          break label730;
        this.video_c.profile(578);
        break label730;
        if (("flv".equals(str2)) || ("mp4".equals(str2)) || ("3gp".equals(str2)))
          this.oformat.audio_codec(86018);
        else if ("avi".equals(str2))
          this.oformat.audio_codec(65536);
      }
      label1264: avformat.AVStream localAVStream1 = avformat.avformat_new_stream(this.oc, this.audio_codec);
      this.audio_st = localAVStream1;
      if (localAVStream1 == null)
      {
        release();
        throw new Exception("avformat_new_stream() error: Could not allocate audio stream.");
      }
      this.audio_c = this.audio_st.codec();
      this.audio_c.codec_id(this.oformat.audio_codec());
      this.audio_c.codec_type(1);
      this.audio_c.bit_rate(this.audioBitrate);
      this.audio_c.sample_rate(this.sampleRate);
      this.audio_c.channels(this.audioChannels);
      this.audio_c.channel_layout(avutil.av_get_default_channel_layout(this.audioChannels));
      if (this.sampleFormat != -1)
        this.audio_c.sample_fmt(this.sampleFormat);
      while (true)
      {
        this.audio_c.time_base().num(1).den(this.sampleRate);
        switch (this.audio_c.sample_fmt())
        {
        default:
          if ($assertionsDisabled)
            break label1564;
          throw new AssertionError();
          if ((this.audio_c.codec_id() == 86018) && ((0x200 & this.audio_codec.capabilities()) != 0))
            this.audio_c.sample_fmt(8);
          else
            this.audio_c.sample_fmt(1);
          break;
        case 0:
        case 5:
        case 1:
        case 6:
        case 2:
        case 7:
        case 3:
        case 8:
        case 4:
        case 9:
        }
      }
      this.audio_c.bits_per_raw_sample(8);
    }
    label1564: avutil.AVDictionary localAVDictionary1;
    while (true)
    {
      if (this.audioQuality >= 0.0D)
      {
        this.audio_c.flags(0x2 | this.audio_c.flags());
        this.audio_c.global_quality((int)Math.round(118.0D * this.audioQuality));
      }
      if ((0x40 & this.oformat.flags()) != 0)
        this.audio_c.flags(0x400000 | this.audio_c.flags());
      if ((0x200 & this.audio_codec.capabilities()) != 0)
        this.audio_c.strict_std_compliance(-2);
      avformat.av_dump_format(this.oc, 0, this.filename, 1);
      if (this.video_st == null)
        break label2122;
      localAVDictionary1 = new avutil.AVDictionary(null);
      if (this.videoQuality >= 0.0D)
        avutil.av_dict_set(localAVDictionary1, "crf", "" + this.videoQuality, 0);
      Iterator localIterator1 = this.videoOptions.entrySet().iterator();
      while (localIterator1.hasNext())
      {
        Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
        avutil.av_dict_set(localAVDictionary1, (String)localEntry2.getKey(), (String)localEntry2.getValue(), 0);
      }
      this.audio_c.bits_per_raw_sample(16);
      continue;
      this.audio_c.bits_per_raw_sample(32);
      continue;
      this.audio_c.bits_per_raw_sample(32);
      continue;
      this.audio_c.bits_per_raw_sample(64);
    }
    int i = avcodec.avcodec_open2(this.video_c, this.video_codec, localAVDictionary1);
    if (i < 0)
    {
      release();
      throw new Exception("avcodec_open2() error " + i + ": Could not open video codec.");
    }
    avutil.av_dict_free(localAVDictionary1);
    this.video_outbuf = null;
    if ((0x20 & this.oformat.flags()) == 0)
    {
      this.video_outbuf_size = Math.max(262144, 8 * this.video_c.width() * this.video_c.height());
      this.video_outbuf = new BytePointer(avutil.av_malloc(this.video_outbuf_size));
    }
    avutil.AVFrame localAVFrame1 = avcodec.avcodec_alloc_frame();
    this.picture = localAVFrame1;
    if (localAVFrame1 == null)
    {
      release();
      throw new Exception("avcodec_alloc_frame() error: Could not allocate picture.");
    }
    this.picture.pts(0L);
    BytePointer localBytePointer = new BytePointer(avutil.av_malloc(avcodec.avpicture_get_size(this.video_c.pix_fmt(), this.video_c.width(), this.video_c.height())));
    this.picture_buf = localBytePointer;
    if (localBytePointer.isNull())
    {
      release();
      throw new Exception("av_malloc() error: Could not allocate picture buffer.");
    }
    avutil.AVFrame localAVFrame2 = avcodec.avcodec_alloc_frame();
    this.tmp_picture = localAVFrame2;
    if (localAVFrame2 == null)
    {
      release();
      throw new Exception("avcodec_alloc_frame() error: Could not allocate temporary picture.");
    }
    label2122: if (this.audio_st != null)
    {
      avutil.AVDictionary localAVDictionary2 = new avutil.AVDictionary(null);
      if (this.audioQuality >= 0.0D)
        avutil.av_dict_set(localAVDictionary2, "crf", "" + this.audioQuality, 0);
      Iterator localIterator2 = this.audioOptions.entrySet().iterator();
      while (localIterator2.hasNext())
      {
        Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
        avutil.av_dict_set(localAVDictionary2, (String)localEntry1.getKey(), (String)localEntry1.getValue(), 0);
      }
      int j = avcodec.avcodec_open2(this.audio_c, this.audio_codec, localAVDictionary2);
      if (j < 0)
      {
        release();
        throw new Exception("avcodec_open2() error " + j + ": Could not open audio codec.");
      }
      avutil.av_dict_free(localAVDictionary2);
      this.audio_outbuf_size = 262144;
      this.audio_outbuf = new BytePointer(avutil.av_malloc(this.audio_outbuf_size));
      if (this.audio_c.frame_size() <= 1)
      {
        this.audio_outbuf_size = 16384;
        this.audio_input_frame_size = (this.audio_outbuf_size / this.audio_c.channels());
        switch (this.audio_c.codec_id())
        {
        default:
          if (avutil.av_sample_fmt_is_planar(this.audio_c.sample_fmt()) == 0)
            break;
        case 65536:
        case 65537:
        case 65538:
        case 65539:
        }
      }
      for (int k = this.audio_c.channels(); ; k = 1)
      {
        int m = avutil.av_samples_get_buffer_size((IntPointer)null, this.audio_c.channels(), this.audio_input_frame_size, this.audio_c.sample_fmt(), 1) / k;
        this.samples_out = new BytePointer[k];
        for (int n = 0; n < this.samples_out.length; n++)
          this.samples_out[n] = new BytePointer(avutil.av_malloc(m)).capacity(m);
        this.audio_input_frame_size >>= 1;
        break;
        this.audio_input_frame_size = this.audio_c.frame_size();
        break;
      }
      this.samples_in = new Pointer[8];
      this.samples_in_ptr = new PointerPointer(8);
      this.samples_out_ptr = new PointerPointer(8);
      avutil.AVFrame localAVFrame3 = avcodec.avcodec_alloc_frame();
      this.frame = localAVFrame3;
      if (localAVFrame3 == null)
      {
        release();
        throw new Exception("avcodec_alloc_frame() error: Could not allocate audio frame.");
      }
    }
    SystemUtil.quietlyEnsureParentExists(new File(this.filename));
    if ((0x1 & this.oformat.flags()) == 0)
    {
      avformat.AVIOContext localAVIOContext = new avformat.AVIOContext(null);
      int i1 = avformat.avio_open(localAVIOContext, this.filename, 2);
      if (i1 < 0)
      {
        release();
        throw new Exception("BAD avio_open error() error " + i1 + ": Could not open '" + this.filename);
      }
      this.oc.pb(localAVIOContext);
    }
    avformat.avformat_write_header(this.oc, (PointerPointer)null);
  }

  public void stop()
    throws VineFFmpegFrameRecorder.Exception
  {
    if (this.oc != null)
    {
      while ((this.video_st != null) && (record(null, -1, false)));
      while ((this.audio_st != null) && (record((avutil.AVFrame)null)));
      if ((!this.interleaved) || (this.video_st == null) || (this.audio_st == null))
        break label108;
      avformat.av_interleaved_write_frame(this.oc, null);
    }
    while (true)
    {
      avformat.av_write_trailer(this.oc);
      if ((0x1 & this.oformat.flags()) == 0)
        avformat.avio_close(this.oc.pb());
      release();
      return;
      label108: avformat.av_write_frame(this.oc, null);
    }
  }

  public void stopEncoding()
    throws VineFFmpegFrameRecorder.Exception
  {
    if ((this.oc != null) && ((0x1 & this.oformat.flags()) == 0))
      avformat.avio_close(this.oc.pb());
    release();
  }

  public void writeEncodedImage(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws VineFFmpegFrameRecorder.Exception
  {
    this.hasData = true;
    avcodec.av_init_packet(this.video_pkt);
    this.video_pkt.data(this.video_outbuf);
    BytePointer localBytePointer = this.video_pkt.data();
    localBytePointer.position(0);
    localBytePointer.put(paramArrayOfByte, paramInt1, paramInt2);
    localBytePointer.limit(paramInt2);
    this.video_pkt.size(paramInt2);
    this.video_pkt.pts(this.picture.pts());
    this.video_pkt.dts(this.video_pkt.pts());
    this.picture.pts(1L + this.picture.pts());
    if (this.video_pkt.pts() != avutil.AV_NOPTS_VALUE)
      this.video_pkt.pts(avutil.av_rescale_q(this.video_pkt.pts(), this.video_c.time_base(), this.video_st.time_base()));
    if (this.video_pkt.dts() != avutil.AV_NOPTS_VALUE)
      this.video_pkt.dts(avutil.av_rescale_q(this.video_pkt.dts(), this.video_c.time_base(), this.video_st.time_base()));
    this.video_pkt.stream_index(this.video_st.index());
    writeVideoFrame();
  }

  public static class Exception extends Exception
  {
    public Exception(String paramString)
    {
      super();
    }

    public Exception(String paramString, Throwable paramThrowable)
    {
      super(paramThrowable);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.VineFFmpegFrameRecorder
 * JD-Core Version:    0.6.2
 */