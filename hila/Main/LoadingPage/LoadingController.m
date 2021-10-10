//
//  LoadingController.m
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "LoadingController.h"

@interface LoadingController ()

@property (nonatomic,strong)UIImageView *imgView;

@end

@implementation LoadingController


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    UIColor *MainNavBarColor = [UIColor whiteColor];
    [self.navigationController.navigationBar wr_setBackgroundColor:[MainNavBarColor colorWithAlphaComponent:0.0] isHidden:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.imgView.userInteractionEnabled = YES;
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imgView setImage:[UIImage imageNamed:[self getLaunchImageName]]];
    [self.view addSubview:self.imgView];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([app.netType isEqualToString:@"local"] || [app.netType isEqualToString:@"wifi"]) {
        [self showGuidePageOrIntoApp];
    }else {
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0/*延迟执行时间*/ * NSEC_PER_SEC));

        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self showGuidePageOrIntoApp];
        });
        
    }
    
}


//获取启动图imageName
- (NSString *)getLaunchImageName
{
    CGSize viewSize = self.view.bounds.size;
    // 竖屏
    NSString *viewOrientation = @"Portrait";
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
}

               

- (void)showGuidePageOrIntoApp {

//    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
//    if (![useDef boolForKey:QHJ_UserAgreement]) {
//
//        NSDictionary *archiveDict = [XLArchiverHelper getObject:QHJ_WebListData];
//        if (!archiveDict || kDictIsEmpty(archiveDict)) {
//
//            [self showAlterWithImportantMsg:@"用户服务协议及隐私政策"];
//
//        }else {
//            NSString *improtantstring = @"用户服务协议及隐私政策";
//            NSArray *textArr = [archiveDict objectForKey:@"text"];
//            if (textArr.count > 0) {
//                for (NSDictionary *textDict in textArr) {
//                    NSString *textType = [NSString stringWithFormat:@"%@",textDict[@"type"]];
//                    if ([textType intValue] == 200) {
//                        improtantstring = textDict[@"title"];
//                        break;
//                    }
//                }
//            }
//
//            [self showAlterWithImportantMsg:improtantstring];
//        }
//    }else {

        if (self.delegate && [self.delegate respondsToSelector:@selector(switchRootViewController)]) {
            [self.delegate switchRootViewController];
        }
//    }
    
}

//- (void)exitApplication {
//
//    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    UIWindow *window = app.window;
//
//    [UIView animateWithDuration:1.0f animations:^{
//        window.alpha = 0;
//        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
//    } completion:^(BOOL finished) {
//        exit(0);
//    }];
//
//}

//- (void)showAlterWithImportantMsg:(NSString *)importantMsg {
//
//    ZJNewAlertView *alertView = [[ZJNewAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds Title:importantMsg message:@"" importantMsg:importantMsg sureBtn:@"同意" cancleBtn:@"不同意" viewController:self];
//
//    alertView.resultIndex = ^(NSInteger index) {
//        //同意
//        if (index == 1001) {
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:QHJ_UserAgreement];
//            if (self.delegate && [self.delegate respondsToSelector:@selector(switchRootViewController)]) {
//                [self.delegate switchRootViewController];
//            }
//        }else if (index == 1000) {//不同意
//
//            ZJNewAlertView *unagreeView = [[ZJNewAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds Title:@"提示" subTitle:@"请务必完整了解您的权利、责任和义务,以及平台政策" messageArr:@[] cancleBtn:@"返回"];
//
//            [[UIApplication sharedApplication].keyWindow addSubview:unagreeView];
//
//            unagreeView.resultIndex = ^(NSInteger index) {
//
//                if (index == 1000) {
//                    [self showGuidePageOrIntoApp];
//                }
//
//            };
//
//        }
//
//    };
//
//
//    [self.view addSubview:alertView];
//
//}




@end
