//
//  LoadingController.h
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoadingDelegate <NSObject>

- (void)switchRootViewController;

@end

@interface LoadingController : UIViewController

@property (nonatomic,assign)id <LoadingDelegate>delegate;

@end

