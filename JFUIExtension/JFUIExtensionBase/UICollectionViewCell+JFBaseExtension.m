//
//  UICollectionViewCell+JFBaseExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewCell+JFBaseExtension.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UICollectionViewCell (JFBaseExtension)

+ (UICollectionViewCell *(^)(UICollectionView *,NSString *,NSIndexPath *))jnew
{
    return ^(UICollectionView *collectionView, NSString *reuseId, NSIndexPath *indexPath){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];
        return cell;
    };
}

- (UICollectionViewCell *(^)(id))jsubView
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
