//
//  JFMethodDescription.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/17.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFMethod : NSObject

@property (nonatomic, readonly, assign) IMP implementation;
@property (nonatomic, readonly, assign) SEL name;
@property (nonatomic, readonly, assign) char *types;
@property (nonatomic, readonly, assign) Class cls;
@property (nonatomic, readonly, copy) NSString *nameObjc;
@property (nonatomic, readonly, copy) NSString *typesObjc;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(SEL)name implementationBlock:(id)block;

+ (instancetype)methodWithName:(SEL)name implementationBlock:(id)block;

- (instancetype)initWithSystemName:(SEL)systemName class:(Class)cls;

+ (instancetype)methodWithSystemName:(SEL)systemName class:(Class)cls;

- (void)replaceImplementationWithBlock:(id)implementationBlock;

+ (void)exchangeImplementationWithClass:(Class)cls beforeImplementation:(SEL)beforeInstanceMethod afterInstanceMethod:(SEL)afterInstanceMethod;

+ (BOOL)methodBeIncluded:(SEL)name inProtocol:(NSString *)procotolName requireMethodList:(NSArray<NSString *> *)list;

@end
