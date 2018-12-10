//
//  BlackStatusBarVC.m
//  SmallFrameworkDemo
//
//  Created by Wang on 2018/12/5.
//  Copyright © 2018 Wang. All rights reserved.
//

#import "BlackStatusBarVC.h"
#import "GreenStatusBarVC.h"
#import "StatusBarFramework.h"

@interface BlackStatusBarVC ()

@end

@implementation BlackStatusBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[StatusBarController sharedManager] backgroundColor:[UIColor blackColor]];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[GreenStatusBarVC alloc] init] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
