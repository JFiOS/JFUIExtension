//
//  UIViewDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIViewDemo.h"
#import "JFUIViewExtension.h"

@interface UIViewDemo ()

@end

@implementation UIViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0xFFFFFF);
    
    UIView
    .jnew()
    .jbackgroundColor(@0xFF0000)
    .jframe(10,100,100,100)
    .jcornerRadius(50)
    .jsuperView(self.view);
    
    UIView
    .jnew()
    .jbackgroundColor(@0xFF0000)
    .jframe(150,200,100,100)
    .jborderWidth(10)
    .jborderColor(@0x0000FF)
    .jsuperView(self.view);
    
    UIView
    .jnew()
    .jbackgroundColor(@0xFF0000)
    .jframe(150,400,100,100)
    .jsuperView(self.view)
    .jsubView(@[
                UIView.jnew().jbackgroundColor(@0).jframe(0,0,10,10),
                UIView.jnew().jbackgroundColor(@0x00FF00).jframe(20,20,10,10),
                UIView.jnew().jbackgroundColor(@0xFF).jframe(40,40,10,10)
                ]);
}

@end
