//
//  UIView+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIView+JFExtension.h"
#import "UIColor+JFExtension.h"

@implementation UIView (JFExtension)

+ (UIView *(^)(void))jnew
{
    return ^(void){
        return [[self alloc] init];
    };
}

- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))jframe
{
    return ^(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
        self.frame = CGRectMake(x, y, w, h);
        return self;
    };
}

- (UIView *(^)(id))jbackgroundColor
{
    return ^(id color){
        self.backgroundColor = [UIColor jf_colorByMultiple:color];
        return self;
    };
}

- (UIView *(^)(CGFloat))jalpha
{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UIView *(^)(CGFloat))jcornerRadius
{
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

- (UIView *(^)(BOOL))jmasksToBounds
{
    return ^(BOOL masksToBounds){
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (UIView *(^)(id))jborderColor
{
    return ^(id color){
        self.layer.borderColor = [UIColor jf_colorByMultiple:color].CGColor;
        return self;
    };
}

- (UIView *(^)(CGFloat))jborderWidth
{
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIView *(^)(UIView *))jsuperView
{
    return ^(UIView *superView){
        [superView addSubview:self];
        return self;
    };
}

- (UIView *(^)(NSInteger))jtag
{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (UIView *(^)(BOOL))juserInteractionEnabled
{
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (UIView *(^)(id))jsubView
{
    return ^(id subView){
        if ([subView isKindOfClass:[NSArray class]]) {
            NSArray *subViews = (NSArray *)subView;
            for (NSInteger i = 0; i < subViews.count; i++) {
                id view = subViews[i];
                if ([view isKindOfClass:[UIView class]]) {
                    [self addSubview:view];
                }
                else {
                    NSAssert(NO, @"对象：%@ 不是标准视图！",subView);
                }
            }
        }
        else if([subView isKindOfClass:[UIView class]]){
            [self addSubview:subView];
        }
        else {
            NSAssert(NO, @"对象：%@ 不是标准视图！",subView);
        }
        return self;
    };
}

- (UIView *(^)(BOOL))jhidden
{
    return ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}

- (UIView *(^)(NSString *, NSObject *))jkvc
{
    return ^(NSString *key, NSObject *obj){
        [self setValue:obj forKey:key];
        return self;
    };
}

- (UIView *(^)(NSString *, id(^)(void)))jkvcConstructor
{
    return ^(NSString *key, id(^block)(void)){
        if (block) {
            id obj = block();
            if (obj) {
                [self setValue:obj forKeyPath:key];
            }
            else {
        //        NSLog(@"obj is nil");
            }
        }
        return self;
    };
}

@end
