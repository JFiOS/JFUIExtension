//
//  UICollectionViewDemoCell.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewDemoCell.h"
#import "JFUILabelExtension.h"

@interface UICollectionViewDemoCell ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation UICollectionViewDemoCell

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
    .jfont(@13)
    .jtextAlignmentCenter()
    .jsuperView(self.contentView);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.jframe(0,10,40,20);
}

#pragma mark - get set

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.jtext(text);
}

@end
