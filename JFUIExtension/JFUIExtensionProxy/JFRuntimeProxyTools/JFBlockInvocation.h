//
//  JFBlockInvocation.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFBlockInvocation : NSObject

void *invokeBlock(id block,NSArray *arguments);

@end
