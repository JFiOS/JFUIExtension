//
//  UICollectionView+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (JFBaseExtension)

/**
 * 初始化方法
 * 参数： 传入一个 flowLayout
 */
+ (UICollectionView *(^)(UICollectionViewFlowLayout *))jnew;

/**
 * 构造器初始化方法，可以在 block 内 return 一个 flowLayout
 * 参数：UITableViewStyle
 */
+ (UICollectionView *(^)(UICollectionViewFlowLayout *(^)(void)))jnewConstructor;

- (UICollectionView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UICollectionView *(^)(id))jbackgroundColor;

- (UICollectionView *(^)(CGFloat))jalpha;

- (UICollectionView *(^)(CGFloat))jcornerRadius;

- (UICollectionView *(^)(BOOL))jmasksToBounds;

- (UICollectionView *(^)(id))jborderColor;

- (UICollectionView *(^)(CGFloat))jborderWidth;

- (UICollectionView *(^)(UIView *))jsuperView;

- (UICollectionView *(^)(NSInteger))jtag;

- (UICollectionView *(^)(BOOL))juserInteractionEnabled;

- (UICollectionView *(^)(BOOL))jhidden;

- (UICollectionView *(^)(id))jsubView;

- (UICollectionView *(^)(NSString *,NSObject *))jkvc;

- (UICollectionView *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
