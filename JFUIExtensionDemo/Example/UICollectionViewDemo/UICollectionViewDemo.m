//
//  UICollectionViewDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UICollectionViewDemo.h"
#import "JFUIViewExtension.h"
#import "JFUICollectionViewExtension.h"
#import "JFUICollectionViewCellExtension.h"
#import "JFUICollectionViewFlowLayoutExtension.h"
#import "UICollectionViewDemoCell.h"
#import "UICollectionViewDemoHeaderView.h"

@interface UICollectionViewDemo ()

@end

@implementation UICollectionViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0xFFFFFF);
    
    static NSString *reuseCellId = @"UICollectionViewDemoCell";
    static NSString *reuseHeaderId = @"UICollectionViewDemoHeader";
    
    // 提醒： 所有的代理方法，方法返回类型与返回值类型必须完全匹配
    // 提醒2：注意循环引用
    __weak typeof(self) weakSelf = self;
    UICollectionView
//    .jnewConstructor(^UICollectionViewFlowLayout *(){
//        return
//        UICollectionViewFlowLayout
//        .jnew()
//        .jminimumLineSpacing(10)
//        .jminimumInteritemSpacing(10)
//        .jitemSize(40,40);
//    })
    .jnew(UICollectionViewFlowLayout
          .jnew()
          .jminimumLineSpacing(10)
          .jminimumInteritemSpacing(10)
          .jitemSize(40,40)
          .jscrollDirectionVertical()
          )
    .jframe(0,0,self.view.frame.size.width,self.view.frame.size.height)
    .jbackgroundColor(@0xFFFFFF)
    .jregisterClassForCell([UICollectionViewDemoCell class], reuseCellId)
    .jregisterClassForHeaderSupplementaryView([UICollectionViewDemoHeaderView class],reuseHeaderId)
    .jsuperView(self.view)
    .jdelegateAndDataSourceTrusteeship(^(JFCollectionViewProxy *collectionViewProxy){
        collectionViewProxy
        .jnumberOfItemsInSection(^NSInteger(){
            return 10;
        })
        .jcellForItemAtIndexPath(^UICollectionViewCell *(UICollectionView *collectionView,NSIndexPath *indexPath){
            return
            UICollectionViewCell
            .jnew(collectionView,reuseCellId,indexPath)
            .jbackgroundColor(@0xFF0000)
            .jselectedBackgroundViewConstructor(^UIView *{
                return
                UIView
                .jnew()
                .jbackgroundColor(@0xFF)
                .jframe(0,0,weakSelf.view.frame.size.width,40);
            })
            .jkvc(@"text",[NSString stringWithFormat:@"%ld,%ld",indexPath.section,indexPath.row]);
        })
        .jviewForSupplementaryElementAtIndexPath(^UICollectionReusableView *(UICollectionView *collectionView,NSIndexPath *indexPath){
            UICollectionViewDemoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderId forIndexPath:indexPath];
            headerView.backgroundColor = [UIColor purpleColor];
            headerView.text = [NSString stringWithFormat:@"第%ld组",indexPath.section];
            return headerView;
        })
        .jselectItemAtIndexPath(^(NSIndexPath *indexPath){
            NSLog(@"选中的是第%ld组，%ld个",indexPath.section,indexPath.row);
        })
        .jreferenceSizeForHeaderInSection(^CGSize(NSInteger section){
            return CGSizeMake(weakSelf.view.bounds.size.width, 40);
        })
        .jinsetForSectionAtIndex(^UIEdgeInsets(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section){
            return UIEdgeInsetsMake(5, 5, 5, 5);
        })
        .jshouldHighlightItemAtIndexPath(^(NSIndexPath *indexPath){
            return indexPath.section == 1;
        })
        .jextraProxy(self);
    });
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

@end
