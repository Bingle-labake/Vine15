package co.vine.android;

public class SonyRecordingFragment extends RecordingFragment
{
  public void onResume()
  {
    super.onResume();
    ((SonyRecordingActivity)getActivity()).setupSonyOverlay();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SonyRecordingFragment
 * JD-Core Version:    0.6.2
 */