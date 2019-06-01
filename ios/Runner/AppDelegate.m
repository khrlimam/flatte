#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  [GMSServices provideAPIKey: @"AIzaSyBtcO5tVYzhm_-4Cjd4FogXqG6ygx8hxRQ"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
