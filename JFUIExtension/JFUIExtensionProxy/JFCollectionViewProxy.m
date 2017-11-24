//
//  UICollectionViewProxy.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFCollectionViewProxy.h"

@implementation JFCollectionViewProxy

#pragma mark - dataSource

- (JFCollectionViewProxy *(^)(id))jnumberOfSections
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(numberOfItemsInSection:) implementationBlock:^(id target, UICollectionView *collectionView){
                NSInteger *integerPtr = invokeBlock(block, @[collectionView]);
                NSInteger integer = *integerPtr;
                free(integerPtr);
                return integer;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jnumberOfItemsInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:numberOfItemsInSection:) implementationBlock:^(id target, UICollectionView *collectionView, NSInteger section){
                NSInteger *integerPtr = invokeBlock(block, @[collectionView,@(section)]);
                NSInteger integer = *integerPtr;
                free(integerPtr);
                return integer;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jcellForItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:cellForItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, NSIndexPath *indexPath){
                return invokeBlock(block, @[collectionView,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jviewForSupplementaryElementAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:viewForSupplementaryElementOfKind:atIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView,NSString *kind, NSIndexPath *indexPath){
                return invokeBlock(block, @[collectionView,kind,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - delegate

- (JFCollectionViewProxy *(^)(id))jshouldHighlightItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:shouldHighlightItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, NSIndexPath *indexPath){
                int *intPtr = invokeBlock(block, @[collectionView,indexPath]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jdidHighlightItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:didHighlightItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, NSIndexPath *indexPath){
                return invokeBlock(block, @[collectionView,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jselectItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:didSelectItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, NSIndexPath *indexPath){
                invokeBlock(block, @[collectionView,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jshouldShowMenuForItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:shouldShowMenuForItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, NSIndexPath *indexPath){
                int *intPtr = invokeBlock(block, @[collectionView,indexPath]);
                int intValue = *intPtr;
                free(intPtr);
                return intValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jwillDisplayCell
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:willDisplayCell:forItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath){
                return invokeBlock(block, @[collectionView,cell,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jdidEndDisplayingCell
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:didEndDisplayingCell:forItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath){
                return invokeBlock(block, @[collectionView,cell,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (JFCollectionViewProxy *(^)(id))jsizeForItemAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:sizeForItemAtIndexPath:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSIndexPath *indexPath){
                CGSize *sizePtr = invokeBlock(block, @[collectionView,layout,indexPath]);
                CGSize size = *sizePtr;
                free(sizePtr);
                return size;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jinsetForSectionAtIndex
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:insetForSectionAtIndex:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSInteger section){
                UIEdgeInsets *insetsPtr = invokeBlock(block, @[collectionView,layout,@(section)]);
                UIEdgeInsets insets = *insetsPtr;
                free(insetsPtr);
                return insets;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jminimumLineSpacingForSectionAtIndex
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSInteger section){
                CGFloat *floatPtr = invokeBlock(block, @[collectionView,layout,@(section)]);
                CGFloat floatValue = *floatPtr;
                free(floatPtr);
                return floatValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jminimumInteritemSpacingForSectionAtIndex
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSInteger section){
                CGFloat *floatPtr = invokeBlock(block, @[collectionView,layout,@(section)]);
                CGFloat floatValue = *floatPtr;
                free(floatPtr);
                return floatValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jreferenceSizeForHeaderInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:referenceSizeForHeaderInSection:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSInteger section){
                CGSize *sizePtr = invokeBlock(block, @[collectionView,layout,@(section)]);
                CGSize size = *sizePtr;
                free(sizePtr);
                return size;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFCollectionViewProxy *(^)(id))jreferenceSizeForFooterInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(collectionView:layout:referenceSizeForFooterInSection:) implementationBlock:^(id target, UICollectionView *collectionView, UICollectionViewLayout *layout, NSInteger section){
                CGSize *sizePtr = invokeBlock(block, @[collectionView,layout,@(section)]);
                CGSize size = *sizePtr;
                free(sizePtr);
                return size;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - overwrite

- (NSDictionary<NSString *,NSArray<NSString *> *> *)requierMethodMap
{
    SEL numberOfRowsSel = @selector(collectionView:numberOfItemsInSection:);
    SEL cellForRowSel = @selector(collectionView:cellForItemAtIndexPath:);
    return @{
             @"UICollectionViewDelegate":@[],
             @"UICollectionViewDataSource":@[
                     NSStringFromSelector(numberOfRowsSel),
                     NSStringFromSelector(cellForRowSel),
                     ],
             @"UICollectionViewDelegateFlowLayout":@[]
             };
}

@end
