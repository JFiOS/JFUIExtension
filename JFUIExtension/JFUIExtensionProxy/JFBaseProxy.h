//
//  JFProxyBase.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFBlockInvocation.h"

@interface JFBaseProxy : NSObject

@property (nonatomic, strong) NSMutableSet *extraProxyMethodSet;

@property (nonatomic, strong) id proxyObject;

+ (instancetype)proxy;

- (JFBaseProxy *(^)(NSObject *))jextraProxy;

- (void)addProxyMethod:(SEL)sel implementationBlock:(id)implementationBlock;

@end
