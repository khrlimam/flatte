package com.example.flatte;

import android.Manifest;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import pub.devrel.easypermissions.AfterPermissionGranted;
import pub.devrel.easypermissions.EasyPermissions;

public class MainActivity extends FlutterActivity {
  private static final int RC_LOCATION = 0;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    requestLocationAccess();
  }

  @Override
  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    super.onRequestPermissionsResult(requestCode, permissions, grantResults);

    // Forward results to EasyPermissions
    EasyPermissions.onRequestPermissionsResult(requestCode, permissions, grantResults, this);
  }

  @AfterPermissionGranted(RC_LOCATION)
  private void requestLocationAccess() {
    String[] perms = {Manifest.permission.ACCESS_FINE_LOCATION};
    if (!EasyPermissions.hasPermissions(this, perms)) {
      // Do not have permissions, request them now
      EasyPermissions.requestPermissions(this, "Location permission needed for app to runs",
              RC_LOCATION, perms);
    }

  }

}
