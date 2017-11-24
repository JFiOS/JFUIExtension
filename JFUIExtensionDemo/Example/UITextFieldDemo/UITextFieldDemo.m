//
//  UITextFieldDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITextFieldDemo.h"
#import "JFUIViewExtension.h"
#import "JFUITextFieldExtension.h"

@interface UITextFieldDemo ()<UITextFieldDelegate>

@end

@implementation UITextFieldDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0xFFFFFF);

    // 提醒： 所有的代理方法，方法返回类型与返回值类型必须完全匹配
    // 提醒2：注意循环引用
    
    UITextField
    .jnew()
    .jframe(0,100,self.view.frame.size.width,100)
    .jbackgroundColor([UIColor grayColor])
    .jtextColor(@0x00FF00)
    .jfont(@20)
    .jtextAlignment(NSTextAlignmentCenter)
    .jsuperView(self.view)
    .jplaceholder(@"请输入文字。。。")
    .jdelegateTrusteeship(^(JFTextFieldProxy *textFieldProxy){
        textFieldProxy
        .jshouldBeginEditing(^(UITextField *textField){
            return YES;
        })
        .jshouldChangeCharactersInRange(^BOOL(UITextField *textField,NSString *replacementString){
            return YES;
        });
    });
}

@end
