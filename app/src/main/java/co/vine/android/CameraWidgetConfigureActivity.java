package co.vine.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.os.Bundle;
import android.widget.Toast;

public class CameraWidgetConfigureActivity extends Activity
{
  public static void setupShortcut(Context paramContext)
  {
    Intent localIntent1 = new Intent(paramContext.getApplicationContext(), StartActivity.class);
    localIntent1.setAction("co.vine.android.RECORD");
    localIntent1.setFlags(131072);
    Intent localIntent2 = new Intent();
    localIntent2.putExtra("android.intent.extra.shortcut.INTENT", localIntent1);
    localIntent2.putExtra("android.intent.extra.shortcut.NAME", paramContext.getText(2131624017));
    localIntent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", Intent.ShortcutIconResource.fromContext(paramContext.getApplicationContext(), 2130837842));
    localIntent2.setAction("com.android.launcher.action.INSTALL_SHORTCUT");
    paramContext.getApplicationContext().sendBroadcast(localIntent2);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setupShortcut(this);
    Toast.makeText(this, 2131624427, 0).show();
    setResult(0);
    finish();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CameraWidgetConfigureActivity
 * JD-Core Version:    0.6.2
 */