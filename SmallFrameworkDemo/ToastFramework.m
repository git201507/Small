//
//  ToastFramework.m
//  Toast
//
//  Created by Wang on 2018/12/10.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "ToastFramework.h"

#define SMALL_TOAST_SIZE 14.f
#define MIDDLE_TOAST_SIZE 18.f
#define BIGGEST_TOAST_SIZE 22.f

@interface ToastController(){
    UIWindow *_toastWindow;
    CATransitionType transType;
}
@property(nonatomic, strong) UINavigationController *nav;
@end


@implementation ToastController

+ (instancetype)sharedManager {
    static ToastController *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ToastController alloc] init];
            
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)makeToast:(NSString *)content{
    [self makeToast:content size:FontSizeBigger position:PositionLow longTime:NO];
}

- (void)makeToast:(NSString *)content size:(ShowFontSize)size position:(ToastPosition)position longTime:(BOOL)longTime{

    float fSize = .0f;
    if (size == FontSizeSmall) {
        fSize = SMALL_TOAST_SIZE;
    }
    else if (size == FontSizeBigger){
        fSize = MIDDLE_TOAST_SIZE;
    }
    else if (size == FontSizeBiggest){
        fSize = BIGGEST_TOAST_SIZE;
    }
    
    CGSize infoSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*.75f, CGFLOAT_MAX);
    
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:fSize]};
    // 参数1: 自适应尺寸,提供一个宽度,去自适应高度
    // 参数2:自适应设置 (以行为矩形区域自适应,以字体字形自适应)
    // 参数3:文字属性,通常这里面需要知道是字体大小
    // 参数4:绘制文本上下文,做底层排版时使用,填nil即可
    CGRect infoRect = [content boundingRectWithSize:infoSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    //上面方法在计算文字高度的时候可能得到的是带小数的值,如果用来做视图尺寸的适应的话,需要使用更大一点的整数值.取整的方法使用ceil函数
    UILabel *label = [[UILabel alloc] initWithFrame:infoRect];
    label.numberOfLines = 0;
    label.tag = 100;
    [label setBackgroundColor:[UIColor colorWithRed:.3f green:.3f blue:.3f alpha:.7f]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:fSize]];
    [label setText:content];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    if (!_toastWindow) {
        _toastWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_toastWindow setWindowLevel:UIWindowLevelAlert+1];
        [_toastWindow setBackgroundColor:[UIColor clearColor]];

        [_toastWindow makeKeyAndVisible];
    }
    [_toastWindow setHidden:NO];
    CGPoint cp = _toastWindow.center;
    if (position == PositionLow) {
        cp.y = _toastWindow.frame.size.height - 88.f - infoRect.size.height/2.f;
    }
    else if (position == PositionMiddle) {
//        cp.y += cp.y/4;
    }
    else if (position == PositionHigh) {

        cp.y = 88.f + infoRect.size.height/2.f;
    }
    label.center = cp;
    
    [_toastWindow addSubview:label];
    transType = kCATransitionReveal;
    [self makeTransition];

    [NSTimer scheduledTimerWithTimeInterval:longTime?3:1 target:self selector:@selector(fadeToast:) userInfo:nil repeats:YES];
}

- (void)makeTransition{
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:.5f];
    [applicationLoadViewIn setType:transType];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[_toastWindow layer] addAnimation:applicationLoadViewIn forKey:transType];
}

- (void)fadeToast:(id)sender
{
    [self clearTimer:(NSTimer *)sender];
    if ([_toastWindow viewWithTag:100]) {
        [[_toastWindow viewWithTag:100] removeFromSuperview];
    }
    transType = kCATransitionFade;
    [self makeTransition];
    
    [NSTimer scheduledTimerWithTimeInterval:.75 target:self selector:@selector(hideWindow:) userInfo:nil repeats:YES];
}

- (void)hideWindow:(id)sender
{
    [self clearTimer:(NSTimer *)sender];
    [_toastWindow setHidden:YES];
}

- (void)clearTimer:(NSTimer *)timer{
    [timer invalidate];
    timer = nil;
}

@end
