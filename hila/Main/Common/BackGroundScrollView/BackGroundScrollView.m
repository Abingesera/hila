//
//  BackGroundScrollView.m
//  NewHoldGold
//
//  Created by 掌金 on 2018/1/11.
//  Copyright © 2018年 掌金. All rights reserved.
//

#import "BackGroundScrollView.h"
#define MarkeMainBannerHeight (115*AutoSizeScaleXX)

@implementation BackGroundScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.isLimit) {
        CGPoint point = [gestureRecognizer locationInView:self];
        if (point.y > 0 && point.y < MarkeMainBannerHeight) {
            self.scrollEnabled = NO;
        }
        self.scrollEnabled = YES;
    }
    return YES;
}
@end
