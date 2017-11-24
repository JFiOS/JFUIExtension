//
//  UITextField+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (JFExtension)

- (UITextField *(^)(NSString *))jtext;

- (UITextField *(^)(NSAttributedString *))jattributedText;

- (UITextField *(^)(id))jtextColor;

- (UITextField *(^)(id))jfont;

- (UITextField *(^)(NSTextAlignment))jtextAlignment;

- (UITextField *(^)(UITextBorderStyle))jborderStyle;

- (UITextField *(^)(NSDictionary<NSString *,id> *))jdefaultTextAttributes;

- (UITextField *(^)(NSString *))jplaceholder;

- (UITextField *(^)(NSAttributedString *))jattributedPlaceholder;

- (UITextField *(^)(BOOL))jclearsOnBeginEditing;

- (UITextField *(^)(BOOL))jadjustsFontSizeToFitWidth;

- (UITextField *(^)(CGFloat))jminimumFontSize;

- (UITextField *(^)(NSObject<UITextFieldDelegate> *))jdelegate;

- (UITextField *(^)(UIImage *))jbackground;

- (UITextField *(^)(UIImage *(^)(void)))jbackgroundConstructor;

- (UITextField *(^)(UIImage *))jdisabledBackground;

- (UITextField *(^)(UIImage *(^)(void)))jdisabledBackgroundConstructor;

- (UITextField *(^)(BOOL))jallowsEditingTextAttributes;

- (UITextField *(^)(NSDictionary<NSString *,id> *))jtypingAttributes;

- (UITextField *(^)(UITextFieldViewMode))jclearButtonMode;

- (UITextField *(^)(UIView *))jleftView;

- (UITextField *(^)(UIView *(^)(void)))jleftViewConstructor;

- (UITextField *(^)(UITextFieldViewMode))jleftViewMode;

- (UITextField *(^)(UIView *))jrightView;

- (UITextField *(^)(UIView *(^)(void)))jrightViewConstructor;

- (UITextField *(^)(UITextFieldViewMode))jrightViewMode;

- (UITextField *(^)(UIView *))jinputView;

- (UITextField *(^)(UIView *(^)(void)))jinputViewConstructor;

- (UITextField *(^)(UIView *))jinputAccessoryView;

- (UITextField *(^)(UIView *(^)(void)))jinputAccessoryViewConstructor;

- (UITextField *(^)(BOOL))jclearsOnInsertion;

- (UITextField *(^)(BOOL))jenable;

@end

@class JFTextFieldProxy;
@interface UITextField (JFDelegateExtension)

/**
 * 代理托管
 * 一旦设置了代理托管，就不需要设置 `jdelegate`
 * 具体在`JFTextFieldProxy`这个类中查看
 */
- (UITextField *(^)(void(^)(JFTextFieldProxy *)))jdelegateTrusteeship;

@end


