//
//  UICollectionView+JFBaseExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/21.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionView+JFBaseExtension.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UICollectionView (JFBaseExtension)

+ (UICollectionView *(^)(UICollectionViewFlowLayout *))jnew
{
    return ^(UICollectionViewFlowLayout *layout){
        return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    };
}

+ (UICollectionView *(^)(UICollectionViewFlowLayout *(^)(void)))jnewConstructor
{
    return ^(UICollectionViewFlowLayout *(^block)(void)){
        UICollectionViewFlowLayout *layout = block();
        return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    };
}

@end
#pragma clang diagnostic pop
