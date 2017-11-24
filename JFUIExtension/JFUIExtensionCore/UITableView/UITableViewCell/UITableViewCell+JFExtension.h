//
//  UITableViewCell+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/13.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (JFExtension)

- (UITableViewCell *(^)(NSString *))jtext;

- (UITableViewCell *(^)(NSString *))jdetailText;

- (UITableViewCell *(^)(id))jimage;

/**
 * selectionStyle
 * 这个方法有扩展可以直接设置
 */
- (UITableViewCell *(^)(UITableViewCellSelectionStyle))jselectionStyle;

- (UITableViewCell *(^)(UIView *))jselectedBackgroundView;

- (UITableViewCell *(^)(UIView *(^)(void)))jselectedBackgroundViewConstructor;

@end

@interface UITableViewCell (JFCustomExtension)

// 设置selectionStyle为selectionStyleNone
- (UITableViewCell *(^)(void))jselectionStyleNone;

// 设置selectionStyle为selectionStyleBlue
- (UITableViewCell *(^)(void))jselectionStyleBlue;

// 设置selectionStyle为selectionStyleGray
- (UITableViewCell *(^)(void))jselectionStyleGray;

// 设置selectionStyle为selectionStyleDefault
- (UITableViewCell *(^)(void))jselectionStyleDefault;

@end
