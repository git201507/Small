//
//  WhiteStatusBarVC.m
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/5.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "WhiteStatusBarVC.h"
#import "BlackStatusBarVC.h"
#import "StatusBarFramework.h"


@interface WhiteStatusBarVC ()

@end

@implementation WhiteStatusBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[StatusBarController sharedManager] backgroundColor:[UIColor whiteColor]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[BlackStatusBarVC alloc] init] animated:YES];
}
@end
