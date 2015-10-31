package com.crashlytics.android;

import org.json.JSONException;
import org.json.JSONObject;

class ap
{
  public ao a(Z paramZ, JSONObject paramJSONObject)
    throws JSONException
  {
    JSONObject localJSONObject1 = paramJSONObject.getJSONObject("app");
    String str1 = localJSONObject1.getString("identifier");
    String str2 = localJSONObject1.getString("status");
    String str3 = localJSONObject1.getString("url");
    String str4 = localJSONObject1.getString("reports_url");
    boolean bool1 = localJSONObject1.optBoolean("update_required", false);
    boolean bool2 = localJSONObject1.has("icon");
    c localc = null;
    if (bool2)
    {
      boolean bool3 = localJSONObject1.getJSONObject("icon").has("hash");
      localc = null;
      if (bool3)
      {
        JSONObject localJSONObject4 = localJSONObject1.getJSONObject("icon");
        localc = new c(localJSONObject4.getString("hash"), localJSONObject4.getInt("width"), localJSONObject4.getInt("height"));
      }
    }
    i locali = new i(str1, str2, str3, str4, bool1, localc);
    JSONObject localJSONObject2 = paramJSONObject.getJSONObject("settings");
    ar localar = new ar(localJSONObject2.optBoolean("collect_reports", true), localJSONObject2.optInt("cache_duration", 3600), localJSONObject2.optInt("log_buffer_size", 64000), localJSONObject2.optInt("max_chained_exception_depth", 8), localJSONObject2.optInt("max_custom_exception_events", 64), localJSONObject2.optInt("max_custom_key_value_pairs", 64), localJSONObject2.optInt("identifier_mask", 255), localJSONObject2.optBoolean("send_session_without_crash", false));
    JSONObject localJSONObject3 = paramJSONObject.getJSONObject("prompt");
    aj localaj = new aj(localJSONObject3.getBoolean("enabled"), localJSONObject3.optString("title", "Send Crash Report?"), localJSONObject3.optString("message", "Looks like we crashed! Please help us fix the problem by sending a crash report."), localJSONObject3.optString("send_button_title", "Send"), localJSONObject3.optBoolean("show_cancel_button", true), localJSONObject3.optString("cancel_button_title", "Don't Send"), localJSONObject3.optBoolean("show_always_send_button", true), localJSONObject3.optString("always_send_button_title", "Always Send"));
    long l1 = localar.b();
    if (paramJSONObject.has("expires_at"));
    for (long l2 = paramJSONObject.getLong("expires_at"); ; l2 = paramZ.a() + l1 * 1000L)
      return new ao(l2, locali, localar, localaj);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ap
 * JD-Core Version:    0.6.2
 */