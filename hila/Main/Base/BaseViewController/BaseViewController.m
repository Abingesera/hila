//
//  BaseViewController.m
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0]; //改变系统导航返回按钮颜色
    
    //设置导航栏背景颜色 和是否隐藏导航栏底线
    [self.navigationController.navigationBar wr_setBackgroundColor:[UIColor whiteColor] isHidden:NO];
    
    //设置电池条颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)setNavTitle:(NSString *)title {
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLab.text = title;
    titleLab.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [@"#000000" hexStringToColor];
    self.navigationItem.titleView = titleLab;
    
}

//关闭自动旋转
- (BOOL)shouldAutorotate{
    return NO;
}
@end
