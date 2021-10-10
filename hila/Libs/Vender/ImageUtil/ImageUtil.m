//
//  ImageUtil.m
//  NewHoldGold
//
//  Created by 梁鑫磊 on 14-6-30.
//  Copyright (c) 2014年 zsgjs. All rights reserved.
//

#import "ImageUtil.h"

#define MAX_IMAGEPIX 500
@implementation ImageUtil

+(UIImage *)imageWithCompressImage:(UIImage *)image
{
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    if(width <= MAX_IMAGEPIX && height <= MAX_IMAGEPIX){
        return image;//不需要压缩
    }
    
    if(width == 0 || height == 0){
        return image;
    }
    
    UIImage *newImage = nil;
    CGFloat widthFactor = MAX_IMAGEPIX / width;
    CGFloat heightFactor = MAX_IMAGEPIX / height;
    CGFloat compressFactor = 0.0;
    
    if(widthFactor > heightFactor){
        compressFactor = heightFactor;//compress to fit height
    }else{
        compressFactor = widthFactor;//compress to fit width
    }
    
    CGFloat compressedWidth = width * compressFactor;
    CGFloat compressedHeight = height * compressFactor;
    CGSize targetSize = CGSizeMake(compressedWidth,compressedHeight);
    
    UIGraphicsBeginImageContext(targetSize);//this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.size.width = compressedWidth;
    thumbnailRect.size.height = compressedHeight;
    
    [image drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();//pop the context to get back to the default
    
    if(newImage != nil){
        return newImage;
    }else{
        return image;
    }
}

+(UIImage *)imageWithScaleImage:(UIImage *)image forSize:(CGSize)targetSize
{
    CGSize imageSize = image.size;
    
    if(CGSizeEqualToSize(imageSize,targetSize) == YES){
        return image;
    }
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaleWidth = targetSize.width;
    CGFloat scaleHeight = targetSize.height;
    
    if(width <= scaleWidth && height <= scaleHeight){
        return image;
    }
    
    if(width == 0 || height == 0){
        return image;
    }
    
    UIImage *newImage = nil;
    CGFloat widthFactor = scaleWidth / width;
    CGFloat heightFactor = scaleHeight / height;
    CGFloat scaleFactor = 0.0;
    
    if(widthFactor > heightFactor){
        scaleFactor = heightFactor;//scale to fit height
    }else{
        scaleFactor = widthFactor;//scale to fit width
    }
    
    CGFloat scaledWidth = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    CGSize target = CGSizeMake(scaledWidth,scaledHeight);
    
    UIGraphicsBeginImageContext(target);//this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [image drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();//pop the context to get back to the default
    
    if(newImage != nil){
        return newImage;  
    }else{  
        return image;  
    }  
}  
@end
