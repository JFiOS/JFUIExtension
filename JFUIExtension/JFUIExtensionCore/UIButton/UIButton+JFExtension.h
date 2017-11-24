//
//  UIButton+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/12.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JFExtension)

- (UIButton *(^)(BOOL))jselected;

/**
 * UIControlState
 * 设置当前的 UIControlState 必须先调用这个方法设置 state 之后才能继续设置这个状态下的属性，如图片，文字等，如果要设置别的状态，则继续调用这个方法先设置成别的状态再设置该状态下的属性
 */
- (UIButton *(^)(UIControlState))jstate;

- (UIButton *(^)(NSString *))jtitle;

/**
 * titleColor
 * 可以传 NSNumber 类似 @0x1FF002 也可以直接传颜色
 */
- (UIButton *(^)(id))jtitleColor;

/**
 * title在button里所在的位置
 */
- (UIButton *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jtitleRect;

/**
 * font
 * 可以传 NSNumber 类似 @12 也可以直接传NSFont
 */
- (UIButton *(^)(id))jfont;

/**
 * image
 * 可以传image的名字（有缓存），也可以传图片
 */
- (UIButton *(^)(id))jimage;

/**
 * image在button里所在的位置
 */
- (UIButton *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jimageRect;

- (UIButton *(^)(id))jbackgroundImage;

/**
 * UIControlEvents
 * 同 `jstate`,设置`jaction`必须先调用这个方法设置 event 之后才能继续设置这个状态下的action
 */
- (UIButton *(^)(UIControlEvents))jevent;

/**
 * Button的触发行为，需要先设置`jevent`
 */
- (UIButton *(^)(void(^)(UIButton *)))jaction;

- (UIButton *(^)(BOOL))jenabled;

@end

// 方便易用的扩展 
@interface UIButton (JFCustomExtension)

- (UIButton *(^)(void))jstateNormal;

- (UIButton *(^)(void))jstateHighlighted;

- (UIButton *(^)(void))jstateDisabled;

- (UIButton *(^)(void))jstateSelected;

- (UIButton *(^)(void))jeventTouchUpInside;

- (UIButton *(^)(void))jeventTouchDown;

- (UIButton *(^)(void))jeventTouchDragExit;

- (UIButton *(^)(void))jeventTouchCancel;

@end

