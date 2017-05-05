//
//  QQLeftViewCell.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQLeftViewCell.h"
#import "QQLeftViewItem.h"


@implementation QQLeftViewCell

- (void)setLeftItem:(QQLeftViewItem *)leftItem
{
    _leftItem = leftItem;
    
    self.textLabel.text = leftItem.title;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *Id = @"menu";
    QQLeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if(!cell){
        cell = [[QQLeftViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    return cell;
}


@end