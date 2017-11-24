//
//  UILabelDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UILabelDemo.h"
#import "JFUIViewExtension.h"
#import "JFUILabelExtension.h"

@interface UILabelDemo ()

@end

@implementation UILabelDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0xFFFFFF);
    
    UILabel
    .jnew()
    .jframe(0,100,self.view.frame.size.width,100)
    .jtextColor(@0x00FF00)
    .jfont(@20)
    .jtextUnderline(@"Label1")
    .jtextAlignmentCenter()
    .jsuperView(self.view);
    
    UILabel
    .jnew()
    .jframe(0,200,self.view.frame.size.width,100)
    .jtextColor(@0x00FF00)
    .jfont(@20)
    .jtextStrikethrough(@"Label2")
    .jtextAlignmentLeft()
    .jsuperView(self.view);
    
    UILabel
    .jnew()
    .jframe(0,300,self.view.frame.size.width,100)
    .jtextColor(@0x00FF00)
    .jfont(@20)
    .jtext(@"Label3")
    .jtextAlignmentRight()
    .jsuperView(self.view);
}



@end
