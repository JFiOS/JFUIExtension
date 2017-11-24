//
//  UIImage+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIImage+JFExtension.h"

@implementation UIImage (JFExtension)

+ (instancetype)jf_imageByMultiple:(id)multiple
{
    UIImage *image = nil;
    if ([multiple isKindOfClass:[NSString class]]) {
        image = [UIImage imageNamed:multiple];
    }
    else if ([multiple isKindOfClass:[UIImage class]]){
        image = multiple;
    }
    return image;
}

@end
