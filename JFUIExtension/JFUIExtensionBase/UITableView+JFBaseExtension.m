//
//  UITableView+JFBaseExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableView+JFBaseExtension.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UITableView (JFBaseExtension)

+ (UITableView *(^)(UITableViewStyle))jnew
{
    return ^(UITableViewStyle style){
        return [[UITableView alloc] initWithFrame:CGRectZero style:style];
    };
}

@end
#pragma clang diagnostic pop
