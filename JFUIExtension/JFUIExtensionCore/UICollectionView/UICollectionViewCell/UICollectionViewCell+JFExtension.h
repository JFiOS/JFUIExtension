//
//  UICollectionViewCell+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (JFExtension)

- (UICollectionViewCell *(^)(BOOL))jselected;

- (UICollectionViewCell *(^)(BOOL))jhighlighted;

- (UICollectionViewCell *(^)(UIView *))jselectedBackgroundView;

/**
 * `jselectedBackgroundView`的构造器方法
 */
- (UICollectionViewCell *(^)(UIView *(^)(void)))jselectedBackgroundViewConstructor;

@end
