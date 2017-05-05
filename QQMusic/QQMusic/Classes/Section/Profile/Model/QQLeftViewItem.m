//
//  QQLeftViewItem.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQLeftViewItem.h"

@implementation QQLeftViewItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    QQLeftViewItem *item = [[self alloc] init];
    item.title = title;
    item.subTitle = subTitle;
    return item;
}


@end
