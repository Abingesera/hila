//
//  ZJFont.h
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/13.
//  Copyright © 2017年 掌金. All rights reserved.
//  字体统一设置

#import <Foundation/Foundation.h>

/** 字体类型 */
typedef NS_ENUM(NSInteger, ZJFontType) {
    ZJFontBigType,//大字体
    ZJFontMiddleType,//适中字体
    ZJFontLittleType //小字体
};

/** 字体大小 */
typedef NS_ENUM(NSInteger, ZJFontSizeNumber) {
    ZJFontOneSizeNumber, //一号字体 (最小字体, 依次增大) 12
    ZJFontTwoSizeNumber, //二号字体 ...
    ZJFontThreeSizeNumber,
    ZJFontFourSizeNumber,
    ZJFontFiveSizeNumber,
    ZJFontSixSizeNumber,
    ZJFontSevenSizeNumber,
    ZJFontEightSizeNumber,
    ZJFontNineSizeNumber
};

@interface ZJFont : NSObject

+ (UIFont *)setLightFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCLightFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setMediumFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCMediumFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setSemiboldFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCSemiboldFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setTRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCTRegularFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setSFProTextFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setCSFProTextFontWithSizeNumber:(ZJFontSizeNumber)sizeNumber;

+ (UIFont *)setPingFangSC_SemiboldFontWithNumber:(ZJFontSizeNumber)sizeNumber;


+ (UIFont *)creatRegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatCRegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatMediumFontWithSize:(CGFloat)size;

+ (UIFont *)creatCMediumFontWithSize:(CGFloat)size;

+ (UIFont *)creatSemiboldFontWithSize:(CGFloat)size;

+ (UIFont *)creatTRegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatCTRegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatCSFProTextFontWithSize:(CGFloat)size;

+ (UIFont *)creatSFProTextFontWithSize:(CGFloat)size;

+ (UIFont *)creatDINBoldFontWithSize:(CGFloat)size;

+ (UIFont *)creatCDINBoldFontWithSize:(CGFloat)size;

+ (UIFont *)creatPingFangSC_SemiboldFontWithSize:(CGFloat)size;

+ (UIFont *)creatDIN_RegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatCDIN_RegularFontWithSize:(CGFloat)size;

+ (UIFont *)creatHelveticaNeueFontWithSize:(CGFloat)size;

+ (UIFont *)creatCLightFontWithSize:(CGFloat)size;

+ (UIFont *)creatLightFontWithSize:(CGFloat)size;

+ (UIFont *)creatHelveticaFontWithSize:(CGFloat)size;

@end
