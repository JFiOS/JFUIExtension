//
//  JFRuntimeClassTool.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/17.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JFMethod;
@interface JFRuntimeClassTool : NSObject

@property (nonatomic, readonly, assign) Class cls;
@property (nonatomic, readonly, copy) NSArray<NSString *> *protocols;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithClassName:(NSString *)clsName NS_DESIGNATED_INITIALIZER;

- (void)classAddProtocols:(NSArray<NSString *> *)protocolNames;

- (void)classAddMethod:(JFMethod *)method;

- (id)getInstance;

@end
