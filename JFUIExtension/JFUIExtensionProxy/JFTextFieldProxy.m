//
//  JFTextFieldProxy.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/23.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFTextFieldProxy.h"

@implementation JFTextFieldProxy

- (JFTextFieldProxy *(^)(id))jshouldBeginEditing
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldShouldBeginEditing:) implementationBlock:^(id target, UITextField *textField){
                int *intPtr = invokeBlock(block, @[textField]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTextFieldProxy *(^)(id))jdidBeginEditing
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldDidBeginEditing:) implementationBlock:^(id target, UITextField *textField){
                invokeBlock(block, @[textField]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTextFieldProxy *(^)(id))jshouldEndEditing
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldShouldEndEditing:) implementationBlock:^(id target, UITextField *textField){
                int *intPtr = invokeBlock(block, @[textField]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}


- (JFTextFieldProxy *(^)(id))jdidEndEditing
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldDidEndEditing:) implementationBlock:^(id target, UITextField *textField){
                invokeBlock(block, @[textField]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTextFieldProxy *(^)(id))jshouldChangeCharactersInRange
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textField:shouldChangeCharactersInRange:replacementString:) implementationBlock:^(id target, UITextField *textField,NSRange range, NSString *replacementString){
                int *intPtr = invokeBlock(block, @[textField,[NSValue valueWithRange:range],replacementString]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTextFieldProxy *(^)(id))jshouldClear
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldShouldClear:) implementationBlock:^(id target, UITextField *textField){
                int *intPtr = invokeBlock(block, @[textField]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTextFieldProxy *(^)(id))jshouldReturn
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(textFieldShouldReturn:) implementationBlock:^(id target, UITextField *textField){
                int *intPtr = invokeBlock(block, @[textField]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - overwrite

- (NSDictionary<NSString *,NSArray<NSString *> *> *)requierMethodMap
{
    return @{
             @"UITextFieldDelegate":@[],
             };
}


@end
