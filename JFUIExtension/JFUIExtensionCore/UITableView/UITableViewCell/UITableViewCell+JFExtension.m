//
//  UITableViewCell+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/13.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableViewCell+JFExtension.h"
#import "UIImage+JFExtension.h"

@implementation UITableViewCell (JFExtension)

- (UITableViewCell *(^)(NSString *))jtext
{
    return ^(NSString *text){
        self.textLabel.text = text;
        return self;
    };
}

- (UITableViewCell *(^)(NSString *))jdetailText
{
    return ^(NSString *text){
        self.detailTextLabel.text = text;
        return self;
    };
}

- (UITableViewCell *(^)(id))jimage
{
    return ^(id imageSrc){
        self.imageView.image = [UIImage jf_imageByMultiple:imageSrc];
        return self;
    };
}

- (UITableViewCell *(^)(UITableViewCellSelectionStyle))jselectionStyle
{
    return ^(UITableViewCellSelectionStyle style){
        self.selectionStyle = style;
        return self;
    };
}

- (UITableViewCell *(^)(UIView *))jselectedBackgroundView
{
    return ^(UIView *backgroundView){
        self.selectedBackgroundView = backgroundView;
        return self;
    };
}

- (UITableViewCell *(^)(UIView *(^)(void)))jselectedBackgroundViewConstructor
{
    return ^(UIView *(^block)(void)){
        if (block) {
            self.selectedBackgroundView = block();
        }
        else NSAssert(NO, @"block不能为空！");
        return self;
    };
}

@end

@implementation UITableViewCell (JFCustomExtension)

- (UITableViewCell *(^)(void))jselectionStyleNone
{
    return ^(){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        return self;
    };
}

- (UITableViewCell *(^)(void))jselectionStyleBlue
{
    return ^(){
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        return self;
    };
}

- (UITableViewCell *(^)(void))jselectionStyleGray
{
    return ^(){
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        return self;
    };
}

- (UITableViewCell *(^)(void))jselectionStyleDefault
{
    return ^(){
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        return self;
    };
}

@end
