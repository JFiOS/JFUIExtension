//
//  UIImageViewDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIImageViewDemo.h"
#import "JFUIViewExtension.h"
#import "JFUIImageViewExtension.h"

@interface UIImageViewDemo ()

@end

@implementation UIImageViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0XFFFFFF);
    
    UIImageView
    .jnew()
    .jframe(10,100,100,100)
    .jimage(@"13.png")
    .jsuperView(self.view);
    
    UIImageView
    .jnew()
    .jframe(150,250,100,100)
    .jmaskImage(CGRectMake(0.3, 0.7, 0, 0),@"right_bubble",@"13.png")
    .jsuperView(self.view);
}



@end
