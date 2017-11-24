//
//  JFTableViewProxy.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/22.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "JFTableViewProxy.h"

@implementation JFTableViewProxy

#pragma mark - dataSource

- (JFTableViewProxy *(^)(id))jnumberOfSections
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(numberOfSectionsInTableView:) implementationBlock:^(id target, UITableView *tableView){
                NSInteger *integerPtr = invokeBlock(block, @[tableView]);
                NSInteger integer = *integerPtr;
                free(integerPtr);
                return integer;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jnumberOfRowsInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:numberOfRowsInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                NSInteger *integerPtr = invokeBlock(block, @[tableView,@(section)]);
                NSInteger integer = *integerPtr;
                free(integerPtr);
                return integer;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jcellForRowAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:cellForRowAtIndexPath:) implementationBlock:^(id target, UITableView *tableView, NSIndexPath *indexPath){
                return invokeBlock(block, @[tableView,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jtitleForHeaderInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:titleForHeaderInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                return invokeBlock(block, @[tableView,@(section)]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jtitleForFooterInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:titleForFooterInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                 return invokeBlock(block, @[tableView,@(section)]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jsectionIndexTitlesForTableView
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(sectionIndexTitlesForTableView:) implementationBlock:^(id target, UITableView *tableView){
                 return invokeBlock(block, @[tableView]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jsectionForSectionIndexTitle
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:sectionForSectionIndexTitle:atIndex:) implementationBlock:^(id target, UITableView *tableView,NSString *title, NSInteger index){
                NSInteger *integerPtr = invokeBlock(block, @[tableView,title,@(index)]);
                NSInteger integer = *integerPtr;
                free(integerPtr);
                return integer;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jheightForRowAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:heightForRowAtIndexPath:) implementationBlock:^(id target, UITableView *tableView, NSIndexPath *indexPath){
                CGFloat *floatPtr = invokeBlock(block, @[tableView,indexPath]);
                CGFloat floatValue = *floatPtr;
                free(floatPtr);
                return floatValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jviewForHeaderInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:viewForHeaderInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                return invokeBlock(block, @[tableView,@(section)]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jheightForHeaderInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:heightForHeaderInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                CGFloat *floatPtr = invokeBlock(block, @[tableView,@(section)]);
                CGFloat floatValue = *floatPtr;
                free(floatPtr);
                return floatValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jviewForFooterInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:viewForFooterInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                return invokeBlock(block, @[tableView,@(section)]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jheightForFooterInSection
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:heightForFooterInSection:) implementationBlock:^(id target, UITableView *tableView, NSInteger section){
                CGFloat *floatPtr = invokeBlock(block, @[tableView,@(section)]);
                CGFloat floatValue = *floatPtr;
                free(floatPtr);
                return floatValue;
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - delegate

- (JFTableViewProxy *(^)(id))jselectRowAtIndexPath
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:didSelectRowAtIndexPath:) implementationBlock:^(id target, UITableView *tableView, NSIndexPath *indexPath){
                invokeBlock(block, @[tableView,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jwillDisplayCell
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:willDisplayCell:forRowAtIndexPath:) implementationBlock:^(id target, UITableView *tableView, UITableViewCell *cell,NSIndexPath *indexPath){
                invokeBlock(block, @[tableView,cell,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (JFTableViewProxy *(^)(id))jdidEndDisplayingCell
{
    return ^(id block){
        if (block) {
            [self addProxyMethod:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:) implementationBlock:^(id target, UITableView *tableView, UITableViewCell *cell,NSIndexPath *indexPath){
                invokeBlock(block, @[tableView,cell,indexPath]);
            }];
        }
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

#pragma mark - overwrite

- (NSDictionary<NSString *,NSArray<NSString *> *> *)requierMethodMap
{
    SEL numberOfRowsSel = @selector(tableView:numberOfRowsInSection:);
    SEL cellForRowSel = @selector(tableView:cellForRowAtIndexPath:);
    return @{
             @"UITableViewDelegate":@[],
             @"UITableViewDataSource":@[
                     NSStringFromSelector(numberOfRowsSel),
                     NSStringFromSelector(cellForRowSel),
                     ]
             };
}

@end
