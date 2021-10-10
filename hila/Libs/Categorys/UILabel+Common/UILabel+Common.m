//
//  UILabel+Common.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/23.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)


- (CGFloat)widthOfString:(NSString *)string font:(UIFont *)font height:(CGFloat)height
{
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.width;
}

- (CGFloat)heightOfString:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    NSDictionary * dict=[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.height;
}

+ (NSAttributedString *)setAlignmentJustifiedWithString:(NSString *)string{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *dic = @{
                          NSParagraphStyleAttributeName : paraStyle,
                          };
    
    [attributedString setAttributes:dic range:NSMakeRange(0, attributedString.length)];
    NSAttributedString *attributContent = [attributedString copy];
    return attributContent;
}


@end
