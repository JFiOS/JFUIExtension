//
//  UIFont+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/12.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIFont+JFExtension.h"

@implementation UIFont (JFExtension)

+ (instancetype)jf_fontByMultiple:(id)multiple
{
    UIFont *font = nil;
    if ([multiple isKindOfClass:[NSNumber class]]) {
        font = [UIFont systemFontOfSize:[multiple integerValue]];
    }
    else if ([multiple isKindOfClass:[UIFont class]]) {
        font = multiple;
    }
    return font;
}

@end
