//
//  UIView+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JFExtension)

+ (UIView *(^)(void))jnew;

- (UIView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UIView *(^)(id))jbackgroundColor;

- (UIView *(^)(CGFloat))jalpha;

- (UIView *(^)(CGFloat))jcornerRadius;

- (UIView *(^)(BOOL))jmasksToBounds;

- (UIView *(^)(id))jborderColor;

- (UIView *(^)(CGFloat))jborderWidth;

- (UIView *(^)(UIView *))jsuperView;

- (UIView *(^)(NSInteger))jtag;

- (UIView *(^)(BOOL))juserInteractionEnabled;

- (UIView *(^)(BOOL))jhidden;

/**
 * subview
 * 可以传单个视图，也可以传递一个视图数组
 */
- (UIView *(^)(id))jsubView;

/**
 * kvc
 * 为了保持风格一致，实际就是 setValueForKey
 */
- (UIView *(^)(NSString *,NSObject *))jkvc;

/**
 * kvc构造器
 * 同`jkvc`，但是第二个参数是个 block，需要 return 一个对象，在这个 block 里可以对return 的数据进行处理
 */
- (UIView *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
