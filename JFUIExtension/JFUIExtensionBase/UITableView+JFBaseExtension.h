//
//  UITableView+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (JFBaseExtension)

/**
 * 初始化方法
 * 参数：UITableViewStyle
 */
+ (UITableView *(^)(UITableViewStyle))jnew;

- (UITableView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UITableView *(^)(id))jbackgroundColor;

- (UITableView *(^)(CGFloat))jalpha;

- (UITableView *(^)(CGFloat))jcornerRadius;

- (UITableView *(^)(BOOL))jmasksToBounds;

- (UITableView *(^)(id))jborderColor;

- (UITableView *(^)(CGFloat))jborderWidth;

- (UITableView *(^)(UIView *))jsuperView;

- (UITableView *(^)(NSInteger))jtag;

- (UITableView *(^)(BOOL))juserInteractionEnabled;

- (UITableView *(^)(BOOL))jhidden;

- (UITableView *(^)(id))jsubView;

- (UITableView *(^)(NSString *,NSObject *))jkvc;

- (UITableView *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
