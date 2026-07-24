#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#define OWNERID @"i1rmJpgEaN"
#define APPNAME @"Jckaak App"

@interface JckaakLicense : NSObject
+ (BOOL)verifyKey:(NSString*)key;
+ (void)showMenu;
@end

@implementation JckaakLicense
+ (BOOL)verifyKey:(NSString*)key {
    NSString *url=[NSString stringWithFormat:@"https://jckaak.com/verify?owner=%@&key=%@", OWNERID, key];
    NSURL *u=[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *d=[NSData dataWithContentsOfURL:u];
    NSString *r=[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    return [r containsString:@"success"];
}
+ (void)showMenu {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *a=[UIAlertController alertControllerWithTitle:APPNAME message:@"Enter Key" preferredStyle:UIAlertControllerStyleAlert];
        [a addTextFieldWithConfigurationHandler:nil];
        [a addAction:[UIAlertAction actionWithTitle:@"Verify" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            NSString *k=a.textFields.firstObject.text;
            if([self verifyKey:k]){ NSLog(@"Licensed"); } else { NSLog(@"Fail"); }
        }]];
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:a animated:YES completion:nil];
    });
}
@end

__attribute__((constructor)) static void init() {
    [JckaakLicense showMenu];
}
