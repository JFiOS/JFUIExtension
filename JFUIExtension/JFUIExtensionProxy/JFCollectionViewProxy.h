//
//  UICollectionViewProxy.h
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFBaseProxy.h"

@interface JFCollectionViewProxy : JFBaseProxy<UICollectionViewDelegateFlowLayout>

#pragma mark - dataSource

/** method :- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
 *  block  :^NSInteger(UICollectionView *collectionView){}
 */
- (JFCollectionViewProxy *(^)(id))jnumberOfSections;

/** method :- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
 *  block  :^NSInteger(UICollectionView *collectionView,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jnumberOfItemsInSection;

/** method :- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^UICollectionViewCell *(UICollectionView *collectionView,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jcellForItemAtIndexPath;

/** method :- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
 *  block  :^UICollectionReusableView *(UICollectionView *collectionView,NSString *kind,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jviewForSupplementaryElementAtIndexPath;

#pragma mark - delegate

/** method :- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^BOOL(UICollectionView *collectionView,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jshouldHighlightItemAtIndexPath;

/** method :- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^(UICollectionView *collectionView,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jdidHighlightItemAtIndexPath;

/** method :- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^(UICollectionView *collectionView,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jselectItemAtIndexPath;

/** method :- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^BOOL(UICollectionView *collectionView,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jshouldShowMenuForItemAtIndexPath;

/** method :- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
 *  block  :^(UICollectionView *collectionView,UICollectionViewCell *collectionViewCell,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jwillDisplayCell;

/** method :- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^(UICollectionView *collectionView,UICollectionViewCell *collectionViewCell,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jdidEndDisplayingCell;

#pragma mark - UICollectionViewDelegateFlowLayout

/** method :- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
 *  block  :^CGSize(UICollectionView *collectionView,UICollectionViewLayout *layout,NSIndexPath *indexPath){}
 */
- (JFCollectionViewProxy *(^)(id))jsizeForItemAtIndexPath;

/** method :- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
 *  block  :^UIEdgeInsets(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jinsetForSectionAtIndex;

/** method :- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
 *  block  :^CGFloat(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jminimumLineSpacingForSectionAtIndex;

/** method :- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
 *  block  :^CGFloat(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jminimumInteritemSpacingForSectionAtIndex;

/** method :- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
 *  block  :^CGSize(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jreferenceSizeForHeaderInSection;

/** method :- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
 *  block  :^CGSize(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){}
 */
- (JFCollectionViewProxy *(^)(id))jreferenceSizeForFooterInSection;

@end
