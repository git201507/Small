//
//  StatusBarFramework.h
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/5.
//  Copyright © 2018 Wang. All rights reserved.
//

#ifndef StatusBarFramework_h
#define StatusBarFramework_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StatusBarController : NSObject
{
    
}
//单例
+ (instancetype)sharedManager;
//改变StatusBar的背景色
- (void)backgroundColor:(UIColor *)color;
//恢复到修改之前的状态
- (void)recoverBar;
@end
#endif /* StatusBarFramework_h */
