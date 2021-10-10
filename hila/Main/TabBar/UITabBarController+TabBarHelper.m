//
//  UITabBarController+TabBarHelper.m
//  NewHoldGold
//
//  Created by zsgjs on 2020/2/24.
//  Copyright © 2020 掌金. All rights reserved.
//

#import "UITabBarController+TabBarHelper.h"
@implementation UITabBarController (TabBarHelper)

+ (void)load{
    
    Method originalMethod =class_getInstanceMethod(self,@selector(setSelectedIndex:));
    
    Method swizzledMethod =class_getInstanceMethod(self,@selector(zqq_setSelectedIndex:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}

- (void)zqq_setSelectedIndex:(NSInteger)index{
    
    if(index >=self.childViewControllers.count|| index <0) {
        
        return;
    }
    
    
    if(self.delegate==nil) {//如果没有代理，直接调用修改index的方法
        
        [self willChangeValueForKey:@"selectedViewController"];
        
        [self zqq_setSelectedIndex:index];
        
        [self didChangeValueForKey:@"selectedViewController"];
        
    }else{
        
        //即将被选中的controller
        
        UIViewController *willBeSelectController =self.childViewControllers[index];
        
        //如果可以被选中，则继续下一步操作
        
        if([self zqq_canSelectController:willBeSelectController]) {
            
            //手动发送节将修改通知
            
            [self willChangeValueForKey:@"selectedViewController"];
            
            //修改index
            
            [self zqq_setSelectedIndex:index];
            
            //如果delegate实现了这个代理方法，调用该代理方法
            
            if([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
                
                [self.delegate tabBarController:self didSelectViewController:willBeSelectController];
                
            }
            
            //发送已经修改内容通知
            
            [self didChangeValueForKey:@"selectedViewController"];
            
        }
        
    }
    
}

/**

判断即将被选中的controller是否可以被选中

@paramwillBeSelectController即将被选中的controller

@return是否可以被选中

*/

- (BOOL)zqq_canSelectController:(UIViewController*)willBeSelectController

{
    
    //如果delegate实现了判断是否可选中的方法，用代理的方法判断
    
    if([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
        
        return[self.delegate tabBarController:self shouldSelectViewController:willBeSelectController];
        
    }else{
        
        //如果delegate没有实现是否允许选中controller的方法，则默认为可以选中
        
        return YES;
        
    }
    
}

@end
