//
//  UILabel+JFExtension.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/12.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JFExtension)

- (UILabel *(^)(NSString *))jtext;

- (UILabel *(^)(NSAttributedString *))jattributedText;
/**
 * textColor
 * 可以传 NSNumber 类似 @0x1FF002 也可以直接传颜色
 */
- (UILabel *(^)(id))jtextColor;
/**
 * font
 * 可以传 NSNumber 类似 @12 也可以直接传NSFont
 */
- (UILabel *(^)(id))jfont;

- (UILabel *(^)(NSInteger))jnumberOfLines;

- (UILabel *(^)(NSTextAlignment))jtextAlignment;

- (UILabel *(^)(BOOL))jenabled;

@end

@interface UILabel (JFCustomExtension)

- (UILabel *(^)(void))jtextAlignmentRight;

- (UILabel *(^)(void))jtextAlignmentLeft;

- (UILabel *(^)(void))jtextAlignmentCenter;

- (UILabel *(^)(NSString *))jtextUnderline;

- (UILabel *(^)(NSString *))jtextStrikethrough;

@end
