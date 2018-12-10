//
//  AlertFramework.h
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/10.
//  Copyright © 2018 Wang. All rights reserved.
//

#ifndef AlertFramework_h
#define AlertFramework_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertController : NSObject
{
    
}
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message options:(NSArray *)opTitles blocks:(NSArray<void(^)(UIAlertAction*)>*) blocks;

+ (void)showActionWithTitle:(nullable NSString *)title message:(nullable NSString *)message options:(NSArray *)opTitles blocks:(NSArray<void(^)(UIAlertAction*)>*) blocks;
@end


#endif /* AlertFramework_h */
