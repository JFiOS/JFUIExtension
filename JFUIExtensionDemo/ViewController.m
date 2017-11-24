//
//  ViewController.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/23.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "ViewController.h"
#import "JFUIViewExtension.h"
#import "JFUITableViewExtension.h"
#import "JFUITableViewCellExtension.h"

static NSDictionary *_viewMap = nil;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *listArray = @[
                           @"UIViewDemo",
                           @"UILabelDemo",
                           @"UIImageViewDemo",
                           @"UIButtonDemo",
                           @"UITextFieldDemo",
                           @"UITableViewDemo",
                           @"UICollectionViewDemo"
                           ];

    __weak typeof(self) weakSelf = self;
    UITableView
    .jnew(UITableViewStylePlain)
    .jframe(0,0,self.view.frame.size.width,self.view.frame.size.height)
    .jseparatorStyleSingleLine()
    .jrowHeight(40)
    .jsuperView(self.view)
    .jdelegateAndDataSourceTrusteeship(^(JFTableViewProxy *tableViewProxy){
        tableViewProxy
        .jnumberOfRowsInSection(^NSInteger(UITableView *tableView,NSInteger section){
            return listArray.count;
        })
        .jcellForRowAtIndexPath(^UITableViewCell *(UITableView *tableView,NSIndexPath *indexPath){
            static NSString *reuseId = @"ViewContorllerTableViewCell";
            return
            UITableViewCell
            .jnew(tableView,nil,reuseId,UITableViewCellStyleValue1)
            .jtext(listArray[indexPath.row])
            .jselectionStyleNone();
        })
        .jselectRowAtIndexPath(^(UITableView *tableView,NSIndexPath *indexPath){
            UIViewController *viewController = [self getViewControllerAtIndex:indexPath.row];
            [weakSelf.navigationController pushViewController:viewController animated:YES];
        });
    });
}

- (UIViewController *)getViewControllerAtIndex:(NSUInteger)index
{
    NSDictionary *viewTypeMap = [self getViewTypeMap];
    NSString *className = viewTypeMap[@(index)];
    if(!className || className.length == 0) return nil;
    Class cls = NSClassFromString(className);
    return [[cls alloc] init];
}

- (NSDictionary *)getViewTypeMap{
    if(!_viewMap){
        _viewMap = @{
                     @0:@"UIViewDemo",
                     @1:@"UILabelDemo",
                     @2:@"UIImageViewDemo",
                     @3:@"UIButtonDemo",
                     @4:@"UITextFieldDemo",
                     @5:@"UITableViewDemo",
                     @6:@"UICollectionViewDemo",
                     };
    }
    return _viewMap;
}


@end
