//
//  UIButton+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JFBaseExtension)

+ (UIButton *(^)(void))jnew;

- (UIButton *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UIButton *(^)(id))jbackgroundColor;

- (UIButton *(^)(CGFloat))jalpha;

- (UIButton *(^)(CGFloat))jcornerRadius;

- (UIButton *(^)(BOOL))jmasksToBounds;

- (UIButton *(^)(id))jborderColor;

- (UIButton *(^)(CGFloat))jborderWidth;

- (UIButton *(^)(UIView *))jsuperView;

- (UIButton *(^)(NSInteger))jtag;

- (UIButton *(^)(BOOL))juserInteractionEnabled;

- (UIButton *(^)(BOOL))jhidden;

- (UIButton *(^)(id))jsubView;

- (UIButton *(^)(NSString *,NSObject *))jkvc;

- (UIButton *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
