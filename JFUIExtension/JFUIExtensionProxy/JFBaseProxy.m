//
//  JFProxyBase.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFBaseProxy.h"
#import <objc/runtime.h>
#import "JFRuntimeClassTool.h"
#import "JFMethod.h"

@interface JFBaseProxy ()

@property (nonatomic, strong) JFRuntimeClassTool *classTool;

@end

@implementation JFBaseProxy

- (instancetype)init
{
    self = [super init];
    if (self) {
        _classTool = [[JFRuntimeClassTool alloc] initWithClassName:@"ProxyClass"];
    }
    return self;
}

+ (instancetype)proxy
{
    return [[self alloc] init];
}

- (JFBaseProxy *(^)(NSObject *))jextraProxy
{
    return ^(NSObject *target){
        if (target) {
            [self fetchExtraProxyMethodWithExtraTarget:target];
            [self handleExtraProxyMethodWithExtraTarget:target];
        }
        return self;
    };
}

- (void)addProxyMethod:(SEL)sel implementationBlock:(id)implementationBlock
{
    JFMethod *method = [JFMethod methodWithName:sel implementationBlock:implementationBlock];
    
    [self.classTool classAddMethod:method];
}

- (void)handleExtraProxyMethodWithExtraTarget:(NSObject *)extraTarget
{
    // 重写forwardingTargetForSelector方法
    typedef NSObject *(*forwardingIMP)(id,SEL,...);
    SEL forwardingSel = @selector(forwardingTargetForSelector:);
    JFMethod *forwardingMethod = [JFMethod methodWithSystemName:forwardingSel class:self.classTool.cls];
    forwardingIMP forwardingImp = (forwardingIMP)forwardingMethod.implementation;
    __weak typeof(extraTarget) weakTarget = extraTarget;
    [forwardingMethod replaceImplementationWithBlock:^(id target, SEL sel){
        __strong typeof(weakTarget) strongTarget = weakTarget;
        if ([self.extraProxyMethodSet containsObject:NSStringFromSelector(sel)])
            return strongTarget;
        return forwardingImp(target,forwardingSel,sel);
    }];
    
    // 重写respondsToSelector方法
    typedef BOOL(*respondsIMP)(id,SEL,...);
    SEL respondsSel = @selector(respondsToSelector:);
    JFMethod *respondsMethod = [JFMethod methodWithSystemName:respondsSel class:self.classTool.cls];
    respondsIMP respondsImp = (respondsIMP)respondsMethod.implementation;
    [respondsMethod replaceImplementationWithBlock:^(id target, SEL sel){
        if ([self.extraProxyMethodSet containsObject:NSStringFromSelector(sel)])
            return YES;
        return respondsImp(target,respondsSel,sel);
    }];
}

- (void)fetchExtraProxyMethodWithExtraTarget:(NSObject *)extraTarget
{
    // 获取其他代理中的代理部分的方法
    unsigned int count;
    Method *methodList = class_copyMethodList([extraTarget class], &count);
    NSDictionary *methodMap = [self requierMethodMap];
    NSArray *mapKeys = [methodMap allKeys];
    for (NSInteger i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        for (NSInteger j = 0; j < mapKeys.count; j++) {
            BOOL isContains = [JFMethod methodBeIncluded:sel inProtocol:mapKeys[j] requireMethodList:methodMap[mapKeys[j]]];
            if (isContains) {
                [self.extraProxyMethodSet addObject:NSStringFromSelector(sel)];
                break;
            }
        }
    }
    free(methodList);
}

- (NSDictionary *)requierMethodMap
{
    NSAssert(NO, @"子类必须重写父类的`requierMethodMap`方法");
    return nil;
}

#pragma mark - get set

- (id)proxyObject
{
    if (!_proxyObject) {
        _proxyObject = [_classTool getInstance];
    }
    return _proxyObject;
}

- (NSMutableSet *)extraProxyMethodSet
{
    if (!_extraProxyMethodSet) {
        _extraProxyMethodSet = [NSMutableSet set];
    }
    return _extraProxyMethodSet;
}

@end
