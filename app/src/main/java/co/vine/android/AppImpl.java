package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import co.vine.android.client.AppController;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.recorder.CameraManager;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordConfigUtils.RecordConfig;
import co.vine.android.service.CameraService;
import co.vine.android.service.VineUploadService;
import co.vine.android.util.UploadManager;
import co.vine.android.util.Util;
import java.io.File;
import org.json.JSONObject;

public class AppImpl
  implements AppInterface
{
  private static AppImpl sInstance;

  public static AppImpl getInstance()
  {
    if (sInstance == null)
      sInstance = new AppImpl();
    return sInstance;
  }

  public void appendDebugInfo(Context paramContext, StringBuilder paramStringBuilder, boolean paramBoolean)
  {
    RecordConfigUtils.RecordConfig localRecordConfig1 = RecordConfigUtils.getGenericConfig(paramContext);
    paramStringBuilder.append("\n\nDefault Recording Configuration: ");
    paramStringBuilder.append("\nRecording enabled: " + localRecordConfig1.recordingEnabled);
    paramStringBuilder.append("\nZoom enabled: " + localRecordConfig1.zoomEnabled);
    paramStringBuilder.append("\nCamera Switch enabled: " + localRecordConfig1.cameraSwitchEnabled);
    paramStringBuilder.append("\nFlash Switch enabled: " + localRecordConfig1.flashSwitchEnabled);
    paramStringBuilder.append("\nBuffer Pre-allocation enabled: " + localRecordConfig1.preAllocateBuffer);
    paramStringBuilder.append("\nBuffer count: " + localRecordConfig1.bufferCount);
    paramStringBuilder.append("\nPreview width: " + localRecordConfig1.previewWidth);
    paramStringBuilder.append("\nTarget Frame Rate: " + localRecordConfig1.targetFrameRate);
    if (!paramBoolean)
      paramStringBuilder.append("\nProcess path: " + localRecordConfig1.processDir.getPath());
    paramStringBuilder.append("\nTarget Size: " + localRecordConfig1.targetSize);
    RecordConfigUtils.RecordConfig localRecordConfig2 = RecordConfigUtils.getGenericConfig(paramContext);
    paramStringBuilder.append("\n\nDefault Message Recording Configuration: ");
    paramStringBuilder.append("\nBuffer count: " + localRecordConfig2.bufferCount);
    paramStringBuilder.append("\nPreview width: " + localRecordConfig2.previewWidth);
    paramStringBuilder.append("\nPreview height: " + localRecordConfig2.previewHeight);
    paramStringBuilder.append("\nTarget Frame Rate: " + localRecordConfig2.targetFrameRate);
    paramStringBuilder.append("\nTarget Size: " + localRecordConfig2.targetSize);
  }

  public void clearUploadCaptchas(Context paramContext)
  {
    UploadManager.clearUploadCaptchas(paramContext);
  }

  public boolean doAddWidget(Context paramContext, AccountManager paramAccountManager, Account paramAccount)
  {
    return (RecordConfigUtils.loadWasEverSuccessful(paramContext)) && (VineAccountHelper.needsAddwidget(paramAccountManager, paramAccount));
  }

  public Intent getClearNotificationsIntent(Context paramContext)
  {
    return VineUploadService.getClearNotificationsIntent(paramContext);
  }

  public Intent getDiscardAllIntent(Context paramContext)
  {
    return VineUploadService.getDiscardAllIntent(paramContext);
  }

  public Intent getNotifyFailedIntent(Context paramContext)
  {
    return VineUploadService.getNotifyFailedIntent(paramContext);
  }

  public Intent getRecordingIntent(Activity paramActivity, int paramInt, String paramString)
  {
    return AbstractRecordingActivity.getIntent(paramActivity, paramInt, paramString);
  }

  public void setupWidget(Activity paramActivity)
  {
    CameraWidgetConfigureActivity.setupShortcut(paramActivity);
  }

  public void startCameraService(Activity paramActivity)
  {
    paramActivity.startService(new Intent(paramActivity, CameraService.class));
  }

  public void startCapture(Activity paramActivity)
  {
    if ((CameraManager.hasCamera()) && (RecordConfigUtils.getGenericConfig(paramActivity).recordingEnabled))
    {
      paramActivity.startActivityForResult(AbstractRecordingActivity.getIntent(paramActivity, 131072, "Base options: " + paramActivity.getClass().getName()), 0);
      return;
    }
    Util.showNoCameraToast(paramActivity);
  }

  public void startUploadsListActivity(Activity paramActivity)
  {
    UploadsListActivity.start(paramActivity);
  }

  public void updateClientProfile(Context paramContext, AppController paramAppController, boolean paramBoolean)
  {
    if ((RecordConfigUtils.RecordConfig.needsUpdate(paramContext)) && (!paramBoolean))
      paramAppController.updateClientProfile();
  }

  public void updateRecordConfigs(Context paramContext, JSONObject paramJSONObject)
  {
    RecordConfigUtils.RecordConfig.update(paramContext, paramJSONObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.AppImpl
 * JD-Core Version:    0.6.2
 */