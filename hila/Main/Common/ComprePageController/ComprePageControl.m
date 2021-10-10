//
//  ComprePageControl.m
//  NewHoldGold
//
//  Created by 掌金 on 2019/7/19.
//  Copyright © 2019 掌金. All rights reserved.
//

#import "ComprePageControl.h"


@implementation ComprePageControl

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = 5;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX + 3 *(self.subviews.count - 1 ) + 13;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        
        UIImageView* dot = [self.subviews objectAtIndex:i];
        dot.layer.masksToBounds = YES;
        dot.layer.cornerRadius = 1.5f;
        
        if (i == self.currentPage) {
            dot.size = CGSizeMake(13, 3);
        }else {
            dot.size = CGSizeMake(3, 3);
        }
       
        if (i <= self.currentPage) {
            dot.frame = CGRectMake(3*i+3*i, 0, dot.size.width, dot.size.height);
        }else {
            dot.frame = CGRectMake(3*(i-1)+3*i+13, 0, dot.size.width, dot.size.height);
        }
        
    }
}

@end
