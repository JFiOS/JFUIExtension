//
//  JFBlockInvocation.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFBlockInvocation.h"
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIGeometry.h>

struct JFBlock {
    void *isa;
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct block_descriptor {
        unsigned long int reserved;
        unsigned long int size;
        void (*copy_helper)(void *dst, void *src);
        void (*dispose_helper)(void *src);
        const char *signature;
    } *descriptor;
};

enum {
    CTBlockDescriptionFlagsHasCopyDispose = (1 << 25),
    CTBlockDescriptionFlagsHasCtor = (1 << 26),
    CTBlockDescriptionFlagsIsGlobal = (1 << 28),
    CTBlockDescriptionFlagsHasStret = (1 << 29),
    CTBlockDescriptionFlagsHasSignature = (1 << 30)
};

@interface JFBlockDescription : NSObject

@property (nonatomic, readonly) NSMethodSignature *blockSignature;
@property (nonatomic, readonly) id block;

- (instancetype)initWithBlock:(id)block;

@end

@implementation JFBlockDescription

- (id)initWithBlock:(id)block
{
    if (self = [super init]) {
        _block = block;
        
        struct JFBlock *blockRef = (__bridge struct JFBlock *)block;
        int flags = blockRef->flags;
        
        if (flags & CTBlockDescriptionFlagsHasSignature) {
            void *signatureLocation = blockRef->descriptor;
            signatureLocation += sizeof(unsigned long int);
            signatureLocation += sizeof(unsigned long int);
            
            if (flags & CTBlockDescriptionFlagsHasCopyDispose) {
                signatureLocation += sizeof(void(*)(void *dst, void *src));
                signatureLocation += sizeof(void (*)(void *src));
            }
            
            const char *signature = (*(const char **)signatureLocation);
            _blockSignature = [NSMethodSignature signatureWithObjCTypes:signature];
        }
    }
    return self;
}

@end

static NSDictionary *reviseKeyMap = nil;
static NSArray *reviseNSStringKeys = nil;

@implementation JFBlockInvocation
// 将 NSNumber 和 NSValue 转成 void *
static inline void *convertObjectToBuffer(id obj)
{
    void *ptr = NULL;
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)obj;
        const char * pObjCType = [number objCType];
        if (strcmp(pObjCType, @encode(NSInteger))  == 0) {
            NSInteger *intPtr = malloc(sizeof(NSInteger));
            *intPtr = [number integerValue];
            ptr = intPtr;
        }
        else if (strcmp(pObjCType, @encode(CGFloat)) == 0) {
            CGFloat *floatPtr = malloc(sizeof(CGFloat));
            *floatPtr = [number floatValue];
            ptr = floatPtr;
        }
        else if (strcmp(pObjCType, @encode(BOOL)) == 0) {
            BOOL *boolPtr = malloc(sizeof(BOOL));
            *boolPtr = [number boolValue];
            ptr = boolPtr;
        }
    }
    else if ([obj isKindOfClass:[NSValue class]]) {
        NSValue *value = (NSValue *)obj;
        const char * pObjCType = [value objCType];
        if (strcmp(pObjCType, @encode(NSRange))  == 0) {
            NSRange *rangePtr = malloc(sizeof(NSInteger));
            *rangePtr = [value rangeValue];
            ptr = rangePtr;
        }
    }
    return ptr;
}

// 处理返回值指针，因为栈上的内存地址不能返回，所以需要开辟内存
static inline void *handleReturnValuePtr(const char *type)
{
    void *ptr = NULL;
    
    if (strcmp(type, @encode(NSInteger))  == 0) {
        ptr = malloc(sizeof(NSInteger));
    }
    else if (strcmp(type, @encode(CGFloat))  == 0) {
        ptr = malloc(sizeof(CGFloat));
    }
    else if (strcmp(type, @encode(BOOL))  == 0) {
        ptr = malloc(sizeof(BOOL));
    }
    else if (strcmp(type, @encode(int))  == 0) {
        ptr = malloc(sizeof(int));
    }
    else if (strcmp(type, @encode(CGSize))  == 0) {
        ptr = malloc(sizeof(CGSize));
    }
    else if(strcmp(type, @encode(CGPoint))  == 0){
        ptr = malloc(sizeof(CGPoint));
    }
    else if(strcmp(type, @encode(CGRect))  == 0){
        ptr = malloc(sizeof(CGRect));
    }
    else if(strcmp(type, @encode(UIEdgeInsets))  == 0){
        ptr = malloc(sizeof(UIEdgeInsets));
    }

    return ptr;
}
// 替换真实类型
static inline NSString *reviseMapKey(NSString *keySrc)
{
    if (!reviseKeyMap) {
        reviseKeyMap = @{
                         @"UICollectionViewLayout":@"UICollectionViewFlowLayout",
                         @"q":@"__NSCFNumber"
                         };
    }
    
    keySrc = [keySrc stringByReplacingOccurrencesOfString:@"@" withString:@""];
    keySrc = [keySrc stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString *realKey = reviseKeyMap[keySrc];
    
    return realKey ? realKey : keySrc;
}
// 查找真实的 NSString 类型
static inline NSString *reviseNSStringMapKey(NSString *keySrc,NSDictionary *map)
{
    if (!reviseNSStringKeys) {
        reviseNSStringKeys = @[@"__NSCFConstantString",@"NSTaggedPointerString"];
    }
    
    for (NSInteger i = 0; i < reviseNSStringKeys.count; i++) {
        NSString *key = reviseNSStringKeys[i];
        if (map[key]) return key;
    }
    
//    NSLog(@"未知的 String 类型");
    abort();
    
    return NULL;
}

// 处理参数，使其与函数签名参数一致
static inline NSArray *handleArguments(NSArray *arguments,NSMethodSignature *methodSignature)
{
    NSUInteger argumentsCount = methodSignature.numberOfArguments;
    
    if (argumentsCount == 1) return nil;
    if ((arguments.count + 1) == argumentsCount) return arguments;
    
    NSMutableDictionary *argumentsMap = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < arguments.count; i++) {
        id argument = arguments[i];
        NSString *key = NSStringFromClass([argument class]);
        argumentsMap[key] = argument;
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 1; i < argumentsCount; i++) {
        NSString *typeKey = [NSString stringWithFormat:@"%s",[methodSignature getArgumentTypeAtIndex:i]];
        NSString *key = reviseMapKey(typeKey);
        if (!argumentsMap[key]) key = reviseNSStringMapKey(key,argumentsMap);
        [tempArray addObject:argumentsMap[key]];
    }
    return [tempArray copy];
}

void *invokeBlock(id block,NSArray *arguments)
{
    // 获取 block 的函数签名
    JFBlockDescription *blockDesc = [[JFBlockDescription alloc] initWithBlock:block];
    NSMethodSignature *methodSignature = blockDesc.blockSignature;
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:[block copy]];

    NSUInteger argumentsCount = methodSignature.numberOfArguments;
    
    NSArray *realArguments = handleArguments(arguments, methodSignature);

    for (NSInteger i = 0; i < realArguments.count; i++) {
        if (argumentsCount <= i+1) break;
        id argument = realArguments[i];
        if([argument isKindOfClass:[NSNull class]]) continue;
        BOOL isValue = [argument isKindOfClass:[NSNumber class]] || [argument isKindOfClass:[NSValue class]];
        void *buffer = isValue ? convertObjectToBuffer(argument) : &argument;
        [invocation setArgument:buffer atIndex:i+1];
        if (isValue) free(buffer);
    }
    
    [invocation invoke];

    void *returnValue = NULL;
    if (methodSignature.methodReturnLength > 0) {
        const char *type = [methodSignature methodReturnType];
        returnValue = handleReturnValuePtr(type);
        [invocation getReturnValue:returnValue ? returnValue : &returnValue];
    }
   
    return returnValue;
}

@end
