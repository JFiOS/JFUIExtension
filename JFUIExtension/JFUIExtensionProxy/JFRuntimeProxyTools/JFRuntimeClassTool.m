//
//  JFRuntimeClassTool.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/17.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFRuntimeClassTool.h"
#import "JFMethod.h"
#import <objc/runtime.h>

@implementation JFRuntimeClassTool

- (instancetype)initWithClassName:(NSString *)clsName
{
    if (self = [super init]) {
        _cls = objc_allocateClassPair([NSObject class], clsName.UTF8String, 0);
    }
    return self;
}

- (void)classAddProtocols:(NSArray<NSString *> *)protocolNames
{
    if (!protocolNames || !_cls) return;
    
    for (NSInteger i = 0; i < protocolNames.count; i++) {
        Protocol *protocol = objc_getProtocol(protocolNames[i].UTF8String);
        class_addProtocol(_cls, protocol);
    }
    _protocols = protocolNames;
}

- (void)classAddMethod:(JFMethod *)method
{
    if (!_cls || !method || ![method isKindOfClass:[JFMethod class]]) return;
    // 经测试系统方法可以忽略types
    class_addMethod(_cls, method.name, method.implementation, "");
}

- (id)getInstance
{
    if (!_cls) return nil;
    return [[self.cls alloc] init];
}

@end
