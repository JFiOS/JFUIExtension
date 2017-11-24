//
//  UITableViewCellModel.h
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UITableViewCellModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, assign) NSString *age;
@property (nonatomic, assign) NSString *sex;
@property (nonatomic, copy) NSString *descriptionString;

@end
