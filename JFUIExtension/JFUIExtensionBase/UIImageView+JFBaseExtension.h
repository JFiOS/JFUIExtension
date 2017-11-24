//
//  UIImageView+JFBaseExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JFBaseExtension)

+ (UIImageView *(^)(void))jnew;

- (UIImageView *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jframe;

- (UIImageView *(^)(id))jbackgroundColor;

- (UIImageView *(^)(CGFloat))jalpha;

- (UIImageView *(^)(CGFloat))jcornerRadius;

- (UIImageView *(^)(BOOL))jmasksToBounds;

- (UIImageView *(^)(id))jborderColor;

- (UIImageView *(^)(CGFloat))jborderWidth;

- (UIImageView *(^)(UIView *))jsuperView;

- (UIImageView *(^)(NSInteger))jtag;

- (UIImageView *(^)(BOOL))juserInteractionEnabled;

- (UIImageView *(^)(BOOL))jhidden;

- (UIImageView *(^)(id))jsubView;

- (UIImageView *(^)(NSString *,NSObject *))jkvc;

- (UIImageView *(^)(NSString *,id(^)(void)))jkvcConstructor;

@end
