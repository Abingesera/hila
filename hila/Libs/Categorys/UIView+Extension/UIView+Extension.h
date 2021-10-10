//
//  UIView+Extension.h
//  LetMeSpend
//
//  Created by 翁志方 on 16/4/26.
//  Copyright © 2016年 __defaultyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (nonatomic, assign) CGFloat originX;

@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat endX;

@property (nonatomic, assign) CGFloat endY;


@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign, readonly) CGPoint centerOfCurrentView;

@property (nonatomic, assign) CGFloat centerXOfCurrentView;

@property (nonatomic, assign) CGFloat centerYOfCurrentView;


@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;


// 设置圆角
- (void)cornerRadius:(CGFloat)cornerRadius
         borderColor:(CGColorRef)borderColor
         borderWidth:(CGFloat)borderWidth;

//给某个角设置圆角
- (void)maskToRoundingCorners:(UIRectCorner)corner cornerRedius:(CGSize)size;

//回去Controller
- (UIViewController *)viewController;


- (UIView*)subViewOfClassName:(NSString*)className;
@end
