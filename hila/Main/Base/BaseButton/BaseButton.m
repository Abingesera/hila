//
//  BaseButton.m
//  QHJ
//
//  Created by zsgjs on 2020/9/27.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    //去掉点击效果
    self.adjustsImageWhenHighlighted = NO;
    
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

@end
