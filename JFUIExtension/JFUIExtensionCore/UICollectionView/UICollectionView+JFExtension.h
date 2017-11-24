//
//  UICollectionView+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (JFExtension)

/**
 * scrollEnabled
 */
- (UICollectionView *(^)(BOOL))jscrollEnabled;

- (UICollectionView *(^)(NSObject<UICollectionViewDelegate> *))jdelegate;

- (UICollectionView *(^)(NSObject<UICollectionViewDataSource> *))jdataSource;

/**
 * registerClassForCell
 * 第一个参数传 Cell 的类，第二个 reuseId
 */
- (UICollectionView *(^)(Class,NSString *))jregisterClassForCell;

/**
 * registerClassForSupplementaryView
 * 第一个参数传 supplementaryView 的类，第二个 kind，第三个 reuseId
 * 这个方法有扩展可以直接设置 Header 或者 Footer
 */
- (UICollectionView *(^)(Class,NSString *,NSString *))jregisterClassForSupplementaryView;

@end

@interface UICollectionView (JFCustomExtension)

/**
 * 直接设置 HeaderSupplementaryView
 * 第一个参数传 supplementaryView 的类，第二个 reuseId
 */
- (UICollectionView *(^)(Class,NSString *))jregisterClassForHeaderSupplementaryView;

/**
 * 直接设置 FooterSupplementaryView
 * 第一个参数传 supplementaryView 的类，第二个 reuseId
 */
- (UICollectionView *(^)(Class,NSString *))jregisterClassForFooterSupplementaryView;

@end

@class JFCollectionViewProxy;
@interface UICollectionView (JFDelegateExtension)

/**
 * 代理托管
 * 一旦设置了代理托管，就不需要设置 `jdelegate`和`jdataSource`
 * 具体在`JFCollectionViewProxy`这个类中查看
 */
- (UICollectionView *(^)(void(^)(JFCollectionViewProxy *)))jdelegateAndDataSourceTrusteeship;

@end
