//
//  UILabel+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JFBaseExtension)

+ (UILabel *(^)(void))jnew;

- (UILabel *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UILabel *(^)(id))jbackgroundColor;

- (UILabel *(^)(CGFloat))jalpha;

- (UILabel *(^)(CGFloat))jcornerRadius;

- (UILabel *(^)(BOOL))jmasksToBounds;

- (UILabel *(^)(id))jborderColor;

- (UILabel *(^)(CGFloat))jborderWidth;

- (UILabel *(^)(UIView *))jsuperView;

- (UILabel *(^)(NSInteger))jtag;

- (UILabel *(^)(BOOL))juserInteractionEnabled;

- (UILabel *(^)(BOOL))jhidden;

- (UILabel *(^)(id))jsubView;

- (UILabel *(^)(NSString *,NSObject *))jkvc;

- (UILabel *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
