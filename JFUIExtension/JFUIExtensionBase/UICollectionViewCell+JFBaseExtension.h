//
//  UICollectionViewCell+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (JFBaseExtension)

/**
 * 初始化方法
 * 参数： 所在的collectionView, reuseId, NSIndexPath
 */
+ (UICollectionViewCell *(^)(UICollectionView *,NSString *,NSIndexPath *))jnew;

- (UICollectionViewCell *(^)(id))jbackgroundColor;

- (UICollectionViewCell *(^)(CGFloat))jalpha;

- (UICollectionViewCell *(^)(id))jsubView;

- (UICollectionViewCell *(^)(NSString *,NSObject *))jkvc;

- (UICollectionViewCell *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
