//
//  StatusBarFramework.m
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/5.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "StatusBarFramework.h"
@interface StatusBarController(){
    NSInteger _lastBarStyle;
    UIWindow *_colorWindow;
}
@property(nonatomic, strong) UINavigationController *nav;
@end


@implementation StatusBarController

+ (instancetype)sharedManager {
    static StatusBarController *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[StatusBarController alloc] init];
            
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.nav = (UINavigationController *)[[UIApplication sharedApplication].keyWindow rootViewController];
        _lastBarStyle = self.nav.navigationBar.barStyle;
    }
    return self;
}

- (void)backgroundColor:(UIColor *)color{
    
    self.nav.navigationBar.barStyle = UIBarStyleDefault;
    
    CGFloat r,g,b,a = 0.f;
    if ([color getRed:&r green:&g blue:&b alpha:&a]) {
        if (r+g+b<0.3f) {
            self.nav.navigationBar.barStyle = UIBarStyleBlack;
        }
        if (r+g+b==3.f || r+g+b==.0f) {
            color = [UIColor clearColor];
        }
    }
    
    if (!_colorWindow) {
        CGRect r = [UIApplication sharedApplication].statusBarFrame;
        _colorWindow = [[UIWindow alloc] initWithFrame:r];
        [_colorWindow setWindowLevel:999];
        [_colorWindow setBackgroundColor:[UIColor clearColor]];
        
        UIView *v = [[UIView alloc] initWithFrame:r];
        v.tag = 100;
        [v setBackgroundColor:color];
        [_colorWindow addSubview:v];
        [_colorWindow makeKeyAndVisible];
    }
    else{
        UIView *v = [_colorWindow viewWithTag:100];
        [v setBackgroundColor:color];
        [_colorWindow setHidden:NO];
    }
    
}

- (void)recoverBar{

    if (_colorWindow) {
        [_colorWindow setHidden:YES];
    }
    self.nav.navigationBar.barStyle = _lastBarStyle;
}

@end
