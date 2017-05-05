//
//  QQProfileViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQProfileViewController.h"
#import "QQProfileHeaderView.h"
#import "QQProfileFooteriew.h"
#import "QQLeftViewCell.h"
#import "QQLeftViewItem.h"

@interface QQProfileViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) QQProfileFooteriew *footerView;
@property (nonatomic, weak) QQProfileHeaderView *headerView;

@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation QQProfileViewController

- (NSMutableArray *)datas
{
    if(!_datas){
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupDatas];
    
    [self setupHeaderView];
    
    [self setupFooterView];
    
    [self setupMiddleView];
}

- (void)setupDatas
{
    QQLeftViewItem *item0 = [QQLeftViewItem itemWithTitle:@"仅Wi-Fi联网" subTitle:nil];
    [self.datas addObject:item0];
    
    QQLeftViewItem *item1 = [QQLeftViewItem itemWithTitle:@"定时关闭" subTitle:nil];
    [self.datas addObject:item1];
    
    QQLeftViewItem *item2 = [QQLeftViewItem itemWithTitle:@"免流量服务" subTitle:nil];
    [self.datas addObject:item2];
    
    QQLeftViewItem *item3 = [QQLeftViewItem itemWithTitle:@"传歌到手机" subTitle:nil];
    [self.datas addObject:item3];
    
    QQLeftViewItem *item4 = [QQLeftViewItem itemWithTitle:@"QPlay与车载音乐" subTitle:nil];
    [self.datas addObject:item4];
    
    QQLeftViewItem *item5 = [QQLeftViewItem itemWithTitle:@"清理占用空间" subTitle:nil];
    [self.datas addObject:item5];
    
    QQLeftViewItem *item6 = [QQLeftViewItem itemWithTitle:@"帮助与反馈" subTitle:nil];
    [self.datas addObject:item6];
    
    QQLeftViewItem *item7 = [QQLeftViewItem itemWithTitle:@"关于QQ音乐" subTitle:nil];
    [self.datas addObject:item7];
    
}

- (void)setupHeaderView
{
    NSArray *images = @[@"more_icon_vip_normal", @"more_icon_personal_center", @"more_icon_notificationcenter"];
    NSArray *titles = @[@"升级为VIP", @"个性化中心", @"消息中心"];
    NSArray *subTitles = @[@"畅享音乐特权", @"点击查看更新"];
    QQProfileHeaderView *headerView = [[QQProfileHeaderView alloc] initWithImageNames:images titles:titles subTitles:subTitles frame:CGRectMake(QQScreenW - 300, 0, 300, 170)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    self.headerView = headerView;
}

- (void)setupMiddleView
{
    UITableView *middleMenuView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    middleMenuView.backgroundColor = [UIColor whiteColor];
    middleMenuView.separatorStyle = UITableViewCellSeparatorStyleNone;
    middleMenuView.delegate = self;
    middleMenuView.dataSource = self;
    [self.view addSubview:middleMenuView];
    [middleMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_left);
        make.top.equalTo(self.headerView.mas_bottom).offset(20);
        make.right.equalTo(self.headerView.mas_right);
        make.bottom.equalTo(self.footerView.mas_top);
    }];
}

- (void)setupFooterView
{
    QQProfileFooteriew *footerView = [[QQProfileFooteriew alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footerView];
    self.footerView = footerView;
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(QQScreenW - 300);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_bottom).offset(-55);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQLeftViewCell *cell = [QQLeftViewCell cellWithTableView:tableView];
    QQLeftViewItem *item = self.datas[indexPath.row];
    cell.leftItem = item;
    return cell;
}



@end
