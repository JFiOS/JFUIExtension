//
//  UICollectionViewCell+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewCell+JFExtension.h"

@implementation UICollectionViewCell (JFExtension)

- (UICollectionViewCell *(^)(BOOL))jselected
{
    return ^(BOOL selected){
        self.selected = selected;
        return self;
    };
}

- (UICollectionViewCell *(^)(BOOL))jhighlighted
{
    return ^(BOOL highlighted){
        self.highlighted = highlighted;
        return self;
    };
}

- (UICollectionViewCell *(^)(UIView *))jselectedBackgroundView
{
    return ^(UIView *backgroundView){
        self.selectedBackgroundView = backgroundView;
        return self;
    };
}

- (UICollectionViewCell *(^)(UIView *(^)(void)))jselectedBackgroundViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
            self.selectedBackgroundView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

@end
