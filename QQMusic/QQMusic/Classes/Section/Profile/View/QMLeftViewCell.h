//
//  QQLeftViewCell.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QMLeftViewItem;

@interface QMLeftViewCell : UITableViewCell

@property (nonatomic, strong) QMLeftViewItem *leftItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
