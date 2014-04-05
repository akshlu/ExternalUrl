#import "ExternalUrl.h"

@implementation ExternalUrl
- (void)openUrl:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* result = nil;
    
    NSString* appUrlString = [command argumentAtIndex:0];
    NSString* browserUrlString = [command argumentAtIndex:1];
    
    if (appUrlString == nil || browserUrlString == nil) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Incorrect numbers of arguments"];
    } else {
        NSURL* appUrl = [NSURL URLWithString:appUrlString];
        NSURL* browserUrl = [NSURL URLWithString:browserUrlString];
        
        if ([[UIApplication sharedApplication] canOpenURL:appUrl]) {
            [[UIApplication sharedApplication] openURL:appUrl];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:appUrlString];
        } else {
            [[UIApplication sharedApplication] openURL:browserUrl];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:browserUrlString];
        }
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:[command callbackId]];
}
@end