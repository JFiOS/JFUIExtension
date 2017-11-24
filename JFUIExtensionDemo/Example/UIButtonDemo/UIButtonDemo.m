//
//  UIButtonDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UIButtonDemo.h"
#import "JFUIViewExtension.h"
#import "JFUIButtonExtension.h"

@interface UIButtonDemo ()

@end

@implementation UIButtonDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0XFFFFFF);
    
    UIButton
    .jnew()
    .jframe(100,100,200,50)
    .jstateNormal()
    .jtitle(@"test")
    .jtitleColor([UIColor redColor])
    .jbackgroundColor([UIColor whiteColor])
    .jimage(@"13")
    .jstateHighlighted()
    .jtitle(@"Light")
    .jeventTouchUpInside()
    .jaction(^(UIButton *button){
        button.jselected(!button.selected);
    })
    .jstateSelected()
    .jtitle(@"selector")
    .jtitleRect(0,0,50,50)
    .jimageRect(60,0,50,50)
    .jfont(@13)
    .jborderColor(@0x00FF00)
    .jborderWidth(1)
    .jcornerRadius(25)
    .jsuperView(self.view);
}



@end
