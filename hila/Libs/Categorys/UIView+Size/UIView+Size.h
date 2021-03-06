//
//  UIView+Size.h
//  NewHoldGold
//
//  Created by 梁鑫磊 on 13-12-27.
//  Copyright (c) 2013年 zsgjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

@interface UIView (Size)
/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;



/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;


- (BOOL)findAndResignFirstResponder;

#pragma mark -- 自定义视图显示1s消失
//提示框
- (void)alertViewWillDisappearAutoWithRect:(CGRect )rect string:(NSString *)str;
#pragma mark -- 渐变透明度
- (void) insertTransparentGradient;



- (NSString *)getIPAddress;

//提示框
- (void)alertViewWillDisappearAutoWithRect:(CGRect )rect string:(NSString *)str withTime:(NSInteger)time;
//等待界面
//- (UIView *)waitingViewInAllScreenWith:(NSString *)titile;

-(NSString *)changeFloat:(NSString *)stringFloat;
@end
