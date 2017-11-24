//
//  UICollectionViewDemoHeaderView.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewDemoHeaderView.h"
#import "JFUILabelExtension.h"

@interface UICollectionViewDemoHeaderView ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation UICollectionViewDemoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUpView];
    }
    
    return self;
}

- (void)setUpView
{
    self.textLabel =
    UILabel
    .jnew()
    .jtextColor(@0)
    .jfont(@20)
    .jtextAlignmentCenter()
    .jsuperView(self);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.jframe(10,10,self.frame.size.width,20);
}

#pragma mark - get set

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.jtext(text);
}

@end
