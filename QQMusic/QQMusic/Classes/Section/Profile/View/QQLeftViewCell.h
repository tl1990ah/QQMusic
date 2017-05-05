//
//  QQLeftViewCell.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QQLeftViewItem;

@interface QQLeftViewCell : UITableViewCell

@property (nonatomic, strong) QQLeftViewItem *leftItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
