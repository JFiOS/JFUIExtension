//
//  UITableViewCell+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (JFBaseExtension)

/**
 * 初始化方法
 * 参数： 所在的tableView, Cell的类名(可以传 nil,表示系统类), reuseId,UITableViewCellStyle
 */
+ (UITableViewCell *(^)(UITableView *,Class,NSString *,UITableViewCellStyle))jnew;

- (UITableViewCell *(^)(id))jbackgroundColor;

- (UITableViewCell *(^)(CGFloat))jalpha;

- (UITableViewCell *(^)(id))jsubView;

- (UITableViewCell *(^)(NSString *,NSObject *))jkvc;

- (UITableViewCell *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
