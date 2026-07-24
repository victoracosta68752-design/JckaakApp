#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#define OWNERID @"i1rmJpgEaN"
#define APPNAME @"Jckaak App"
@implementation JckaakLicense
+ (BOOL)verifyKey:(NSString*)key {
NSString *url=[NSString stringWithFormat:@"https://keyauth.win/api/1.1/?type=license&key=%@&ownerid=%@&name=%@",key,OWNERID,APPNAME];
NSURL *u=[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
NSData *d=[NSData dataWithContentsOfURL:u];
NSString *r=[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
return [r containsString:@"success"];
}
+ (void)showMenu {
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
UIAlertController *a=[UIAlertController alertControllerWithTitle:@"Jckaak App - VIP" message:@"Ingresa licencia" preferredStyle:0];
[a addTextFieldWithConfigurationHandler:^(UITextField *t){t.placeholder=@"XXXX-XXXX";}];
[a addAction:[UIAlertAction actionWithTitle:@"Activar" style:0 handler:^(UIAlertAction *x){if([self verifyKey:a.textFields[0].text]){UIAlertController *b=[UIAlertController alertControllerWithTitle:@"Activado!" message:@"Bienvenido" preferredStyle:0];[b addAction:[UIAlertAction actionWithTitle:@"Jugar" style:0 handler:nil]];[[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:b animated:YES completion:nil];}}]];
[[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:a animated:YES completion:nil];
});
}
@end
__attribute__((constructor)) static void init(){[JckaakLicense showMenu];}
