//
//  UILabel+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/12.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UILabel+JFExtension.h"
#import "UIColor+JFExtension.h"
#import "UIFont+JFExtension.h"

@implementation UILabel (JFExtension)

- (UILabel *(^)(NSString *))jtext
{
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *))jattributedText
{
    return ^(NSAttributedString * text){
        self.attributedText = text;
        return self;
    };
}

- (UILabel *(^)(id))jtextColor
{
    return ^(id color){
        self.textColor = [UIColor jf_colorByMultiple:color];
        return self;
    };
}

- (UILabel *(^)(id))jfont
{
    return ^(id font){
        self.font = [UIFont jf_fontByMultiple:font];
        return self;
    };
}

- (UILabel *(^)(NSInteger))jnumberOfLines
{
    return ^(NSInteger number){
        self.numberOfLines = number;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))jtextAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(BOOL))jenabled
{
    return ^(BOOL enabled){
        self.enabled = enabled;
        return self;
    };
}

@end

@implementation UILabel (JFCustomExtension)

- (UILabel *(^)(void))jtextAlignmentLeft
{
    return ^(void){
        self.jtextAlignment(NSTextAlignmentLeft);
        return self;
    };
}

- (UILabel *(^)(void))jtextAlignmentRight
{
    return ^(void){
        self.jtextAlignment(NSTextAlignmentRight);
        return self;
    };
}

- (UILabel *(^)(void))jtextAlignmentCenter
{
    return ^(void){
        self.jtextAlignment(NSTextAlignmentCenter);
        return self;
    };
}

- (UILabel *(^)(NSString *))jtextUnderline
{
    return ^(NSString *text){
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
        self.jattributedText(attribtStr);
        return self;
    };
}

- (UILabel *(^)(NSString *))jtextStrikethrough
{
    return ^(NSString *text){
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleThick]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
        self.jattributedText(attribtStr);
        return self;
    };
}

@end
