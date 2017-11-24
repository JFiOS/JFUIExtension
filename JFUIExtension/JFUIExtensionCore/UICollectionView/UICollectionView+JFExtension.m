//
//  UICollectionView+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionView+JFExtension.h"
#import "JFCollectionViewProxy.h"
#import <objc/runtime.h>

@implementation UICollectionView (JFExtension)

- (UICollectionView *(^)(BOOL))jscrollEnabled
{
    return ^(BOOL scrollEnabled){
        self.scrollEnabled = scrollEnabled;
        return self;
    };
}

- (UICollectionView *(^)(NSObject<UICollectionViewDelegate> *))jdelegate
{
    return ^(NSObject<UICollectionViewDelegate> *delegate){
        self.delegate = delegate;
        return self;
    };
}

- (UICollectionView *(^)(NSObject<UICollectionViewDataSource> *))jdataSource
{
    return ^(NSObject<UICollectionViewDataSource> *dataSource){
        self.dataSource = dataSource;
        return self;
    };
}

- (UICollectionView *(^)(__unsafe_unretained Class, NSString *))jregisterClassForCell
{
    return ^(Class cls,NSString *reuseId){
        [self registerClass:cls forCellWithReuseIdentifier:reuseId];
        return self;
    };
}

- (UICollectionView *(^)(__unsafe_unretained Class, NSString *, NSString *))jregisterClassForSupplementaryView
{
    return ^(Class cls,NSString *kind, NSString *reuseId){
        [self registerClass:cls forSupplementaryViewOfKind:kind withReuseIdentifier:reuseId];
        return self;
    };
}

@end

@implementation UICollectionView (JFCustomExtension)

- (UICollectionView *(^)(Class,NSString *))jregisterClassForHeaderSupplementaryView
{
    return ^(Class cls,NSString *reuseId){
        self.jregisterClassForSupplementaryView(cls,UICollectionElementKindSectionHeader,reuseId);
        return self;
    };
}

- (UICollectionView *(^)(Class,NSString *))jregisterClassForFooterSupplementaryView
{
    return ^(Class cls,NSString *reuseId){
        self.jregisterClassForSupplementaryView(cls,UICollectionElementKindSectionFooter,reuseId);
        return self;
    };
}

@end

@implementation UICollectionView (JFDelegateExtension)

- (UICollectionView *(^)(void(^)(JFCollectionViewProxy *)))jdelegateAndDataSourceTrusteeship
{
    return ^(void(^block)(JFCollectionViewProxy *collectionViewProxy)){
        if (block) {
            JFCollectionViewProxy *proxy = [JFCollectionViewProxy proxy];
            block(proxy);
            self.delegate = proxy.proxyObject;
            self.dataSource = proxy.proxyObject;

            objc_setAssociatedObject(self, @"JFCollectionViewProxy", proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return self;
    };
}

@end
