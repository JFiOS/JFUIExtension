//
//  UITableViewCell+JFBaseExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableViewCell+JFBaseExtension.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UITableViewCell (JFBaseExtension)

+ (UITableViewCell *(^)(UITableView *, __unsafe_unretained Class, NSString *,UITableViewCellStyle))jnew
{
    return ^(UITableView *tableView, Class cls, NSString *reuseId,UITableViewCellStyle style){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
        if (!cell) {
            if (!cls) {
                cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:reuseId];
            }
            else {
                cell = [[cls alloc] initWithStyle:style reuseIdentifier:reuseId];
            }
        }
        return cell;
    };
}

- (UITableViewCell *(^)(id))jsubView
{
    return ^(id subView){
        if ([subView isKindOfClass:[NSArray class]]) {
            NSArray *subViews = (NSArray *)subView;
            for (NSInteger i = 0; i < subViews.count; i++) {
                id view = subViews[i];
                if ([view isKindOfClass:[UIView class]]) {
                    [self.contentView addSubview:view];
                }
                else {
                    NSAssert(NO, @"对象：%@ 不是标准视图！",subView);
                }
            }
        }
        else if([subView isKindOfClass:[UIView class]]){
            [self.contentView addSubview:subView];
        }
        else {
            NSAssert(NO, @"对象：%@ 不是标准视图！",subView);
        }
        return self;
    };
}

@end
#pragma clang diagnostic pop
