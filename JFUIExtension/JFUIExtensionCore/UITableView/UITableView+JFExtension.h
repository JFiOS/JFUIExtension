//
//  UITableView+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/13.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (JFExtension)

- (UITableView *(^)(BOOL))jscrollEnabled;

- (UITableView *(^)(NSObject<UITableViewDelegate> *))jdelegate;

- (UITableView *(^)(NSObject<UITableViewDataSource> *))jdataSource;

- (UITableView *(^)(BOOL))jshowsVerticalScrollIndicator;

- (UITableView *(^)(BOOL))jshowsHorizontalScrollIndicator;

/**
 * separatorStyle
 * 这个方法有扩展可以直接设置 None 或者 SingleLine
 */
- (UITableView *(^)(UITableViewCellSeparatorStyle))jseparatorStyle;

- (UITableView *(^)(UIView *))jtableHeaderView;

/**
 * `jtableHeaderView`构造器模式
 *  block 需要 ruturn 一个 view，可以在 block 中创建和处理该 view
 */
- (UITableView *(^)(UIView *(^)(UITableView *)))jtableHeaderViewConstructor;

- (UITableView *(^)(UIView *))jtableFooterView;

/**
 * `jtableFooterView`构造器模式
 *  block 需要 ruturn 一个 view，可以在 block 中创建和处理该 view
 */
- (UITableView *(^)(UIView *(^)(UITableView *)))jtableFooterViewConstructor;

- (UITableView *(^)(CGFloat))jrowHeight;

@end

@interface UITableView (JFCustomExtension)

// 直接设置separatorStyleNone
- (UITableView *(^)(void))jseparatorStyleNone;

// 直接设置separatorStyleSingleLine
- (UITableView *(^)(void))jseparatorStyleSingleLine;

@end

@class JFTableViewProxy;
@interface UITableView (JFDelegateExtension)

/**
 * 代理托管
 * 一旦设置了代理托管，就不需要设置 `jdelegate`和`jdataSource`
 * 具体在`JFTableViewProxy`这个类中查看
 */
- (UITableView *(^)(void(^)(JFTableViewProxy *)))jdelegateAndDataSourceTrusteeship;

@end
