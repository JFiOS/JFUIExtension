//
//  UICollectionViewFlowLayout+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewFlowLayout (JFExtension)

+ (UICollectionViewFlowLayout *(^)(void))jnew;

- (UICollectionViewFlowLayout *(^)(CGFloat))jminimumLineSpacing;

- (UICollectionViewFlowLayout *(^)(CGFloat))jminimumInteritemSpacing;

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jitemSize;

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jestimatedItemSize;

- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))jscrollDirection;

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jheaderReferenceSize;

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jfooterReferenceSize;

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jsectionInset;

- (UICollectionViewFlowLayout *(^)(UICollectionViewFlowLayoutSectionInsetReference))jsectionInsetReference;

- (UICollectionViewFlowLayout *(^)(BOOL))jsectionHeadersPinToVisibleBounds;

- (UICollectionViewFlowLayout *(^)(BOOL))jsectionFootersPinToVisibleBounds;

@end

@interface UICollectionViewFlowLayout (JFCustomExtension)

// 直接设置方向为垂直
- (UICollectionViewFlowLayout *(^)(void))jscrollDirectionVertical;

// 直接设置方向为水平
- (UICollectionViewFlowLayout *(^)(void))jscrollDirectionHorizontal;

@end
