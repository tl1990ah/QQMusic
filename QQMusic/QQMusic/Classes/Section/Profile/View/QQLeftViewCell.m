//
//  QQLeftViewCell.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQLeftViewCell.h"
#import "QQSwitchItem.h"

@interface QQLeftViewCell ()

@property (nonatomic, weak) UILabel *subTitleLabel;

@end

@implementation QQLeftViewCell

- (void)setLeftItem:(QQLeftViewItem *)leftItem
{
    _leftItem = leftItem;
    
    self.textLabel.text = leftItem.title;
    if([leftItem isKindOfClass:[QQSwitchItem class]]){
        self.accessoryView = [[UISwitch alloc] init];
    }else{
        UILabel *subTitleLabel = [[UILabel alloc] init];
        subTitleLabel.text = leftItem.subTitle;
        subTitleLabel.font = [UIFont systemFontOfSize:12];
        subTitleLabel.textColor = QQColor(205, 205, 205, 1.0);
        [subTitleLabel sizeToFit];
        self.accessoryView = subTitleLabel;
    }
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
