//
//  UITextField+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (JFBaseExtension)

+ (UITextField *(^)(void))jnew;

- (UITextField *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UITextField *(^)(id))jbackgroundColor;

- (UITextField *(^)(CGFloat))jalpha;

- (UITextField *(^)(CGFloat))jcornerRadius;

- (UITextField *(^)(BOOL))jmasksToBounds;

- (UITextField *(^)(id))jborderColor;

- (UITextField *(^)(CGFloat))jborderWidth;

- (UITextField *(^)(UIView *))jsuperView;

- (UITextField *(^)(NSInteger))jtag;

- (UITextField *(^)(BOOL))juserInteractionEnabled;

- (UITextField *(^)(BOOL))jhidden;

- (UITextField *(^)(id))jsubView;

- (UITextField *(^)(NSString *,NSObject *))jkvc;

- (UITextField *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
