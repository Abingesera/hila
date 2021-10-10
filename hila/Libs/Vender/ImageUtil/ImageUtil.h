//
//  ImageUtil.h
//  NewHoldGold
//
//  Created by 梁鑫磊 on 14-6-30.
//  Copyright (c) 2014年 zsgjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject
+(UIImage *)imageWithCompressImage:(UIImage *)image;
+(UIImage *)imageWithScaleImage:(UIImage *)image forSize:(CGSize)targetSize;
@end
