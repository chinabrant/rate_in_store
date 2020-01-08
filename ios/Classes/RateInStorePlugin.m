#import "RateInStorePlugin.h"
#if __has_include(<rate_in_store/rate_in_store-Swift.h>)
#import <rate_in_store/rate_in_store-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rate_in_store-Swift.h"
#endif

@implementation RateInStorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRateInStorePlugin registerWithRegistrar:registrar];
}
@end
