//
//  MBProgressHUD+Common.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/12/4.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "MBProgressHUD+Common.h"

@implementation MBProgressHUD (Common)

+(void)showNormalMBPHudWithString:(NSString *)string{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.minShowTime = 1.0;
//    HUD.labelText = string;
    HUD.detailsLabelText = string;
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabelFont = [ZJFont setMediumFontWithSizeNumber:ZJFontThreeSizeNumber];
    [HUD showAnimated:YES whileExecutingBlock:^{
        
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

+ (void)showNormalMBPHudWithString:(NSString *)string complectionBlock:(void(^)(void))complectionBlock{
//    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
//    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    HUD.minShowTime = 1.0;
//    HUD.labelText = string;
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabelText = string;
    HUD.detailsLabelFont = [ZJFont setRegularFontWithSizeNumber:ZJFontThreeSizeNumber];
    HUD.detailsLabelColor = [UIColor whiteColor];
    [HUD showAnimated:YES whileExecutingBlock:^{
        
    } completionBlock:^{
        complectionBlock();
        [HUD removeFromSuperview];
    }];
}

@end
