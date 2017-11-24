//
//  JFTableViewProxy.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFBaseProxy.h"

@interface JFTableViewProxy : JFBaseProxy

#pragma mark - dataSource

/** method :- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
 *  block  :^NSInteger(UITableView *tableView){}
 */
- (JFTableViewProxy *(^)(id))jnumberOfSections;

/** method :- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
 *  block  :^NSInteger(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jnumberOfRowsInSection;

/** method :- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^UITableViewCell *(UITableView *tableView,NSIndexPath *indexPath){}
 */
- (JFTableViewProxy *(^)(id))jcellForRowAtIndexPath;

/** method :- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^CGFloat (UITableView *tableView,NSIndexPath *indexPath){}
 */
- (JFTableViewProxy *(^)(id))jheightForRowAtIndexPath;

/** method :- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
 *  block  :^NSString *(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jtitleForHeaderInSection;

/** method :- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
 *  block  :^NSString *(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jtitleForFooterInSection;

/** method :- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
 *  block  :^UIView *(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jviewForHeaderInSection;

/** method :- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
 *  block  :^CGFloat(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jheightForHeaderInSection;

/** method :- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
 *  block  :^UIView *(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jviewForFooterInSection;

/** method :- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
 *  block  :^CGFloat(UITableView *tableView,NSInteger section){}
 */
- (JFTableViewProxy *(^)(id))jheightForFooterInSection;

/** method :- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView;
 *  block  :^NSArray *(UITableView *tableView){}
 */
- (JFTableViewProxy *(^)(id))jsectionIndexTitlesForTableView;

/** method :- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;
 *  block  :^NSInteger(UITableView *tableView,NSString *title,NSInteger index){}
 */
- (JFTableViewProxy *(^)(id))jsectionForSectionIndexTitle;

#pragma mark - delegate

/** method :- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^void(UITableView *tableView,NSIndexPath *indexPath){}
 */
- (JFTableViewProxy *(^)(id))jselectRowAtIndexPath;

/** method :- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^void(UITableView *tableView,UITableViewCell *tableViewCell,NSIndexPath *indexPath){}
 */
- (JFTableViewProxy *(^)(id))jwillDisplayCell;

/** method :- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
 *  block  :^void(UITableView *tableView,UITableViewCell *tableViewCell,NSIndexPath *indexPath){}
 */
- (JFTableViewProxy *(^)(id))jdidEndDisplayingCell;

@end
