//
//  ToastFramework.h
//  Toast
//
//  Created by Wang on 2018/12/10.
//  Copyright © 2018 Wang. All rights reserved.
//

#ifndef ToastFramework_h
#define ToastFramework_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FontSizeSmall,
    FontSizeBigger,
    FontSizeBiggest,
} ShowFontSize;

typedef enum : NSUInteger {
    PositionLow,
    PositionMiddle,
    PositionHigh,
} ToastPosition;


@interface ToastController : NSObject
{
    
}
//单例
+ (instancetype)sharedManager;
- (void)makeToast:(NSString *)content size:(ShowFontSize)size position:(ToastPosition)position longTime:(BOOL)longTime;
- (void)makeToast:(NSString *)content;

@end
#endif /* ToastFramework_h */
