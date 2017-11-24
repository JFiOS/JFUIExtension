//
//  JFTextFieldProxy.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/23.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFBaseProxy.h"

@interface JFTextFieldProxy : JFBaseProxy

 /** method :- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
  *  block  :^BOOL(UITextField *textField){}
  */
- (JFTextFieldProxy *(^)(id))jshouldBeginEditing;

/** method :- (void)textFieldDidBeginEditing:(UITextField *)textField;
 *  block  :^(UITextField *textField){}
 */
- (JFTextFieldProxy *(^)(id))jdidBeginEditing;

/** method :- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
 *  block  :^BOOL(UITextField *textField){}
 */
- (JFTextFieldProxy *(^)(id))jshouldEndEditing;

/** method :- (void)textFieldDidEndEditing:(UITextField *)textField;
 *  block  :^(UITextField *textField){}
 */
- (JFTextFieldProxy *(^)(id))jdidEndEditing;

/** method :- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
 *  block  :^(UITextField *textField,Range range,NSString *replacementString){}
 */
- (JFTextFieldProxy *(^)(id))jshouldChangeCharactersInRange;

/** method :- (BOOL)textFieldshouldClear:(UITextField *)textField;
 *  block  :^BOOL(UITextField *textField){}
 */
- (JFTextFieldProxy *(^)(id))jshouldClear;
/** method :- (BOOL)textFieldshouldReturn:(UITextField *)textField;
 *  block  :^BOOL(UITextField *textField){}
 */
- (JFTextFieldProxy *(^)(id))jshouldReturn;

@end
