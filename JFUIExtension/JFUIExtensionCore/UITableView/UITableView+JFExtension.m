//
//  UITableView+JFExtension.m
//  JFUIExtension
//
//  Created by The Answer on 2017/11/13.
//  Copyright © 2017年 The Answer. All rights reserved.
//

#import "UITableView+JFExtension.h"
#import "UIColor+JFExtension.h"
#import "JFTableViewProxy.h"
#import <objc/runtime.h>

@implementation UITableView (JFExtension)

- (UITableView *(^)(BOOL))jscrollEnabled
{
    return ^(BOOL scrollEnabled){
        self.scrollEnabled = scrollEnabled;
        return self;
    };
}

- (UITableView *(^)(NSObject<UITableViewDelegate> *))jdelegate
{
    return ^(NSObject<UITableViewDelegate> *delegate){
        self.delegate = delegate;
        return self;
    };
}

- (UITableView *(^)(NSObject<UITableViewDataSource> *))jdataSource
{
    return ^(NSObject<UITableViewDataSource> *dataSource){
        self.dataSource = dataSource;
        return self;
    };
}

- (UITableView *(^)(BOOL))jshowsVerticalScrollIndicator
{
    return ^(BOOL showsVerticalScrollIndicator){
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
        return self;
    };
}

- (UITableView *(^)(BOOL))jshowsHorizontalScrollIndicator
{
    return ^(BOOL showsHorizontalScrollIndicator){
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
        return self;
    };
};

- (UITableView *(^)(UITableViewCellSeparatorStyle))jseparatorStyle
{
    return ^(UITableViewCellSeparatorStyle separatorStyle){
        self.separatorStyle = separatorStyle;
        return self;
    };
}

- (UITableView *(^)(UIView *))jtableHeaderView
{
    return ^(UIView *tableHeaderView){
        self.tableHeaderView = tableHeaderView;
        return self;
    };
}

- (UITableView *(^)(UIView *(^)(UITableView *)))jtableHeaderViewConstructor
{
    return ^(UIView *(^block)(UITableView *)){
        if (block) self.tableHeaderView = block(self);
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (UITableView *(^)(UIView *))jtableFooterView
{
    return ^(UIView *tableFooterView){
        self.tableFooterView = tableFooterView;
        return self;
    };
}

- (UITableView *(^)(UIView *(^)(UITableView *)))jtableFooterViewConstructor
{
    return ^(UIView *(^block)(UITableView *)){
        if (block) self.tableFooterView = block(self);
        else NSAssert(NO, @"必须给Block赋值！");
        return self;
    };
}

- (UITableView *(^)(CGFloat))jrowHeight
{
    return ^(CGFloat rowHeight){
        self.rowHeight = rowHeight;
        return self;
    };
}

@end

@implementation UITableView (JFCustomExtension)

- (UITableView *(^)(void))jseparatorStyleNone
{
    return ^(void){
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        return self;
    };
}

- (UITableView *(^)(void))jseparatorStyleSingleLine
{
    return ^(void){
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return self;
    };
}

@end

@implementation UITableView (JFDelegateExtension)

- (UITableView *(^)(void(^)(JFTableViewProxy *)))jdelegateAndDataSourceTrusteeship
{
    return ^(void(^block)(JFTableViewProxy *tableViewProxy)){
        if (block) {
            JFTableViewProxy *proxy = [JFTableViewProxy proxy];
            block(proxy);
            self.delegate = proxy.proxyObject;
            self.dataSource = proxy.proxyObject;
            
            objc_setAssociatedObject(self, @"JFTableViewProxy", proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return self;
    };
}

@end
