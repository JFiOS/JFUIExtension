//
//  UItableViewDemoCell.h
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITableViewCellModel;
@interface UITableViewDemoCell : UITableViewCell

@property (nonatomic, strong) UITableViewCellModel *model;
@property (nonatomic, copy) void(^block)(void);

@end
