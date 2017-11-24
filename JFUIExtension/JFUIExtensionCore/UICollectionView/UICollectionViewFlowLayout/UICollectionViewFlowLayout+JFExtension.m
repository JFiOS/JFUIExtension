//
//  UICollectionViewFlowLayout+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewFlowLayout+JFExtension.h"

@implementation UICollectionViewFlowLayout (JFExtension)

+ (UICollectionViewFlowLayout *(^)(void))jnew
{
    return ^(){
        return [[UICollectionViewFlowLayout alloc] init];
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat))jminimumLineSpacing
{
    return ^(CGFloat minimumLineSpacing){
        self.minimumLineSpacing = minimumLineSpacing;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat))jminimumInteritemSpacing
{
    return ^(CGFloat minimumInteritemSpacing){
        self.minimumInteritemSpacing = minimumInteritemSpacing;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jitemSize
{
    return ^(CGFloat w, CGFloat h){
        self.itemSize = CGSizeMake(w, h);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jestimatedItemSize
{
    return ^(CGFloat w, CGFloat h){
        self.estimatedItemSize = CGSizeMake(w, h);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))jscrollDirection
{
    return ^(UICollectionViewScrollDirection direction){
        self.scrollDirection = direction;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jheaderReferenceSize
{
    return ^(CGFloat w, CGFloat h){
        self.headerReferenceSize = CGSizeMake(w, h);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat))jfooterReferenceSize
{
    return ^(CGFloat w, CGFloat h){
        self.footerReferenceSize = CGSizeMake(w, h);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat,CGFloat,CGFloat,CGFloat))jsectionInset
{
    return ^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.sectionInset = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UICollectionViewFlowLayoutSectionInsetReference))jsectionInsetReference
{
    return ^(UICollectionViewFlowLayoutSectionInsetReference reference){
        self.sectionInsetReference = reference;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(BOOL))jsectionHeadersPinToVisibleBounds
{
    return ^(BOOL sectionHeadersPinToVisibleBounds){
        self.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(BOOL))jsectionFootersPinToVisibleBounds
{
    return ^(BOOL sectionFootersPinToVisibleBounds){
        self.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds;
        return self;
    };
}

@end

@implementation UICollectionViewFlowLayout (JFCustomExtension)

- (UICollectionViewFlowLayout *(^)(void))jscrollDirectionVertical
{
    return ^(){
        self.jscrollDirection(UICollectionViewScrollDirectionVertical);
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(void))jscrollDirectionHorizontal
{
    return ^(){
        self.jscrollDirection(UICollectionViewScrollDirectionHorizontal);
        return self;
    };
}

@end
