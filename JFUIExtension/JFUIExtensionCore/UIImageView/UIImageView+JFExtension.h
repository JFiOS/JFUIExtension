//
//  UIImageView+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/11.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JFExtension)

- (UIImageView *(^)(id))jimage;

/**
 * `jimage`构造器模式
 * 可以用 SDWebImage 等来赋值 image，回传递imageView 本身
 */
- (UIImageView *(^)(void(^)(UIImageView *)))jimageConstructor;

/**
 * 设置一个 `mask` 形状的 image,通常用于即时通讯的聊天气泡
 * 第一个参数是 contentsCenter ,可以在`CALayer`中查看这个属性
 * 第二个是 mask 的图片，也就是形状的图
 * 第三个是效果图片
 */
- (UIImageView *(^)(CGRect,id,id))jmaskImage;

@end
