//
//  ViewController.m
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/5.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "ViewController.h"
#import "WhiteStatusBarVC.h"
#import "BlackStatusBarVC.h"
#import "GreenStatusBarVC.h"
#import "StatusBarFramework.h"
#import "ToastFramework.h"
#import "AlertFramework.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[StatusBarController sharedManager] recoverBar];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent; //返回白色
    //return UIStatusBarStyleDefault;    //返回黑色
}

- (BOOL)prefersStatusBarHidden {
    return YES;  //设置状态栏隐藏
    //return NO; //设置状态栏显示
}

- (IBAction)whiteStatusBar:(id)sender
{
    [self.navigationController pushViewController:[[WhiteStatusBarVC alloc] init] animated:YES];
}

- (IBAction)blackStatusBar:(id)sender
{
    [self.navigationController pushViewController:[[BlackStatusBarVC alloc] init] animated:YES];
}

- (IBAction)greenStatusBar:(id)sender
{
    [self.navigationController pushViewController:[[GreenStatusBarVC alloc] init] animated:YES];
}

- (IBAction)toastSome:(id)sender
{
    [[ToastController sharedManager] makeToast:@"百度新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的新闻热点。您可以搜索新闻事件、热点话题、人物动态、产品资讯等,快速了解它们的最新进展。" size:FontSizeBigger position:PositionHigh longTime:YES];
}

- (IBAction)toastShort:(id)sender
{
    [[ToastController sharedManager] makeToast:@"百度新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的新闻热点。您可以搜索新闻事件、热点话题、人物动态、产品资讯等,快速了解它"];
}

- (IBAction)showAlert:(id)sender
{
    [AlertController showAlertWithTitle:@"提示" message:@"百度新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的新闻热点。您可以搜索新闻事件、热点话题、人物动态、产品资讯等,快速了解它" options:@[@"确认",@"取消"] blocks:[NSArray arrayWithObjects:^(UIAlertAction *action) {
        [[ToastController sharedManager] makeToast:action.title];
    }, ^(UIAlertAction *action) {
        [[ToastController sharedManager] makeToast:action.title];
    }, nil]];
}

- (IBAction)showAction:(id)sender
{
    [AlertController showActionWithTitle:@"提示" message:@"百度新闻是包含海量资讯的新闻服务平台,真实反映每时每刻的新闻热点。您可以搜索新闻事件、热点话题、人物动态、产品资讯等,快速了解它" options:@[@"确认1",@"确认2",@"取消"] blocks:[NSArray arrayWithObjects:^(UIAlertAction *action) {
        [[ToastController sharedManager] makeToast:action.title];
    }, ^(UIAlertAction *action) {
        [[ToastController sharedManager] makeToast:action.title];
    }, ^(UIAlertAction *action) {
        [[ToastController sharedManager] makeToast:action.title];
    },nil]];
}
@end
