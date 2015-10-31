package com.crashlytics.android;

public enum IdManager$DeviceIdentifierType
{
  public final int protobufIndex;

  static
  {
    BLUETOOTH_MAC_ADDRESS = new DeviceIdentifierType("BLUETOOTH_MAC_ADDRESS", 1, 2);
    ANDROID_ID = new DeviceIdentifierType("ANDROID_ID", 2, 100);
    ANDROID_DEVICE_ID = new DeviceIdentifierType("ANDROID_DEVICE_ID", 3, 101);
    ANDROID_SERIAL = new DeviceIdentifierType("ANDROID_SERIAL", 4, 102);
    DeviceIdentifierType[] arrayOfDeviceIdentifierType = new DeviceIdentifierType[5];
    arrayOfDeviceIdentifierType[0] = WIFI_MAC_ADDRESS;
    arrayOfDeviceIdentifierType[1] = BLUETOOTH_MAC_ADDRESS;
    arrayOfDeviceIdentifierType[2] = ANDROID_ID;
    arrayOfDeviceIdentifierType[3] = ANDROID_DEVICE_ID;
    arrayOfDeviceIdentifierType[4] = ANDROID_SERIAL;
  }

  private IdManager$DeviceIdentifierType(int paramInt)
  {
    this.protobufIndex = paramInt;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.IdManager.DeviceIdentifierType
 * JD-Core Version:    0.6.2
 */