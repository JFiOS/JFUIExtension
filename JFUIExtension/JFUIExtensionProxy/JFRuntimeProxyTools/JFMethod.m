//
//  JFMethodDescription.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/17.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFMethod.h"
#import <objc/runtime.h>

@implementation JFMethod

- (instancetype)initWithName:(SEL)name implementationBlock:(id)block
{
    if (self = [super init]) {
        _name = name;
        _nameObjc = NSStringFromSelector(name);
        _implementation = imp_implementationWithBlock(block);
    }
    return self;
}

+ (instancetype)methodWithName:(SEL)name implementationBlock:(id)block
{
    return [[self alloc] initWithName:name implementationBlock:block];
}

- (instancetype)initWithSystemName:(SEL)systemName class:(Class)cls
{
    if (self = [super init]) {
        _name = systemName;
        _nameObjc = NSStringFromSelector(systemName);
        _cls = cls;
        _implementation = method_getImplementation(class_getInstanceMethod(cls, systemName));
    }
    return self;
}

+ (instancetype)methodWithSystemName:(SEL)systemName class:(Class)cls
{
    return [[self alloc] initWithSystemName:systemName class:cls];
}

- (void)replaceImplementationWithBlock:(id)implementationBlock
{
    Method method = class_getInstanceMethod(self.cls, self.name);
    method_setImplementation(method, imp_implementationWithBlock(implementationBlock));
}

+ (void)exchangeImplementationWithClass:(Class)cls beforeImplementation:(SEL)beforeInstanceMethod afterInstanceMethod:(SEL)afterInstanceMethod
{
    Method beforeImageInstance = class_getInstanceMethod(cls, beforeInstanceMethod);
    
    Method afterImageInstance = class_getInstanceMethod(cls, afterInstanceMethod);
    
    method_exchangeImplementations(beforeImageInstance, afterImageInstance);
}

+ (BOOL)methodBeIncluded:(SEL)name inProtocol:(NSString *)procotolName requireMethodList:(NSArray<NSString *> *)list
{
    struct objc_method_description description;
    description = protocol_getMethodDescription(NSProtocolFromString(procotolName), name, [list containsObject:NSStringFromSelector(name)], YES);
    if (!NSStringFromSelector(description.name)) return NO;
    return YES;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",_nameObjc];
}

#pragma mark - get set

- (void)setName:(SEL)name
{
    _name = name;
    _nameObjc = NSStringFromSelector(name);
}

- (void)setTypes:(char *)types
{
    _types = types;
    
    _typesObjc = [NSString stringWithFormat:@"%s",types];
}

@end
