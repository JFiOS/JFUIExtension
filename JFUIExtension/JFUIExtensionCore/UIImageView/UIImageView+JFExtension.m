//
//  UIImageView+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIImageView+JFExtension.h"
#import "UIColor+JFExtension.h"
#import "UIImage+JFExtension.h"

@implementation UIImageView (JFExtension)

- (UIImageView *(^)(id))jimage
{
    return ^(id imageSrc){
        self.image = [UIImage jf_imageByMultiple:imageSrc];;
        return self;
    };
}

- (UIImageView *(^)(void (^)(UIImageView *)))jimageConstructor
{
    return ^(void(^block)(UIImageView *imageView)){
        if (block) block(self);
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UIImageView *(^)(CGRect,id,id))jmaskImage
{
    return ^(CGRect rect, id maskImageSrc, id imageSrc){
        
        UIImage *image = [UIImage jf_imageByMultiple:imageSrc];
        UIImage *maskImage = [UIImage jf_imageByMultiple:maskImageSrc];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        maskLayer.contentsCenter = rect;
        maskLayer.contents = (id)maskImage.CGImage;
        maskLayer.contentsScale = [UIScreen mainScreen].scale;
        
        CALayer *contentLayer = [CALayer layer];
        contentLayer.mask = maskLayer;
        contentLayer.frame = self.bounds;
        contentLayer.contents = (id)image.CGImage;
        [self.layer addSublayer:contentLayer];
        return self;
    };
}

@end
