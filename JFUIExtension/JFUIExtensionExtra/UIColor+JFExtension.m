//
//  UIColor+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIColor+JFExtension.h"

@implementation UIColor (JFExtension)

+ (instancetype)jf_colorByMultiple:(id)multiple
{
    UIColor *color = nil;
    
    if ([multiple isKindOfClass:[UIColor class]]) {
        color = multiple;
    }
    else if ([multiple isKindOfClass:[NSNumber class]]) {
        NSNumber *colorNum = (NSNumber *)multiple;
        color = [UIColor colorWithRed:((colorNum.integerValue & 0xFF0000) >> 16)/255.0 green:(((colorNum.integerValue & 0xFF00) >> 8))/255.0 blue:((colorNum.integerValue & 0xFF))/255.0 alpha:1.0];
    }
    return color;
}

@end
