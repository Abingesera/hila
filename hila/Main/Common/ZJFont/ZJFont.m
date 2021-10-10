//
//  ZJFont.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/13.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "ZJFont.h"

@implementation ZJFont

+ (UIFont *)setRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatRegularFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatCRegularFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setMediumFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatMediumFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setLightFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatLightFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCLightFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatCLightFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCMediumFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    return [[self class] creatCMediumFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setSemiboldFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatSemiboldFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCSemiboldFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatCSemiboldFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setTRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatTRegularFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCTRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatCTRegularFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}


+ (UIFont *)setSFProTextFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatSFProTextFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setCSFProTextFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber{
    
    return [[self class] creatCSFProTextFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (UIFont *)setPingFangSC_SemiboldFontWithNumber:(ZJFontSizeNumber)sizeNumber{
    return [[self class] creatPingFangSC_SemiboldFontWithSize:[[self class] setFontSizeWithSizeNumber:sizeNumber]];
}

+ (CGFloat)setFontSizeWithSizeNumber:(ZJFontSizeNumber)sizeNumber
{
    CGFloat defaultSize = [[self class] setDefaultMinSize];
    CGFloat fontSize = 0.0;
    switch (sizeNumber) {
        case ZJFontOneSizeNumber:
            fontSize = defaultSize;
            break;
        case ZJFontTwoSizeNumber:
            fontSize = (defaultSize + 1.0);
            break;
        case ZJFontThreeSizeNumber:
            fontSize = (defaultSize + 2.0);
            break;
        case ZJFontFourSizeNumber:
            fontSize = (defaultSize + 3.0);
            break;
        case ZJFontFiveSizeNumber:
            fontSize = (defaultSize + 4.0);
            break;
        case ZJFontSixSizeNumber:
            fontSize = (defaultSize + 5.0);
            break;
        case ZJFontSevenSizeNumber:
            fontSize = (defaultSize + 6.0);
            break;
        case ZJFontEightSizeNumber:
            fontSize = (defaultSize + 7.0);
            break;
        case ZJFontNineSizeNumber:
            fontSize = (defaultSize + 8.0);
            break;
    }
    return fontSize;
}

+ (CGFloat)setDefaultMinSize
{
    CGFloat fontSize = 12.0;//基础最小字体为12.0
    ZJFontType type = ZJFontMiddleType;
    switch (type) {
        case ZJFontBigType:
            fontSize += 1.0;
            break;
        case ZJFontMiddleType:
            fontSize += 0.0;
            break;
        case ZJFontLittleType:
            fontSize -= 1.0;
            break;
    }
    return fontSize;
}

+ (UIFont *)creatLightFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCLightFontWithSize:(CGFloat)size
{
    if (size*AutoSizeScaleXX >= size) {
//        size = 17;
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatMediumFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (font==nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCMediumFontWithSize:(CGFloat)size
{
    if (size*AutoSizeScaleXX >= size) {
//        size = 17;
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (font==nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatRegularFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCRegularFontWithSize:(CGFloat)size
{
    if (size*AutoSizeScaleXX >= size) {
//        size = 17;
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}
+ (UIFont *)creatSemiboldFontWithSize:(CGFloat)size{
    
    UIFont *font = [UIFont fontWithName:@"SFUIText-Semibold" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatSFProTextFontWithSize:(CGFloat)size{
    
    UIFont *font = [UIFont fontWithName:@"SFProText-Medium" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCSemiboldFontWithSize:(CGFloat)size{
    if (size*AutoSizeScaleXX >= size) {
//        size = 17;
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"SFUIText-Semibold" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatTRegularFontWithSize:(CGFloat)size{
    
    UIFont *font = [UIFont fontWithName:@"SFUIText-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCTRegularFontWithSize:(CGFloat)size{
    if (size*AutoSizeScaleXX >= size) {

    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatPingFangSC_SemiboldFontWithSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCSFProTextFontWithSize:(CGFloat)size{
    if (size*AutoSizeScaleXX >= size) {
        
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"SFProText-Medium" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatDINBoldFontWithSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"DINBold" size:size];
    if (font==nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatDIN_RegularFontWithSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"DIN-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCDIN_RegularFontWithSize:(CGFloat)size{
    if (size*AutoSizeScaleXX >= size) {
        
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"DIN-Regular" size:size];
    if (font==nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatCDINBoldFontWithSize:(CGFloat)size{
    if (size*AutoSizeScaleXX >= size) {
        
    }else{
        size = size*AutoSizeScaleXX;
    }
    UIFont *font = [UIFont fontWithName:@"DINBold" size:size];
    if (font==nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatHelveticaNeueFontWithSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:size];
    if (font==nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)creatHelveticaFontWithSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:size];
    if (font==nil) {
        font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    }
    return font;
    
}
@end
