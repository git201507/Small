//
//  AlertFramework.m
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/10.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "AlertFramework.h"

@interface AlertController(){
    
}
@end

@implementation AlertController

+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message options:(NSArray *)opTitles blocks:(NSArray<void(^)(UIAlertAction*)>*) blocks
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    for (int i=0;i<opTitles.count;i++) {
        
        NSString *buttonTitle = [opTitles objectAtIndex:i];

        [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle style: (i==opTitles.count-1)?UIAlertActionStyleDestructive:UIAlertActionStyleDefault handler:blocks[i]]];

    }
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)showActionWithTitle:(nullable NSString *)title message:(nullable NSString *)message options:(NSArray *)opTitles blocks:(NSArray<void(^)(UIAlertAction*)>*) blocks
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i=0;i<opTitles.count;i++) {
        
        NSString *buttonTitle = [opTitles objectAtIndex:i];
        [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle style: (i==opTitles.count-1)?UIAlertActionStyleDestructive:UIAlertActionStyleDefault handler:blocks[i]]];
    }
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)closeAlert{
    
}

@end
