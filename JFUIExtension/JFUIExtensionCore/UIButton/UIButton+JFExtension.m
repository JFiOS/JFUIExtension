//
//  UIButton+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/12.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIButton+JFExtension.h"
#import "UIColor+JFExtension.h"
#import "UIFont+JFExtension.h"
#import "UIImage+JFExtension.h"
#import "JFMethod.h"
#import <objc/runtime.h>

#define kJFButtonImageRect @"kJFButtonImageRect"
#define kJFButtonTitleRect @"kJFButtonTitleRect"
#define kJFButtonAction  @"kJFButtonAction"
#define kJFButtonState  @"kJFButtonState"
#define kJFButtonEvent  @"kJFButtonEvent"

@implementation UIButton (JFExtension)

- (UIButton *(^)(BOOL))jselected
{
    return ^(BOOL jselected){
        self.selected = jselected;
        return self;
    };
}

- (UIButton *(^)(UIControlState))jstate
{
    return ^(UIControlState state){
        objc_setAssociatedObject(self, kJFButtonState, @(state), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIButton *(^)(NSString *))jtitle
{
    return ^(NSString *title){
        [self setTitle:title forState:[self getUIControlState]];
        return self;
    };
}

- (UIButton *(^)(id))jtitleColor
{
    return ^(id color){
        [self setTitleColor:[UIColor jf_colorByMultiple:color] forState:[self getUIControlState]];
        return self;
    };
}

- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))jtitleRect
{
    return ^(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [JFMethod exchangeImplementationWithClass:[self class] beforeImplementation:@selector(titleRectForContentRect:) afterInstanceMethod:@selector(jf_titleRectForContentRect:)];
        });

        CGRect rect = CGRectMake(x, y, w, h);
        objc_setAssociatedObject(self, kJFButtonTitleRect, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))jimageRect
{
    return ^(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [JFMethod exchangeImplementationWithClass:[self class] beforeImplementation:@selector(imageRectForContentRect:) afterInstanceMethod:@selector(jf_imageRectForContentRect:)];
        });
        CGRect rect = CGRectMake(x, y, w, h);
        objc_setAssociatedObject(self, kJFButtonImageRect, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIButton *(^)(id))jfont
{
    return ^(id font){
        [self.titleLabel setFont:[UIFont jf_fontByMultiple:font]];
        return self;
    };
}

- (UIButton *(^)(id))jimage
{
    return ^(id image){
        [self setImage:[UIImage jf_imageByMultiple:image] forState:[self getUIControlState]];
        return self;
    };
}

- (UIButton *(^)(id))jbackgroundImage
{
    return ^(id backgroundImage){
        [self setBackgroundImage:[UIImage jf_imageByMultiple:backgroundImage] forState:[self getUIControlState]];
        return self;
    };
}

- (UIButton *(^)(UIControlEvents))jevent
{
    return ^(UIControlEvents event){
        objc_setAssociatedObject(self, kJFButtonEvent, @(event), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIButton *(^)(void(^)(UIButton *)))jaction
{
    return ^(void(^block)(UIButton *)){
        if (block) {
            objc_setAssociatedObject(self, kJFButtonAction, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
            [self addTarget:self action:@selector(buttonAction) forControlEvents:[self getUIControlEvents]];
        }
        else NSAssert(NO, @"必须给action赋值！");
        return self;
    };
}

- (UIButton *(^)(BOOL))jenabled
{
    return ^(BOOL enabled){
        self.enabled = enabled;
        return self;
    };
}

#pragma mark - private method

- (CGRect)jf_titleRectForContentRect:(CGRect)contentRect{
    
    NSValue *value = objc_getAssociatedObject(self, kJFButtonTitleRect);
    if (!value) return [self jf_titleRectForContentRect:contentRect];
    return [value CGRectValue];
}

- (CGRect)jf_imageRectForContentRect:(CGRect)contentRect{
    
    NSValue *value = objc_getAssociatedObject(self, kJFButtonImageRect);
    if (!value) return [self jf_imageRectForContentRect:contentRect];
    return [value CGRectValue];
}

- (void)buttonAction
{
    void (^actionBlock)(UIButton *) = objc_getAssociatedObject(self, kJFButtonAction);
    actionBlock(self);
}

- (UIControlState)getUIControlState
{
    NSNumber *state = objc_getAssociatedObject(self, kJFButtonState);
    if (!state) {
        NSAssert(NO, @"设置状态属性前必须先设置UIControlState状态！");
    }
    return state.unsignedIntegerValue;
}

- (UIControlEvents)getUIControlEvents
{
    NSNumber *state = objc_getAssociatedObject(self, kJFButtonEvent);
    if (!state) {
        NSAssert(NO, @"添加方法前必须先设置UIControlEvents状态！");
    }
    return state.unsignedIntegerValue;
}

@end

@implementation UIButton (JFCustomExtension)

- (UIButton *(^)(void))jstateNormal
{
    return ^(void){
        self.jstate(UIControlStateNormal);
        return self;
    };
}

- (UIButton *(^)(void))jstateHighlighted
{
    return ^(void){
        self.jstate(UIControlStateHighlighted);
        return self;
    };
}

- (UIButton *(^)(void))jstateDisabled
{
    return ^(void){
        self.jstate(UIControlStateDisabled);
        return self;
    };
}

- (UIButton *(^)(void))jstateSelected
{
    return ^(void){
        self.jstate(UIControlStateSelected);
        return self;
    };
}

- (UIButton *(^)(void))jeventTouchUpInside
{
    return ^(void){
        self.jevent(UIControlEventTouchUpInside);
        return self;
    };
}

- (UIButton *(^)(void))jeventTouchDown
{
    return ^(void){
        self.jevent(UIControlEventTouchDown);
        return self;
    };
}

- (UIButton *(^)(void))jeventTouchDragExit
{
    return ^(void){
        self.jevent(UIControlEventTouchDragExit);
        return self;
    };
}

- (UIButton *(^)(void))jeventTouchCancel
{
    return ^(void){
        self.jevent(UIControlEventTouchCancel);
        return self;
    };
}

@end
