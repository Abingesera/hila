//
//  UILabel+Common.h
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/23.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

//动态计算width
- (CGFloat)widthOfString:(NSString *)string
                    font:(UIFont *)font
                  height:(CGFloat)height;

- (CGFloat)heightOfString:(NSString *)string font:(UIFont *)font width:(CGFloat)width;


//标签内容 两边对齐
+ (NSAttributedString *)setAlignmentJustifiedWithString:(NSString *)string;

@end
