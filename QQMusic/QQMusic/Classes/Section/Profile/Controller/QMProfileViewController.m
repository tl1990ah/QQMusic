//
//  QQProfileViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMDrawerViewController.h"
#import "QMProfileViewController.h"
#import "QMProfileHeaderView.h"
#import "QMProfileFooterView.h"
#import "QMLeftViewCell.h"
#import "QMSwitchItem.h"
#import "QMSettingViewController.h"
#import "QMLoginViewController.h"

@interface QMProfileViewController ()<UITableViewDelegate, UITableViewDataSource, QMProfileFooterViewDelegate>
@property (nonatomic, weak) QMProfileFooterView *footerView;
@property (nonatomic, weak) QMProfileHeaderView *headerView;

@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation QMProfileViewController

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
    QMSwitchItem *item0 = [QMSwitchItem itemWithTitle:@"仅Wi-Fi联网" subTitle:nil];
    [self.datas addObject:item0];
    
    QMLeftViewItem *item1 = [QMLeftViewItem itemWithTitle:@"定时关闭" subTitle:nil];
    [self.datas addObject:item1];
    
    QMLeftViewItem *item2 = [QMLeftViewItem itemWithTitle:@"免流量服务" subTitle:@"在线听歌免流量"];
    [self.datas addObject:item2];
    
    QMLeftViewItem *item3 = [QMLeftViewItem itemWithTitle:@"传歌到手机" subTitle:nil];
    [self.datas addObject:item3];
    
    QMLeftViewItem *item4 = [QMLeftViewItem itemWithTitle:@"QPlay与车载音乐" subTitle:nil];
    [self.datas addObject:item4];
    
    QMLeftViewItem *item5 = [QMLeftViewItem itemWithTitle:@"清理占用空间" subTitle:nil];
    [self.datas addObject:item5];
    
    QMLeftViewItem *item6 = [QMLeftViewItem itemWithTitle:@"帮助与反馈" subTitle:nil];
    [self.datas addObject:item6];
    
    QMLeftViewItem *item7 = [QMLeftViewItem itemWithTitle:@"关于QQ音乐" subTitle:nil];
    [self.datas addObject:item7];
    
}

- (void)setupHeaderView
{
    NSArray *images = @[@"more_icon_vip_normal", @"more_icon_personal_center", @"more_icon_notificationcenter"];
    NSArray *titles = @[@"升级为VIP", @"个性化中心", @"消息中心"];
    NSArray *subTitles = @[@"畅享音乐特权", @"默认主题"];
    QMProfileHeaderView *headerView = [[QMProfileHeaderView alloc] initWithImageNames:images titles:titles subTitles:subTitles frame:CGRectMake(QQScreenW - 300, 0, 300, 170)];
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
    QMProfileFooterView *footerView = [[QMProfileFooterView alloc] init];
    footerView.delegate = self;
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

#pragma mark -- QQProfileFooteriewDelegate
- (void)btnClick:(UIButton *)button
{
    if(button.tag == SetBtn){
        QMSettingViewController *setVC = [[QMSettingViewController alloc] init];
        QMNavigationController *nav = [[QMNavigationController alloc] initWithRootViewController:setVC];
        
        [[QMDrawerViewController sharedDrawerViewController] switchViewController:nav];
    }else{
        QMLoginViewController *loginVC = [[QMLoginViewController alloc] init];
        QMNavigationController *nav = [[QMNavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QMLeftViewCell *cell = [QMLeftViewCell cellWithTableView:tableView];
    QMLeftViewItem *item = self.datas[indexPath.row];
    cell.leftItem = item;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
