//
//  UIImage+Common.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/27.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

// withMaxlength 为设定的固定值  ，图片实际宽和高谁最大，谁的展示长度就为这个固定值，然后另一个按照她的缩放比例
+(CGSize)ZJImageViewOfrealSize:(CGSize)realsize withMaxlength:(CGFloat)Maxlength
{
    CGSize size;
    CGFloat Proportion;//缩放比例
    CGFloat showH = 0;//展示高度
    CGFloat showW = 0;//展示宽度
    // 判断宽和高 谁大
    // 宽高都等于0时返回最大的宽高, (安卓暂时没传size导致crash,临时处理)
    if (realsize.width == 0 && realsize.height == 0) return CGSizeMake(230, 240);
    // 判断宽和高 谁大
    // 宽大于高时以宽缩放的比例为
    if (realsize.height > realsize.width) {
//         if (realsize.height <= 240)
//         {
//             return realsize;
//
//         }else {
//
//             if (realsize.width <= 230) {
//                 showW = realsize.width;
//             }else{
//                 Proportion = Maxlength/realsize.width;
//                 showW = Maxlength;
//                 showH = Proportion * realsize.height;
//             }
//         }
        
        Proportion = Maxlength/realsize.height;
        showW = Proportion * realsize.width;
        showH = Maxlength;
        size = CGSizeMake(showW, showH);
    }else
    {
//        if (realsize.width <= 230)
//        {
//            return realsize;
//
//        }else {
//
//            if (realsize.height <= 240) {
//                showH = realsize.height;
//            }else{
//                Proportion = Maxlength/realsize.height;
//                showH = Maxlength;
//                showW = Proportion * realsize.width;
//            }
//        }
        Proportion = Maxlength/realsize.width;
        showH = Proportion*realsize.height;
        showW = Maxlength;
        
        size = CGSizeMake(showW, showH);
    }
    return size;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color scale:0.0];
}

+ (UIImage *)imageWithColor:(UIColor *)color scale:(CGFloat)scale
{
    return [self imageWithColor:color size:CGSizeMake(1.0f, 1.0f) scale:0.0];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    return [self imageWithColor:color size:size scale:0.0];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size scale:(CGFloat)scale
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    if (targetSize.width == 0 && targetSize.height == 0) {
        return self;
    }
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor){
            scaleFactor = widthFactor; // scale to fit height
        }
        else{
            scaleFactor = heightFactor; // scale to fit width
        }
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
      
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScalingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor){
            scaleFactor = widthFactor; // scale to fit height
        }
        else{
            scaleFactor = heightFactor; // scale to fit width
        }
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
    }
    
  CGSize realTargetSize = CGSizeMake(scaledWidth, scaledHeight);
    
    UIGraphicsBeginImageContextWithOptions(realTargetSize, NO, 0.0); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
   
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScalingForMaxWidth:(CGFloat)maxWidth
{
    if (maxWidth == 0) {
        return self;
    }
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (width <= maxWidth) {
        return sourceImage;
    }
    
    if (width==0 || height==0) {
        return nil;
    }
    
    
    CGFloat scaledWidth;
    CGFloat scaledHeight;
    CGFloat scaleFactor = maxWidth / width;
    scaledWidth = maxWidth;
    scaledHeight = height * scaleFactor;
    CGSize realTargetSize = CGSizeMake(scaledWidth, scaledHeight);
    
    UIGraphicsBeginImageContextWithOptions(realTargetSize, NO, 0.0);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) {
       
    }
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)colorized:(UIColor *)color
{
    // begin a new image context, to draw our colored image onto
    if (UIGraphicsBeginImageContextWithOptions)
    {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    }
    else
    {
        UIGraphicsBeginImageContext(self.size);
    }
    
    // get a reference to that context we created
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the fill color
    [color setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set the blend mode to color burn, and the original image
    CGContextSetBlendMode(context, kCGBlendModeColorBurn);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextDrawImage(context, rect, self.CGImage);
    
    // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context, kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return the color-burned image
    return coloredImg;
}


- (UIImage *)imageByScalingForMaxWidth:(float)maxWidth
                              minWidth:(float)minWidth
{
    maxWidth = MAX(maxWidth, minWidth);
    minWidth = MIN(maxWidth, minWidth);
    UIImage *newImage = nil;
    if (self) {
        CGSize imageSize = self.size;
        float factor = imageSize.width / imageSize.height;
        float maxFactor = maxWidth / minWidth;
        float minFactor = 1 / maxFactor;
        
        if (factor >= minFactor && factor <= maxFactor) {
            newImage = [self imageByScalingForSize:CGSizeMake(maxWidth, maxWidth)];
        } else if (factor < minFactor) {
            newImage = [self imageByScalingAndCroppingForSize:CGSizeMake(minWidth, maxWidth)];
        } else if (factor > maxFactor) {
            newImage = [self imageByScalingAndCroppingForSize:CGSizeMake(maxWidth, minWidth)];
        }
    }
    return newImage;
}

- (UIImage *)clipImageWithovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) { // 1
        return self;
    }
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, TRUE);
    CGContextSetShouldAntialias(context, TRUE);
    
    CGContextSaveGState(context);
    CGContextTranslateCTM (context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM (context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth (rect) / ovalWidth;
    fh = CGRectGetHeight (rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
    
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, -CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextClip(context);
    CGContextDrawImage(context, rect, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageForScreenScale
{
    CGFloat screenScale = [UIScreen mainScreen].scale;
    
    return [self imageWithScale:screenScale];
}

- (UIImage *)imageWithScale:(CGFloat)scale
{
    UIImage *newImage = self;
    CGFloat screenScale = [UIScreen mainScreen].scale;
    if (self.scale != screenScale) {
        newImage = [UIImage imageWithCGImage:self.CGImage scale:screenScale orientation:self.imageOrientation];
    }
    
    return newImage;
}

- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

//- (UIImage *)imageWithTintColor:(UIColor *)tintColor
//{
//    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
//}
//
//- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor
//{
//    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
//}
//
//- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
//{
//    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
//    [tintColor setFill];
//    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
//    UIRectFill(bounds);
//
//    //Draw the tinted image in context
//    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
//
//    if (blendMode != kCGBlendModeDestinationIn) {
//        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
//    }
//
//    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return tintedImage;
//}

- (UIImage *)maskWithImage:(const UIImage *)maskImage
{
    const CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    const CGImageRef maskImageRef = maskImage.CGImage;
    const CGContextRef mainViewContentContext = CGBitmapContextCreate (NULL,
                                                                       maskImage.size.width,
                                                                       maskImage.size.height,
                                                                       8,
                                                                       0,
                                                                       colorSpace,
                                                                       kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    if (!mainViewContentContext) {
        return nil;
    }
    
    CGFloat ratio = maskImage.size.width / self.size.width;
    if (ratio * self.size.height < maskImage.size.height) {
        ratio = maskImage.size.height / self.size.height;
    }
    
    const CGRect maskRect = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height);
    
    const CGRect imageRect = CGRectMake(-((self.size.width * ratio) - maskImage.size.width) / 2,
                                        -((self.size.height * ratio) - maskImage.size.height) / 2,
                                        self.size.width * ratio,
                                        self.size.height * ratio);
    
    CGContextClipToMask(mainViewContentContext, maskRect, maskImageRef);
    
    //    CGContextSetFillColorWithColor(mainViewContentContext, [UIColor redColor].CGColor);
    //    CGContextFillRect(mainViewContentContext, maskRect);
    
    CGContextDrawImage(mainViewContentContext, imageRect, self.CGImage);
    
    CGImageRef newImage = CGBitmapContextCreateImage(mainViewContentContext);
    CGContextRelease(mainViewContentContext);
    
    UIImage *theImage = [UIImage imageWithCGImage:newImage];
    CGImageRelease(newImage);
    return theImage;
}

// Render a UIImage at the specified size. This is needed to render out the resizable image mask before sending it to maskImage:withMask:
- (UIImage *)renderAtSize:(const CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    const CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:CGRectMake(0, 0, ceilf(size.width), ceilf(size.height))];
    
    const CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIImage *renderedImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    UIGraphicsEndImageContext();
    
    return renderedImage;
}



- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation

{
    long double rotate = 0.0;
    
    CGRect rect;
    
    float translateX = 0;
    
    float translateY = 0;
    
    float scaleX = 1.0;
    
    float scaleY = 1.0;
    
    switch (orientation) {
            
        case UIImageOrientationLeft:
            
            rotate = M_PI_2;
            
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            
            translateX = 0;
            
            translateY = -rect.size.width;
            
            scaleY = rect.size.width/rect.size.height;
            
            scaleX = rect.size.height/rect.size.width;
            
            break;
            
        case UIImageOrientationRight:
            
            rotate = 3 * M_PI_2;
            
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            
            translateX = -rect.size.height;
            
            translateY = 0;
            
            scaleY = rect.size.width/rect.size.height;
            
            scaleX = rect.size.height/rect.size.width;
            
            break;
            
        case UIImageOrientationDown:
            
            rotate = M_PI;
            
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            
            translateX = -rect.size.width;
            
            translateY = -rect.size.height;
            
            break;
            
        default:
            
            rotate = 0.0;
            
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            
            translateX = 0;
            
            translateY = 0;
            
            break;
            
    }
    
    
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //做CTM变换
    
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextRotateCTM(context, rotate);
    
    CGContextTranslateCTM(context, translateX, translateY);
    
    
    
    CGContextScaleCTM(context, scaleX, scaleY);
    
    //绘制图片
    
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    return newPic;
    
}

//根据图片 截取 部分
- (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}

+ (UIImage *)combineWithTopImg:(UIImage*)topImage bottomImg:(UIImage*)bottomImage{
    if (bottomImage == nil) {
        return topImage;
    }
    CGFloat width = topImage.size.width;
    CGFloat height = topImage.size.height + bottomImage.size.height * SCREEN_WIDTH / bottomImage.size.width;
    CGSize offScreenSize = CGSizeMake(width, height - 49 - HOME_INDICATOR_HEIGHT);
    
    UIGraphicsBeginImageContextWithOptions(offScreenSize, NO, [UIScreen mainScreen].scale);
    CGRect rectTop = CGRectMake(0, 0, topImage.size.width, topImage.size.height);
    [topImage drawInRect:rectTop];

    CGRect rectBottom = CGRectMake(0, rectTop.origin.y + rectTop.size.height - 49 - HOME_INDICATOR_HEIGHT, width, bottomImage.size.height * SCREEN_WIDTH / bottomImage.size.width);
    [bottomImage drawInRect:rectBottom];
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imagez;
}





@end
