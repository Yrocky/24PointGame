//
//  UIView+Meme.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "UIView+Meme.h"

@implementation UIView (Meme)

+ (UIImage *)mm_imageWithColor:(UIColor *)color imageSize:(CGSize)imageSize cornerRadius:(CGSize)size corner:(UIRectCorner)corner{
    CGRect rect = (CGRect){
        CGPointZero,
        imageSize
    };
    UIGraphicsBeginImageContext(rect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:size];
    [path addClip];
    [color setFill];
    [path fill];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
