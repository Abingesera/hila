//
//  HomeModuleController.m
//  QHJ
//
//  Created by zsgjs on 2020/10/13.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "HomeModuleController.h"


@interface HomeModuleController ()

@property (nonatomic,assign)BOOL isCanUseSideBack;


@end

@implementation HomeModuleController



-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
   
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self cancelSideBack];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavUI];
    
    self.view.backgroundColor  = [UIColor blueColor];
    
   
}



#pragma mark 设置导航栏
- (void)setNavUI {
    
    [self setNavTitle:@"hila"];
    
   
}


-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    [self startSideBack];
    
}

//关闭ios右滑返回
-(void)cancelSideBack {
    self.isCanUseSideBack = NO;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

//开启ios右滑返回

-(void)startSideBack {
    
    self.isCanUseSideBack = YES;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
}

//当在第一级界面右滑时会返回 YES，因为可能你已经push过了然后又pop回来，以至于右滑被关闭，所以需要设置为 YES
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    return self.isCanUseSideBack;
}



@end
