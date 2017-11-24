//
//  UITableViewDemo.m
//  JFUIExtensionDemo
//
//  Created by The Answer on 2017/11/20.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableViewDemo.h"
#import "JFUIViewExtension.h"
#import "JFUITableViewExtension.h"
#import "JFUITableViewCellExtension.h"
#import "UITableViewDemoCell.h"
#import "UITableViewCellModel.h"

@interface UITableViewDemo ()

@end

@implementation UITableViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.jbackgroundColor(@0xFFFFFF);
    
    NSMutableArray *models = @[].mutableCopy;
    
    for (NSInteger i = 0; i < 10; i++) {
        UITableViewCellModel *model = [UITableViewCellModel new];
        model.name = [NSString stringWithFormat:@"小明%03ld",i+1];
        model.age = @"18";
        model.sex = @"男";
        model.descriptionString = @"这个人有点懒，什么都没有说。。。";
        model.iconUrl = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
        [models addObject:model];
    }
    
    // 提醒： 所有的代理方法，方法返回类型与返回值类型必须完全匹配
    // 提醒2：注意循环引用
    
    UITableView
    .jnew(UITableViewStylePlain)
    .jframe(0,0,self.view.frame.size.width,self.view.frame.size.height)
    .jshowsVerticalScrollIndicator(NO)
    .jseparatorStyleSingleLine()
    .jsuperView(self.view)
    .jdelegateAndDataSourceTrusteeship(^(JFTableViewProxy *tableViewProxy){
        tableViewProxy
        .jnumberOfRowsInSection(^NSInteger(UITableView *tableView,NSInteger section){
            return models.count;
        })
        .jcellForRowAtIndexPath(^UITableViewCell *(UITableView *tableView,NSIndexPath *indexPath){
            static NSString *reuseId = @"TableViewDemoCell";
            return
            UITableViewCell
            .jnew(tableView,[UITableViewDemoCell class],reuseId,UITableViewCellStyleValue1)
            .jselectionStyleNone()
            .jbackgroundColor(indexPath.row%2 == 0 ? [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] : [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4])
            .jkvc(@"model",models[indexPath.row])
            .jkvcConstructor(@"block",^id(){
                return ^{
                    NSLog(@"Button被点击了，block打印");
                };
            });
        })
        .jheightForRowAtIndexPath(^{
            return 160.0; // 注意类型要完全匹配 如果是160,会按照 int 解析，这里要严格匹配
        })
        .jextraProxy(self);
    });
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"选中的是第%ld组，%ld行",indexPath.section,indexPath.row);
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
