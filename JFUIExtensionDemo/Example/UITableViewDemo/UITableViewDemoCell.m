//
//  UItableViewDemoCell.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableViewDemoCell.h"
#import "JFUILabelExtension.h"
#import "JFUIImageViewExtension.h"
#import "JFUIButtonExtension.h"
#import "UITableViewCellModel.h"

@interface UITableViewDemoCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *sexLbael;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIButton *clickButton;

@end

@implementation UITableViewDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    self.nameLabel =
    UILabel
    .jnew()
    .jtextColor(@0)
    .jfont(@20)
    .jtextAlignmentLeft()
    .jsuperView(self.contentView);
    
    self.ageLabel =
    UILabel
    .jnew()
    .jtextColor(@0xFF0000)
    .jfont(@15)
    .jtextAlignmentLeft()
    .jsuperView(self.contentView);
    
    self.sexLbael =
    UILabel
    .jnew()
    .jtextColor(@0xFF)
    .jfont(@15)
    .jtextAlignmentLeft()
    .jsuperView(self.contentView);
    
    self.descriptionLabel =
    UILabel
    .jnew()
    .jtextColor(@0x000000)
    .jfont(@13)
    .jtextAlignmentLeft()
    .jsuperView(self.contentView);
    
    self.iconImageView =
    UIImageView
    .jnew()
    .jcornerRadius(25)
    .jmasksToBounds(YES)
    .jbackgroundColor(@0xFF0000)
    .jsuperView(self.contentView);
    
    self.clickButton =
    UIButton
    .jnew()
    .jstateNormal()
    .jtitle(@"点击")
    .jtitleColor([UIColor blackColor])
    .jbackgroundColor([UIColor redColor])
    .jfont(@13)
    .jeventTouchUpInside()
    .jaction(^(UIButton *button){
        !_block ? : _block();
    })
    .jsuperView(self.contentView);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = 20;
    self.iconImageView.jframe(10,10,50,50);
    self.nameLabel.jframe(70,10,100,h);
    self.ageLabel.jframe(70,35,30,h);
    self.sexLbael.jframe(100,35,30,h);
    self.descriptionLabel.jframe(10,CGRectGetMaxY(self.sexLbael.frame) + 10,self.frame.size.width - 20,h);
    self.clickButton.jframe(10,CGRectGetMaxY(self.descriptionLabel.frame) + 10,self.frame.size.width - 20,50);
}

#pragma mark - set get

- (void)setModel:(UITableViewCellModel *)model
{
    _model = model;
    
    self.nameLabel.jtext(model.name);
    self.ageLabel.jtext(model.age);
    self.sexLbael.jtext(model.sex);
    self.descriptionLabel.jtext(model.descriptionString);
    self.iconImageView.jimageConstructor(^(UIImageView *imageView){
        // 在这里用 SDWebImage 赋值
    });
}

@end
