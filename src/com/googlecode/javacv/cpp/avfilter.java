package com.googlecode.javacv.cpp;

import com.googlecode.javacpp.BytePointer;
import com.googlecode.javacpp.DoublePointer;
import com.googlecode.javacpp.FunctionPointer;
import com.googlecode.javacpp.IntPointer;
import com.googlecode.javacpp.Loader;
import com.googlecode.javacpp.LongPointer;
import com.googlecode.javacpp.Pointer;
import com.googlecode.javacpp.PointerPointer;
import com.googlecode.javacpp.annotation.ByPtrPtr;
import com.googlecode.javacpp.annotation.ByVal;
import com.googlecode.javacpp.annotation.Cast;
import com.googlecode.javacpp.annotation.Const;
import com.googlecode.javacpp.annotation.MemberGetter;
import com.googlecode.javacpp.annotation.Opaque;
import com.googlecode.javacpp.annotation.Properties;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;

@Properties(inherit={"Lcom/googlecode/javacv/cpp/avformat;", "Lcom/googlecode/javacv/cpp/postproc;", "Lcom/googlecode/javacv/cpp/swresample;", "Lcom/googlecode/javacv/cpp/swscale;"}, value={@com.googlecode.javacpp.annotation.Platform(cinclude={"<libavfilter/avfilter.h>", "<libavfilter/buffersink.h>", "<libavfilter/buffersrc.h>"}, link={"avfilter@.3"}), @com.googlecode.javacpp.annotation.Platform(preload={"avfilter-3"}, value={"windows"})})
public class avfilter
{
  public static final int AVFILTER_ALIGN = 16;
  public static final int AVFILTER_AUTO_CONVERT_ALL = 0;
  public static final int AVFILTER_AUTO_CONVERT_NONE = -1;
  public static final int AVFILTER_CMD_FLAG_FAST = 2;
  public static final int AVFILTER_CMD_FLAG_ONE = 1;
  public static final int AVFILTER_FLAG_DYNAMIC_INPUTS = 1;
  public static final int AVFILTER_FLAG_DYNAMIC_OUTPUTS = 2;
  public static final int AVFILTER_FLAG_SLICE_THREADS = 4;
  public static final int AVFILTER_FLAG_SUPPORT_TIMELINE = 196608;
  public static final int AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC = 65536;
  public static final int AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL = 131072;
  public static final int AVFILTER_THREAD_SLICE = 1;
  public static final int AV_BUFFERSINK_FLAG_NO_REQUEST = 2;
  public static final int AV_BUFFERSINK_FLAG_PEEK = 1;
  public static final int AV_BUFFERSRC_FLAG_KEEP_REF = 8;
  public static final int AV_BUFFERSRC_FLAG_NO_CHECK_FORMAT = 1;
  public static final int AV_BUFFERSRC_FLAG_NO_COPY = 2;
  public static final int AV_BUFFERSRC_FLAG_PUSH = 4;
  public static final int AV_PERM_ALIGN = 64;
  public static final int AV_PERM_NEG_LINESIZES = 32;
  public static final int AV_PERM_PRESERVE = 4;
  public static final int AV_PERM_READ = 1;
  public static final int AV_PERM_REUSE = 8;
  public static final int AV_PERM_REUSE2 = 16;
  public static final int AV_PERM_WRITE = 2;

  static
  {
    Loader.load();
  }

  public static native AVABufferSinkParams av_abuffersink_params_alloc();

  @Deprecated
  public static native int av_buffersink_get_buffer_ref(AVFilterContext paramAVFilterContext, @Cast({"AVFilterBufferRef**"}) PointerPointer paramPointerPointer, int paramInt);

  @Deprecated
  public static native int av_buffersink_get_buffer_ref(AVFilterContext paramAVFilterContext, @ByPtrPtr AVFilterBufferRef paramAVFilterBufferRef, int paramInt);

  public static native int av_buffersink_get_frame(AVFilterContext paramAVFilterContext, avutil.AVFrame paramAVFrame);

  public static native int av_buffersink_get_frame_flags(AVFilterContext paramAVFilterContext, avutil.AVFrame paramAVFrame, int paramInt);

  @ByVal
  public static native avutil.AVRational av_buffersink_get_frame_rate(AVFilterContext paramAVFilterContext);

  public static native int av_buffersink_get_samples(AVFilterContext paramAVFilterContext, avutil.AVFrame paramAVFrame, int paramInt);

  public static native AVBufferSinkParams av_buffersink_params_alloc();

  @Deprecated
  public static native int av_buffersink_poll_frame(AVFilterContext paramAVFilterContext);

  @Deprecated
  public static native int av_buffersink_read(AVFilterContext paramAVFilterContext, @Cast({"AVFilterBufferRef**"}) PointerPointer paramPointerPointer);

  @Deprecated
  public static native int av_buffersink_read(AVFilterContext paramAVFilterContext, @ByPtrPtr AVFilterBufferRef paramAVFilterBufferRef);

  @Deprecated
  public static native int av_buffersink_read_samples(AVFilterContext paramAVFilterContext, @Cast({"AVFilterBufferRef**"}) PointerPointer paramPointerPointer, int paramInt);

  @Deprecated
  public static native int av_buffersink_read_samples(AVFilterContext paramAVFilterContext, @ByPtrPtr AVFilterBufferRef paramAVFilterBufferRef, int paramInt);

  public static native void av_buffersink_set_frame_size(AVFilterContext paramAVFilterContext, @Cast({"unsigned"}) int paramInt);

  public static native int av_buffersrc_add_frame(AVFilterContext paramAVFilterContext, avutil.AVFrame paramAVFrame);

  public static native int av_buffersrc_add_frame_flags(AVFilterContext paramAVFilterContext, avutil.AVFrame paramAVFrame, int paramInt);

  public static native int av_buffersrc_add_ref(AVFilterContext paramAVFilterContext, AVFilterBufferRef paramAVFilterBufferRef, int paramInt);

  @Deprecated
  public static native int av_buffersrc_buffer(AVFilterContext paramAVFilterContext, AVFilterBufferRef paramAVFilterBufferRef);

  @Cast({"unsigned"})
  public static native int av_buffersrc_get_nb_failed_requests(AVFilterContext paramAVFilterContext);

  public static native int av_buffersrc_write_frame(AVFilterContext paramAVFilterContext, @Const avutil.AVFrame paramAVFrame);

  @Cast({"AVFilter**"})
  @Deprecated
  public static native PointerPointer av_filter_next(@Cast({"AVFilter**"}) PointerPointer paramPointerPointer);

  @ByPtrPtr
  @Deprecated
  public static native AVFilter av_filter_next(@ByPtrPtr AVFilter paramAVFilter);

  public static native int avfilter_config_links(AVFilterContext paramAVFilterContext);

  @Cast({"const char*"})
  public static native BytePointer avfilter_configuration();

  @Deprecated
  public static native int avfilter_copy_buf_props(avutil.AVFrame paramAVFrame, @Const AVFilterBufferRef paramAVFilterBufferRef);

  @Deprecated
  public static native void avfilter_copy_buffer_ref_props(AVFilterBufferRef paramAVFilterBufferRef1, AVFilterBufferRef paramAVFilterBufferRef2);

  @Deprecated
  public static native int avfilter_copy_frame_props(AVFilterBufferRef paramAVFilterBufferRef, @Const avutil.AVFrame paramAVFrame);

  public static native void avfilter_free(AVFilterContext paramAVFilterContext);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t**"}) BytePointer paramBytePointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays(@Cast({"uint8_t**"}) PointerPointer paramPointerPointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t**"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t**"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays_channels(@ByPtrPtr @Cast({"uint8_t**"}) BytePointer paramBytePointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, int paramInt5, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays_channels(@Cast({"uint8_t**"}) PointerPointer paramPointerPointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, int paramInt5, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays_channels(@ByPtrPtr @Cast({"uint8_t**"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, int paramInt5, @Cast({"uint64_t"}) long paramLong);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_audio_buffer_ref_from_arrays_channels(@ByPtrPtr @Cast({"uint8_t**"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVSampleFormat"}) int paramInt4, int paramInt5, @Cast({"uint64_t"}) long paramLong);

  public static native AVFilter avfilter_get_by_name(@Cast({"const char*"}) BytePointer paramBytePointer);

  public static native AVFilter avfilter_get_by_name(String paramString);

  @Const
  public static native avutil.AVClass avfilter_get_class();

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_video_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t*const*"}) BytePointer paramBytePointer, @Const IntPointer paramIntPointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVPixelFormat"}) int paramInt4);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_video_buffer_ref_from_arrays(@Cast({"uint8_t*const*"}) PointerPointer paramPointerPointer, @Const IntPointer paramIntPointer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVPixelFormat"}) int paramInt4);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_video_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t*const*"}) ByteBuffer paramByteBuffer, @Const IntBuffer paramIntBuffer, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVPixelFormat"}) int paramInt4);

  @Deprecated
  public static native AVFilterBufferRef avfilter_get_video_buffer_ref_from_arrays(@ByPtrPtr @Cast({"uint8_t*const*"}) byte[] paramArrayOfByte, @Const int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3, @Cast({"AVPixelFormat"}) int paramInt4);

  @Deprecated
  public static native int avfilter_graph_add_filter(AVFilterGraph paramAVFilterGraph, AVFilterContext paramAVFilterContext);

  public static native AVFilterGraph avfilter_graph_alloc();

  public static native AVFilterContext avfilter_graph_alloc_filter(AVFilterGraph paramAVFilterGraph, @Const AVFilter paramAVFilter, @Cast({"const char*"}) BytePointer paramBytePointer);

  public static native AVFilterContext avfilter_graph_alloc_filter(AVFilterGraph paramAVFilterGraph, @Const AVFilter paramAVFilter, String paramString);

  public static native int avfilter_graph_config(AVFilterGraph paramAVFilterGraph, Pointer paramPointer);

  public static native int avfilter_graph_create_filter(@Cast({"AVFilterContext**"}) PointerPointer paramPointerPointer, AVFilter paramAVFilter, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, Pointer paramPointer, AVFilterGraph paramAVFilterGraph);

  public static native int avfilter_graph_create_filter(@ByPtrPtr AVFilterContext paramAVFilterContext, AVFilter paramAVFilter, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, Pointer paramPointer, AVFilterGraph paramAVFilterGraph);

  public static native int avfilter_graph_create_filter(@ByPtrPtr AVFilterContext paramAVFilterContext, AVFilter paramAVFilter, String paramString1, String paramString2, Pointer paramPointer, AVFilterGraph paramAVFilterGraph);

  @Cast({"char*"})
  public static native BytePointer avfilter_graph_dump(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer);

  @Cast({"char*"})
  public static native ByteBuffer avfilter_graph_dump(AVFilterGraph paramAVFilterGraph, String paramString);

  public static native void avfilter_graph_free(@Cast({"AVFilterGraph**"}) PointerPointer paramPointerPointer);

  public static native void avfilter_graph_free(@ByPtrPtr AVFilterGraph paramAVFilterGraph);

  public static native AVFilterContext avfilter_graph_get_filter(AVFilterGraph paramAVFilterGraph, @Cast({"char*"}) BytePointer paramBytePointer);

  public static native AVFilterContext avfilter_graph_get_filter(AVFilterGraph paramAVFilterGraph, @Cast({"char*"}) ByteBuffer paramByteBuffer);

  public static native AVFilterContext avfilter_graph_get_filter(AVFilterGraph paramAVFilterGraph, @Cast({"char*"}) byte[] paramArrayOfByte);

  @Deprecated
  public static native int avfilter_graph_parse(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer1, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer2, Pointer paramPointer);

  @Deprecated
  public static native int avfilter_graph_parse(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2, Pointer paramPointer);

  @Deprecated
  public static native int avfilter_graph_parse(AVFilterGraph paramAVFilterGraph, String paramString, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2, Pointer paramPointer);

  public static native int avfilter_graph_parse2(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer1, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer2);

  public static native int avfilter_graph_parse2(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2);

  public static native int avfilter_graph_parse2(AVFilterGraph paramAVFilterGraph, String paramString, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2);

  public static native int avfilter_graph_parse_ptr(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer1, @Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer2, Pointer paramPointer);

  public static native int avfilter_graph_parse_ptr(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2, Pointer paramPointer);

  public static native int avfilter_graph_parse_ptr(AVFilterGraph paramAVFilterGraph, String paramString, @ByPtrPtr AVFilterInOut paramAVFilterInOut1, @ByPtrPtr AVFilterInOut paramAVFilterInOut2, Pointer paramPointer);

  public static native int avfilter_graph_queue_command(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"const char*"}) BytePointer paramBytePointer3, int paramInt, double paramDouble);

  public static native int avfilter_graph_queue_command(AVFilterGraph paramAVFilterGraph, String paramString1, String paramString2, String paramString3, int paramInt, double paramDouble);

  public static native int avfilter_graph_request_oldest(AVFilterGraph paramAVFilterGraph);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"const char*"}) BytePointer paramBytePointer3, @Cast({"char*"}) BytePointer paramBytePointer4, int paramInt1, int paramInt2);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"const char*"}) BytePointer paramBytePointer3, @Cast({"char*"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"const char*"}) BytePointer paramBytePointer3, @Cast({"char*"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, String paramString1, String paramString2, String paramString3, @Cast({"char*"}) BytePointer paramBytePointer, int paramInt1, int paramInt2);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, String paramString1, String paramString2, String paramString3, @Cast({"char*"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2);

  public static native int avfilter_graph_send_command(AVFilterGraph paramAVFilterGraph, String paramString1, String paramString2, String paramString3, @Cast({"char*"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public static native void avfilter_graph_set_auto_convert(AVFilterGraph paramAVFilterGraph, @Cast({"unsigned"}) int paramInt);

  public static native int avfilter_init_dict(AVFilterContext paramAVFilterContext, @Cast({"AVDictionary**"}) PointerPointer paramPointerPointer);

  public static native int avfilter_init_dict(AVFilterContext paramAVFilterContext, @ByPtrPtr avutil.AVDictionary paramAVDictionary);

  @Deprecated
  public static native int avfilter_init_filter(AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer, Pointer paramPointer);

  @Deprecated
  public static native int avfilter_init_filter(AVFilterContext paramAVFilterContext, String paramString, Pointer paramPointer);

  public static native int avfilter_init_str(AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer);

  public static native int avfilter_init_str(AVFilterContext paramAVFilterContext, String paramString);

  public static native AVFilterInOut avfilter_inout_alloc();

  public static native void avfilter_inout_free(@Cast({"AVFilterInOut**"}) PointerPointer paramPointerPointer);

  public static native void avfilter_inout_free(@ByPtrPtr AVFilterInOut paramAVFilterInOut);

  public static native int avfilter_insert_filter(AVFilterLink paramAVFilterLink, AVFilterContext paramAVFilterContext, @Cast({"unsigned"}) int paramInt1, @Cast({"unsigned"}) int paramInt2);

  @Cast({"const char*"})
  public static native BytePointer avfilter_license();

  public static native int avfilter_link(AVFilterContext paramAVFilterContext1, @Cast({"unsigned"}) int paramInt1, AVFilterContext paramAVFilterContext2, @Cast({"unsigned"}) int paramInt2);

  public static native void avfilter_link_free(@Cast({"AVFilterLink**"}) PointerPointer paramPointerPointer);

  public static native void avfilter_link_free(@ByPtrPtr AVFilterLink paramAVFilterLink);

  public static native int avfilter_link_get_channels(AVFilterLink paramAVFilterLink);

  public static native void avfilter_link_set_closed(AVFilterLink paramAVFilterLink, int paramInt);

  @Const
  public static native AVFilter avfilter_next(@Const AVFilter paramAVFilter);

  @Deprecated
  public static native int avfilter_open(@Cast({"AVFilterContext**"}) PointerPointer paramPointerPointer, AVFilter paramAVFilter, @Cast({"const char*"}) BytePointer paramBytePointer);

  @Deprecated
  public static native int avfilter_open(@ByPtrPtr AVFilterContext paramAVFilterContext, AVFilter paramAVFilter, @Cast({"const char*"}) BytePointer paramBytePointer);

  @Deprecated
  public static native int avfilter_open(@ByPtrPtr AVFilterContext paramAVFilterContext, AVFilter paramAVFilter, String paramString);

  public static native int avfilter_pad_count(@Const AVFilterPad paramAVFilterPad);

  @Cast({"const char*"})
  public static native BytePointer avfilter_pad_get_name(@Const AVFilterPad paramAVFilterPad, int paramInt);

  @Cast({"AVMediaType"})
  public static native int avfilter_pad_get_type(@Const AVFilterPad paramAVFilterPad, int paramInt);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"char*"}) BytePointer paramBytePointer3, int paramInt1, int paramInt2);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"char*"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"char*"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, String paramString1, String paramString2, @Cast({"char*"}) BytePointer paramBytePointer, int paramInt1, int paramInt2);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, String paramString1, String paramString2, @Cast({"char*"}) ByteBuffer paramByteBuffer, int paramInt1, int paramInt2);

  public static native int avfilter_process_command(AVFilterContext paramAVFilterContext, String paramString1, String paramString2, @Cast({"char*"}) byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  @Deprecated
  public static native AVFilterBufferRef avfilter_ref_buffer(AVFilterBufferRef paramAVFilterBufferRef, int paramInt);

  @Deprecated
  public static native int avfilter_ref_get_channels(AVFilterBufferRef paramAVFilterBufferRef);

  public static native int avfilter_register(AVFilter paramAVFilter);

  public static native void avfilter_register_all();

  @Deprecated
  public static native void avfilter_uninit();

  @Deprecated
  public static native void avfilter_unref_buffer(AVFilterBufferRef paramAVFilterBufferRef);

  @Deprecated
  public static native void avfilter_unref_bufferp(@Cast({"AVFilterBufferRef**"}) PointerPointer paramPointerPointer);

  @Deprecated
  public static native void avfilter_unref_bufferp(@ByPtrPtr AVFilterBufferRef paramAVFilterBufferRef);

  @Cast({"unsigned"})
  public static native int avfilter_version();

  public static class AVABufferSinkParams extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVABufferSinkParams()
    {
      allocate();
    }

    public AVABufferSinkParams(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVABufferSinkParams(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native int all_channel_counts();

    public native AVABufferSinkParams all_channel_counts(int paramInt);

    @Const
    @MemberGetter
    public native IntPointer channel_counts();

    @Const
    @MemberGetter
    public native LongPointer channel_layouts();

    public AVABufferSinkParams position(int paramInt)
    {
      return (AVABufferSinkParams)super.position(paramInt);
    }

    @Cast({"const AVSampleFormat*"})
    @MemberGetter
    public native IntPointer sample_fmts();

    public native IntPointer sample_rates();

    public native AVABufferSinkParams sample_rates(IntPointer paramIntPointer);
  }

  public static class AVBufferSinkParams extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVBufferSinkParams()
    {
      allocate();
    }

    public AVBufferSinkParams(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVBufferSinkParams(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Cast({"const AVPixelFormat*"})
    @MemberGetter
    public native IntPointer pixel_fmts();

    public AVBufferSinkParams position(int paramInt)
    {
      return (AVBufferSinkParams)super.position(paramInt);
    }
  }

  public static class AVFilter extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilter()
    {
      allocate();
    }

    public AVFilter(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilter(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Cast({"const char*"})
    @MemberGetter
    public native BytePointer description();

    public native int flags();

    public native AVFilter flags(int paramInt);

    public native Init_AVFilterContext init();

    public native AVFilter init(Init_AVFilterContext paramInit_AVFilterContext);

    public native Init_dict_AVFilterContext_PointerPointer init_dict();

    public native AVFilter init_dict(Init_dict_AVFilterContext_PointerPointer paramInit_dict_AVFilterContext_PointerPointer);

    public native Init_opaque_AVFilterContext_Pointer init_opaque();

    public native AVFilter init_opaque(Init_opaque_AVFilterContext_Pointer paramInit_opaque_AVFilterContext_Pointer);

    @Const
    @MemberGetter
    public native avfilter.AVFilterPad inputs();

    @Cast({"const char*"})
    @MemberGetter
    public native BytePointer name();

    public native AVFilter next();

    public native AVFilter next(AVFilter paramAVFilter);

    @Const
    @MemberGetter
    public native avfilter.AVFilterPad outputs();

    public AVFilter position(int paramInt)
    {
      return (AVFilter)super.position(paramInt);
    }

    @Const
    @MemberGetter
    public native avutil.AVClass priv_class();

    public native int priv_size();

    public native AVFilter priv_size(int paramInt);

    public native Process_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int process_command();

    public native AVFilter process_command(Process_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int paramProcess_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int);

    public native Query_formats_AVFilterContext query_formats();

    public native AVFilter query_formats(Query_formats_AVFilterContext paramQuery_formats_AVFilterContext);

    public native Uninit_AVFilterContext uninit();

    public native AVFilter uninit(Uninit_AVFilterContext paramUninit_AVFilterContext);

    public static class Init_AVFilterContext extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Init_AVFilterContext()
      {
        allocate();
      }

      public Init_AVFilterContext(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterContext paramAVFilterContext);
    }

    public static class Init_dict_AVFilterContext_PointerPointer extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Init_dict_AVFilterContext_PointerPointer()
      {
        allocate();
      }

      public Init_dict_AVFilterContext_PointerPointer(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterContext paramAVFilterContext, @Cast({"AVDictionary**"}) PointerPointer paramPointerPointer);
    }

    public static class Init_opaque_AVFilterContext_Pointer extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Init_opaque_AVFilterContext_Pointer()
      {
        allocate();
      }

      public Init_opaque_AVFilterContext_Pointer(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterContext paramAVFilterContext, Pointer paramPointer);
    }

    public static class Process_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Process_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int()
      {
        allocate();
      }

      public Process_command_AVFilterContext_BytePointer_BytePointer_BytePointer_int_int(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterContext paramAVFilterContext, @Cast({"const char*"}) BytePointer paramBytePointer1, @Cast({"const char*"}) BytePointer paramBytePointer2, @Cast({"char*"}) BytePointer paramBytePointer3, int paramInt1, int paramInt2);
    }

    public static class Query_formats_AVFilterContext extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Query_formats_AVFilterContext()
      {
        allocate();
      }

      public Query_formats_AVFilterContext(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterContext paramAVFilterContext);
    }

    public static class Uninit_AVFilterContext extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Uninit_AVFilterContext()
      {
        allocate();
      }

      public Uninit_AVFilterContext(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native void call(avfilter.AVFilterContext paramAVFilterContext);
    }
  }

  public static class AVFilterBuffer extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterBuffer()
    {
      allocate();
    }

    public AVFilterBuffer(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterBuffer(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Cast({"uint8_t*"})
    public native BytePointer data(int paramInt);

    @Cast({"uint8_t**"})
    @MemberGetter
    public native PointerPointer data();

    public native AVFilterBuffer data(int paramInt, BytePointer paramBytePointer);

    @Cast({"uint8_t*"})
    public native BytePointer extended_data(int paramInt);

    @Cast({"uint8_t**"})
    @MemberGetter
    public native PointerPointer extended_data();

    public native AVFilterBuffer extended_data(int paramInt, BytePointer paramBytePointer);

    public native int format();

    public native AVFilterBuffer format(int paramInt);

    public native Free_AVFilterBuffer free();

    public native AVFilterBuffer free(Free_AVFilterBuffer paramFree_AVFilterBuffer);

    public native int h();

    public native AVFilterBuffer h(int paramInt);

    public native int linesize(int paramInt);

    @MemberGetter
    public native IntPointer linesize();

    public native AVFilterBuffer linesize(int paramInt1, int paramInt2);

    public AVFilterBuffer position(int paramInt)
    {
      return (AVFilterBuffer)super.position(paramInt);
    }

    public native Pointer priv();

    public native AVFilterBuffer priv(Pointer paramPointer);

    @Cast({"unsigned"})
    public native int refcount();

    public native AVFilterBuffer refcount(int paramInt);

    public native int w();

    public native AVFilterBuffer w(int paramInt);

    public static class Free_AVFilterBuffer extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Free_AVFilterBuffer()
      {
        allocate();
      }

      public Free_AVFilterBuffer(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native void call(avfilter.AVFilterBuffer paramAVFilterBuffer);
    }
  }

  public static class AVFilterBufferRef extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterBufferRef()
    {
      allocate();
    }

    public AVFilterBufferRef(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterBufferRef(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native AVFilterBufferRef audio(avfilter.AVFilterBufferRefAudioProps paramAVFilterBufferRefAudioProps);

    public native avfilter.AVFilterBufferRefAudioProps audio();

    public native avfilter.AVFilterBuffer buf();

    public native AVFilterBufferRef buf(avfilter.AVFilterBuffer paramAVFilterBuffer);

    @Cast({"uint8_t*"})
    public native BytePointer data(int paramInt);

    @Cast({"uint8_t**"})
    @MemberGetter
    public native PointerPointer data();

    public native AVFilterBufferRef data(int paramInt, BytePointer paramBytePointer);

    @Cast({"uint8_t*"})
    public native BytePointer extended_data(int paramInt);

    @Cast({"uint8_t**"})
    @MemberGetter
    public native PointerPointer extended_data();

    public native AVFilterBufferRef extended_data(int paramInt, BytePointer paramBytePointer);

    public native int format();

    public native AVFilterBufferRef format(int paramInt);

    public native int linesize(int paramInt);

    @MemberGetter
    public native IntPointer linesize();

    public native AVFilterBufferRef linesize(int paramInt1, int paramInt2);

    public native AVFilterBufferRef metadata(avutil.AVDictionary paramAVDictionary);

    public native avutil.AVDictionary metadata();

    public native int perms();

    public native AVFilterBufferRef perms(int paramInt);

    public native long pos();

    public native AVFilterBufferRef pos(long paramLong);

    public AVFilterBufferRef position(int paramInt)
    {
      return (AVFilterBufferRef)super.position(paramInt);
    }

    public native long pts();

    public native AVFilterBufferRef pts(long paramLong);

    @Cast({"AVMediaType"})
    public native int type();

    public native AVFilterBufferRef type(int paramInt);

    public native AVFilterBufferRef video(avfilter.AVFilterBufferRefVideoProps paramAVFilterBufferRefVideoProps);

    public native avfilter.AVFilterBufferRefVideoProps video();
  }

  public static class AVFilterBufferRefAudioProps extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterBufferRefAudioProps()
    {
      allocate();
    }

    public AVFilterBufferRefAudioProps(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterBufferRefAudioProps(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Cast({"uint64_t"})
    public native long channel_layout();

    public native AVFilterBufferRefAudioProps channel_layout(long paramLong);

    public native int channels();

    public native AVFilterBufferRefAudioProps channels(int paramInt);

    public native int nb_samples();

    public native AVFilterBufferRefAudioProps nb_samples(int paramInt);

    public AVFilterBufferRefAudioProps position(int paramInt)
    {
      return (AVFilterBufferRefAudioProps)super.position(paramInt);
    }

    public native int sample_rate();

    public native AVFilterBufferRefAudioProps sample_rate(int paramInt);
  }

  public static class AVFilterBufferRefVideoProps extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterBufferRefVideoProps()
    {
      allocate();
    }

    public AVFilterBufferRefVideoProps(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterBufferRefVideoProps(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native int h();

    public native AVFilterBufferRefVideoProps h(int paramInt);

    public native int interlaced();

    public native AVFilterBufferRefVideoProps interlaced(int paramInt);

    public native int key_frame();

    public native AVFilterBufferRefVideoProps key_frame(int paramInt);

    @Cast({"AVPictureType"})
    public native int pict_type();

    public native AVFilterBufferRefVideoProps pict_type(int paramInt);

    public AVFilterBufferRefVideoProps position(int paramInt)
    {
      return (AVFilterBufferRefVideoProps)super.position(paramInt);
    }

    public native BytePointer qp_table();

    public native AVFilterBufferRefVideoProps qp_table(BytePointer paramBytePointer);

    public native int qp_table_linesize();

    public native AVFilterBufferRefVideoProps qp_table_linesize(int paramInt);

    public native int qp_table_size();

    public native AVFilterBufferRefVideoProps qp_table_size(int paramInt);

    public native AVFilterBufferRefVideoProps sample_aspect_ratio(avutil.AVRational paramAVRational);

    @ByVal
    public native avutil.AVRational sample_aspect_ratio();

    public native int top_field_first();

    public native AVFilterBufferRefVideoProps top_field_first(int paramInt);

    public native int w();

    public native AVFilterBufferRefVideoProps w(int paramInt);
  }

  public static class AVFilterContext extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterContext()
    {
      allocate();
    }

    public AVFilterContext(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterContext(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Const
    @MemberGetter
    public native avutil.AVClass av_class();

    @Cast({"AVFilterCommand*"})
    public native Pointer command_queue();

    public native AVFilterContext command_queue(Pointer paramPointer);

    public native Pointer enable();

    public native AVFilterContext enable(Pointer paramPointer);

    @Cast({"char*"})
    public native BytePointer enable_str();

    public native AVFilterContext enable_str(BytePointer paramBytePointer);

    @Const
    @MemberGetter
    public native avfilter.AVFilter filter();

    public native AVFilterContext graph(avfilter.AVFilterGraph paramAVFilterGraph);

    public native avfilter.AVFilterGraph graph();

    public native AVFilterContext input_pads(avfilter.AVFilterPad paramAVFilterPad);

    public native avfilter.AVFilterPad input_pads();

    @Cast({"AVFilterLink**"})
    @MemberGetter
    public native PointerPointer inputs();

    public native AVFilterContext inputs(int paramInt, avfilter.AVFilterLink paramAVFilterLink);

    public native avfilter.AVFilterLink inputs(int paramInt);

    public native AVFilterContext internal(avfilter.AVFilterInternal paramAVFilterInternal);

    public native avfilter.AVFilterInternal internal();

    public native int is_disabled();

    public native AVFilterContext is_disabled(int paramInt);

    @Cast({"char*"})
    public native BytePointer name();

    public native AVFilterContext name(BytePointer paramBytePointer);

    @Cast({"unsigned"})
    public native int nb_inputs();

    public native AVFilterContext nb_inputs(int paramInt);

    @Cast({"unsigned"})
    public native int nb_outputs();

    public native AVFilterContext nb_outputs(int paramInt);

    public native AVFilterContext output_pads(avfilter.AVFilterPad paramAVFilterPad);

    public native avfilter.AVFilterPad output_pads();

    @Cast({"AVFilterLink**"})
    @MemberGetter
    public native PointerPointer outputs();

    public native AVFilterContext outputs(int paramInt, avfilter.AVFilterLink paramAVFilterLink);

    public native avfilter.AVFilterLink outputs(int paramInt);

    public AVFilterContext position(int paramInt)
    {
      return (AVFilterContext)super.position(paramInt);
    }

    public native Pointer priv();

    public native AVFilterContext priv(Pointer paramPointer);

    public native int thread_type();

    public native AVFilterContext thread_type(int paramInt);

    public native DoublePointer var_values();

    public native AVFilterContext var_values(DoublePointer paramDoublePointer);
  }

  @Opaque
  public static class AVFilterFormats extends Pointer
  {
    public AVFilterFormats()
    {
    }

    public AVFilterFormats(Pointer paramPointer)
    {
      super();
    }
  }

  public static class AVFilterGraph extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterGraph()
    {
      allocate();
    }

    public AVFilterGraph(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterGraph(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    @Cast({"char*"})
    public native BytePointer aresample_swr_opts();

    public native AVFilterGraph aresample_swr_opts(BytePointer paramBytePointer);

    @Const
    @MemberGetter
    public native avutil.AVClass av_class();

    @Cast({"unsigned"})
    public native int disable_auto_convert();

    public native AVFilterGraph disable_auto_convert(int paramInt);

    @Cast({"AVFilterContext**"})
    @MemberGetter
    public native PointerPointer filters();

    public native avfilter.AVFilterContext filters(int paramInt);

    public native AVFilterGraph filters(int paramInt, avfilter.AVFilterContext paramAVFilterContext);

    public native AVFilterGraph internal(avfilter.AVFilterGraphInternal paramAVFilterGraphInternal);

    public native avfilter.AVFilterGraphInternal internal();

    public native int nb_threads();

    public native AVFilterGraph nb_threads(int paramInt);

    public AVFilterGraph position(int paramInt)
    {
      return (AVFilterGraph)super.position(paramInt);
    }

    @Cast({"char*"})
    public native BytePointer resample_lavr_opts();

    public native AVFilterGraph resample_lavr_opts(BytePointer paramBytePointer);

    @Cast({"char*"})
    public native BytePointer scale_sws_opts();

    public native AVFilterGraph scale_sws_opts(BytePointer paramBytePointer);

    @Cast({"AVFilterLink**"})
    @MemberGetter
    public native PointerPointer sink_links();

    public native AVFilterGraph sink_links(int paramInt, avfilter.AVFilterLink paramAVFilterLink);

    public native avfilter.AVFilterLink sink_links(int paramInt);

    public native int sink_links_count();

    public native AVFilterGraph sink_links_count(int paramInt);

    public native int thread_type();

    public native AVFilterGraph thread_type(int paramInt);
  }

  @Opaque
  public static class AVFilterGraphInternal extends Pointer
  {
    public AVFilterGraphInternal()
    {
    }

    public AVFilterGraphInternal(Pointer paramPointer)
    {
      super();
    }
  }

  public static class AVFilterInOut extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterInOut()
    {
      allocate();
    }

    public AVFilterInOut(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterInOut(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native avfilter.AVFilterContext filter_ctx();

    public native AVFilterInOut filter_ctx(avfilter.AVFilterContext paramAVFilterContext);

    @Cast({"char*"})
    public native BytePointer name();

    public native AVFilterInOut name(BytePointer paramBytePointer);

    public native AVFilterInOut next();

    public native AVFilterInOut next(AVFilterInOut paramAVFilterInOut);

    public native int pad_idx();

    public native AVFilterInOut pad_idx(int paramInt);

    public AVFilterInOut position(int paramInt)
    {
      return (AVFilterInOut)super.position(paramInt);
    }
  }

  @Opaque
  public static class AVFilterInternal extends Pointer
  {
    public AVFilterInternal()
    {
    }

    public AVFilterInternal(Pointer paramPointer)
    {
      super();
    }
  }

  public static class AVFilterLink extends Pointer
  {
    public static final int AVLINK_INIT = 2;
    public static final int AVLINK_STARTINIT = 1;
    public static final int AVLINK_UNINIT;

    static
    {
      Loader.load();
    }

    public AVFilterLink()
    {
      allocate();
    }

    public AVFilterLink(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterLink(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native int age_index();

    public native AVFilterLink age_index(int paramInt);

    @Cast({"uint64_t"})
    public native long channel_layout();

    public native AVFilterLink channel_layout(long paramLong);

    public native int channels();

    public native AVFilterLink channels(int paramInt);

    public native int closed();

    public native AVFilterLink closed(int paramInt);

    public native avfilter.AVFilterBufferRef cur_buf_copy();

    public native AVFilterLink cur_buf_copy(avfilter.AVFilterBufferRef paramAVFilterBufferRef);

    public native long current_pts();

    public native AVFilterLink current_pts(long paramLong);

    public native avfilter.AVFilterContext dst();

    public native AVFilterLink dst(avfilter.AVFilterContext paramAVFilterContext);

    public native AVFilterLink dstpad(avfilter.AVFilterPad paramAVFilterPad);

    public native avfilter.AVFilterPad dstpad();

    @Cast({"unsigned"})
    public native int flags();

    public native AVFilterLink flags(int paramInt);

    public native int format();

    public native AVFilterLink format(int paramInt);

    public native long frame_count();

    public native AVFilterLink frame_count(long paramLong);

    public native AVFilterLink frame_rate(avutil.AVRational paramAVRational);

    @ByVal
    public native avutil.AVRational frame_rate();

    @Cast({"unsigned"})
    public native int frame_requested();

    public native AVFilterLink frame_requested(int paramInt);

    public native avfilter.AVFilterGraph graph();

    public native AVFilterLink graph(avfilter.AVFilterGraph paramAVFilterGraph);

    public native int h();

    public native AVFilterLink h(int paramInt);

    @Cast({"AVFilterChannelLayouts*"})
    public native Pointer in_channel_layouts();

    public native AVFilterLink in_channel_layouts(Pointer paramPointer);

    public native avfilter.AVFilterFormats in_formats();

    public native AVFilterLink in_formats(avfilter.AVFilterFormats paramAVFilterFormats);

    public native avfilter.AVFilterFormats in_samplerates();

    public native AVFilterLink in_samplerates(avfilter.AVFilterFormats paramAVFilterFormats);

    public native int max_samples();

    public native AVFilterLink max_samples(int paramInt);

    public native int min_samples();

    public native AVFilterLink min_samples(int paramInt);

    @Cast({"AVFilterChannelLayouts*"})
    public native Pointer out_channel_layouts();

    public native AVFilterLink out_channel_layouts(Pointer paramPointer);

    public native avfilter.AVFilterFormats out_formats();

    public native AVFilterLink out_formats(avfilter.AVFilterFormats paramAVFilterFormats);

    public native avfilter.AVFilterFormats out_samplerates();

    public native AVFilterLink out_samplerates(avfilter.AVFilterFormats paramAVFilterFormats);

    public native AVFilterLink partial_buf(avutil.AVFrame paramAVFrame);

    public native avutil.AVFrame partial_buf();

    public native int partial_buf_size();

    public native AVFilterLink partial_buf_size(int paramInt);

    @Cast({"AVFilterPool*"})
    public native Pointer pool();

    public native AVFilterLink pool(Pointer paramPointer);

    public AVFilterLink position(int paramInt)
    {
      return (AVFilterLink)super.position(paramInt);
    }

    public native int request_samples();

    public native AVFilterLink request_samples(int paramInt);

    public native AVFilterLink sample_aspect_ratio(avutil.AVRational paramAVRational);

    @ByVal
    public native avutil.AVRational sample_aspect_ratio();

    public native int sample_rate();

    public native AVFilterLink sample_rate(int paramInt);

    public native avfilter.AVFilterContext src();

    public native AVFilterLink src(avfilter.AVFilterContext paramAVFilterContext);

    public native AVFilterLink srcpad(avfilter.AVFilterPad paramAVFilterPad);

    public native avfilter.AVFilterPad srcpad();

    public native AVFilterLink time_base(avutil.AVRational paramAVRational);

    @ByVal
    public native avutil.AVRational time_base();

    @Cast({"AVMediaType"})
    public native int type();

    public native AVFilterLink type(int paramInt);

    public native int w();

    public native AVFilterLink w(int paramInt);
  }

  public static class AVFilterPad extends Pointer
  {
    static
    {
      Loader.load();
    }

    public AVFilterPad()
    {
      allocate();
    }

    public AVFilterPad(int paramInt)
    {
      allocateArray(paramInt);
    }

    public AVFilterPad(Pointer paramPointer)
    {
      super();
    }

    private native void allocate();

    private native void allocateArray(int paramInt);

    public native Config_props_AVFilterLink config_props();

    public native AVFilterPad config_props(Config_props_AVFilterLink paramConfig_props_AVFilterLink);

    public native Draw_slice_AVFilterLink_int_int_int draw_slice();

    public native AVFilterPad draw_slice(Draw_slice_AVFilterLink_int_int_int paramDraw_slice_AVFilterLink_int_int_int);

    public native End_frame_AVFilterLink end_frame();

    public native AVFilterPad end_frame(End_frame_AVFilterLink paramEnd_frame_AVFilterLink);

    public native Filter_frame_AVFilterLink_AVFrame filter_frame();

    public native AVFilterPad filter_frame(Filter_frame_AVFilterLink_AVFrame paramFilter_frame_AVFilterLink_AVFrame);

    public native Get_audio_buffer_AVFilterLink_int get_audio_buffer();

    public native AVFilterPad get_audio_buffer(Get_audio_buffer_AVFilterLink_int paramGet_audio_buffer_AVFilterLink_int);

    public native Get_video_buffer_AVFilterLink_int_int get_video_buffer();

    public native AVFilterPad get_video_buffer(Get_video_buffer_AVFilterLink_int_int paramGet_video_buffer_AVFilterLink_int_int);

    @Deprecated
    public native int min_perms();

    public native AVFilterPad min_perms(int paramInt);

    @Cast({"const char*"})
    @MemberGetter
    public native BytePointer name();

    public native int needs_fifo();

    public native AVFilterPad needs_fifo(int paramInt);

    public native int needs_writable();

    public native AVFilterPad needs_writable(int paramInt);

    public native Poll_frame_AVFilterLink poll_frame();

    public native AVFilterPad poll_frame(Poll_frame_AVFilterLink paramPoll_frame_AVFilterLink);

    public AVFilterPad position(int paramInt)
    {
      return (AVFilterPad)super.position(paramInt);
    }

    @Deprecated
    public native int rej_perms();

    public native AVFilterPad rej_perms(int paramInt);

    public native Request_frame_AVFilterLink request_frame();

    public native AVFilterPad request_frame(Request_frame_AVFilterLink paramRequest_frame_AVFilterLink);

    public native Start_frame_AVFilterLink_AVFilterBufferRef start_frame();

    public native AVFilterPad start_frame(Start_frame_AVFilterLink_AVFilterBufferRef paramStart_frame_AVFilterLink_AVFilterBufferRef);

    @Cast({"AVMediaType"})
    public native int type();

    public native AVFilterPad type(int paramInt);

    public static class Config_props_AVFilterLink extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Config_props_AVFilterLink()
      {
        allocate();
      }

      public Config_props_AVFilterLink(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink);
    }

    public static class Draw_slice_AVFilterLink_int_int_int extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Draw_slice_AVFilterLink_int_int_int()
      {
        allocate();
      }

      public Draw_slice_AVFilterLink_int_int_int(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink, int paramInt1, int paramInt2, int paramInt3);
    }

    public static class End_frame_AVFilterLink extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected End_frame_AVFilterLink()
      {
        allocate();
      }

      public End_frame_AVFilterLink(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink);
    }

    public static class Filter_frame_AVFilterLink_AVFrame extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Filter_frame_AVFilterLink_AVFrame()
      {
        allocate();
      }

      public Filter_frame_AVFilterLink_AVFrame(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink, avutil.AVFrame paramAVFrame);
    }

    public static class Get_audio_buffer_AVFilterLink_int extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Get_audio_buffer_AVFilterLink_int()
      {
        allocate();
      }

      public Get_audio_buffer_AVFilterLink_int(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native avutil.AVFrame call(avfilter.AVFilterLink paramAVFilterLink, int paramInt);
    }

    public static class Get_video_buffer_AVFilterLink_int_int extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Get_video_buffer_AVFilterLink_int_int()
      {
        allocate();
      }

      public Get_video_buffer_AVFilterLink_int_int(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native avutil.AVFrame call(avfilter.AVFilterLink paramAVFilterLink, int paramInt1, int paramInt2);
    }

    public static class Poll_frame_AVFilterLink extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Poll_frame_AVFilterLink()
      {
        allocate();
      }

      public Poll_frame_AVFilterLink(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink);
    }

    public static class Request_frame_AVFilterLink extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Request_frame_AVFilterLink()
      {
        allocate();
      }

      public Request_frame_AVFilterLink(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink);
    }

    public static class Start_frame_AVFilterLink_AVFilterBufferRef extends FunctionPointer
    {
      static
      {
        Loader.load();
      }

      protected Start_frame_AVFilterLink_AVFilterBufferRef()
      {
        allocate();
      }

      public Start_frame_AVFilterLink_AVFilterBufferRef(Pointer paramPointer)
      {
        super();
      }

      private native void allocate();

      public native int call(avfilter.AVFilterLink paramAVFilterLink, avfilter.AVFilterBufferRef paramAVFilterBufferRef);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacv.cpp.avfilter
 * JD-Core Version:    0.6.2
 */