//
//  UIImage+Common.h
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/27.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)
// withMaxlength 为设定的固定值，图片实际宽和高谁最大，谁的展示长度就为这个固定值，然后另一个按照她的缩放比例
+(CGSize)ZJImageViewOfrealSize:(CGSize)realsize withMaxlength:(CGFloat)Maxlength;


// scale is screen scale
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color scale:(CGFloat)scale;

// scale is screen scale
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size scale:(CGFloat)scale;

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage *)imageByScalingForSize:(CGSize)targetSize;
- (UIImage *)imageByScalingForMaxWidth:(CGFloat)maxWidth;
- (UIImage *)imageByScalingForMaxWidth:(float)maxWidth
                              minWidth:(float)minWidth;

- (UIImage *)clipImageWithovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight;
- (UIImage *)imageForScreenScale;
- (UIImage *)imageWithScale:(CGFloat)scale;
- (UIImage *)fixOrientation;

//避免与iOS13  API 冲突，导致cell指示箭头带方框
//- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
//- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;
//- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

- (UIImage *)maskWithImage:(const UIImage *)maskImage;
- (UIImage *)renderAtSize:(const CGSize)size;

- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

- (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+ (UIImage *)combineWithTopImg:(UIImage*)topImage bottomImg:(UIImage*)bottomImage;

@end
