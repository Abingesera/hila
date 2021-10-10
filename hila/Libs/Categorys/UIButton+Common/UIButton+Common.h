//
//  UIButton+Common.h
//  NewHoldGold
//
//  Created by zsgjs on 2017/12/18.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZJButtonEdgeInsetsStyle) {
    ZJButtonEdgeInsetsStyleTop, // image在上，label在下
    ZJButtonEdgeInsetsStyleLeft, // image在左，label在右
    ZJButtonEdgeInsetsStyleBottom, // image在下，label在上
    ZJButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Common)

//设置图片与文字的显示形式
- (void)layoutButtonWithEdgeInsetsStyle:(ZJButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
