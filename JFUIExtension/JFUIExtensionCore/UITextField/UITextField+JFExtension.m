//
//  UITextField+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITextField+JFExtension.h"
#import "UIColor+JFExtension.h"
#import "UIFont+JFExtension.h"
#import "JFTextFieldProxy.h"
#import <objc/runtime.h>

#define kExtraProxyMethodSet @"kExtraProxyMethodSet"

@implementation UITextField (JFExtension)

- (UITextField *(^)(NSString *))jtext
{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(NSAttributedString *))jattributedText
{
    return ^(NSAttributedString *attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

- (UITextField *(^)(id))jtextColor
{
    return ^(id color){
        self.textColor = [UIColor jf_colorByMultiple:color];
        return self;
    };
}

- (UITextField *(^)(id))jfont
{
    return ^(id font){
        self.font = [UIFont jf_fontByMultiple:font];
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))jtextAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UITextField *(^)(UITextBorderStyle))jborderStyle
{
    return ^(UITextBorderStyle borderStyle){
        self.borderStyle = borderStyle;
        return self;
    };
}

- (UITextField *(^)(NSDictionary<NSString *,id> *))jdefaultTextAttributes
{
    return ^(NSDictionary *defaultTextAttributes){
        self.defaultTextAttributes = defaultTextAttributes;
        return self;
    };
}

- (UITextField *(^)(NSString *))jplaceholder
{
    return ^(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField *(^)(NSAttributedString *))jattributedPlaceholder
{
    return ^(NSAttributedString *attributedPlaceholder){
        self.attributedPlaceholder = attributedPlaceholder;
        return self;
    };
}

- (UITextField *(^)(BOOL))jclearsOnBeginEditing
{
    return ^(BOOL clearsOnBeginEditing){
        self.clearsOnBeginEditing = clearsOnBeginEditing;
        return self;
    };
}

- (UITextField *(^)(BOOL))jadjustsFontSizeToFitWidth
{
    return ^(BOOL adjustsFontSizeToFitWidth){
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

- (UITextField *(^)(CGFloat))jminimumFontSize
{
    return ^(CGFloat minimumFontSize){
        self.minimumFontSize = minimumFontSize;
        return self;
    };
}

- (UITextField *(^)(NSObject<UITextFieldDelegate> *))jdelegate
{
    return ^(NSObject<UITextFieldDelegate> *delegate){
        self.delegate = delegate;
        return self;
    };
}

- (UITextField *(^)(UIImage *))jbackground
{
    return ^(UIImage *background){
        self.background = background;
        return self;
    };
}

- (UITextField *(^)(UIImage *(^)(void)))jbackgroundConstructor
{
    return ^(UIImage *(^block)(void)){
        if (block) {
           self.background = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(UIImage *))jdisabledBackground
{
    return ^(UIImage *disabledBackground){
        self.disabledBackground = disabledBackground;
        return self;
    };
}

- (UITextField *(^)(UIImage *(^)(void)))jdisabledBackgroundConstructor
{
    return ^(UIImage *(^block)(void)){
        if (block) {
           self.disabledBackground = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(BOOL))jallowsEditingTextAttributes
{
    return ^(BOOL allowsEditingTextAttributes){
        self.allowsEditingTextAttributes = allowsEditingTextAttributes;
        return self;
    };
}

- (UITextField *(^)(NSDictionary<NSString *,id> *))jtypingAttributes
{
    return ^(NSDictionary *typingAttributes){
        self.typingAttributes = typingAttributes;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))jclearButtonMode
{
    return ^(UITextFieldViewMode clearButtonMode){
        self.clearButtonMode = clearButtonMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))jleftView
{
    return ^(UIView *leftView){
        self.leftView = leftView;
        return self;
    };
}

- (UITextField *(^)(UIView *(^)(void)))jleftViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
            self.leftView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))jleftViewMode
{
    return ^(UITextFieldViewMode leftViewMode){
        self.leftViewMode = leftViewMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))jrightView
{
    return ^(UIView *rightView){
        self.rightView = rightView;
        return self;
    };
}

- (UITextField *(^)(UIView *(^)(void)))jrightViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
            self.rightView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))jrightViewMode
{
    return ^(UITextFieldViewMode rightViewMode){
        self.rightViewMode = rightViewMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))jinputView
{
    return ^(UIView *inputView){
        self.inputView = inputView;
        return self;
    };
}

- (UITextField *(^)(UIView *(^)(void)))jinputViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
           self.inputView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(UIView *))jinputAccessoryView
{
    return ^(UIView *inputAccessoryView){
        self.inputAccessoryView = inputAccessoryView;
        return self;
    };
}

- (UITextField *(^)(UIView *(^)(void)))jinputAccessoryViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
            self.inputAccessoryView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

- (UITextField *(^)(BOOL))jclearsOnInsertion
{
    return ^(BOOL clearsOnInsertion){
        self.clearsOnInsertion = clearsOnInsertion;
        return self;
    };
}

- (UITextField *(^)(BOOL))jenable
{
    return ^(BOOL enabled){
        self.enabled = enabled;
        return self;
    };
}

@end

@implementation UITextField (JFDelegateExtension)

- (UITextField *(^)(void(^)(JFTextFieldProxy *)))jdelegateTrusteeship
{
    return ^(void(^block)(JFTextFieldProxy *textFieldProxy)){
        if (block) {
            JFTextFieldProxy *proxy = [JFTextFieldProxy proxy];
            block(proxy);
            self.delegate = proxy.proxyObject;
            
            objc_setAssociatedObject(self, @"JFTextFieldProxy", proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return self;
    };
}

@end

