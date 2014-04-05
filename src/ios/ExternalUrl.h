#import <Cordova/CDVPlugin.h>

@interface ExternalUrl : CDVPlugin

- (void)openUrl:(CDVInvokedUrlCommand*)command;

@end