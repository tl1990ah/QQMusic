//
//  QQDrawerViewController.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMBaseViewController.h"

@interface QMDrawerViewController : QMBaseViewController

/**
 *  创建LCDrawerViewController单例
 */
+ (instancetype)sharedDrawerViewController;

/**
 *  创建一个抽屉控制器
 */
+ (instancetype)drawerWithLeftViewController:(UIViewController *)leftVC mainViewController:(QMNavigationController *)mainNav andMaxLeftWidth:(CGFloat)leftWidth;

/**
 * 打开抽屉,显示左边菜单
 */
- (void)openDrawerWithOpenDuration:(CGFloat)duration;

/**
 * 关闭抽屉,隐藏左菜单
 */
- (void)closeDrawerWithCloseDuration:(CGFloat)duration;

/**
 *  选择左边控制器进行跳转
 */
- (void)switchViewController:(UIViewController *)viewController;

/**
 *  返回到主控制器
 */
- (void)backToMainViewController;


@end
