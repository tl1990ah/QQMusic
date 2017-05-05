//
//  QQProfileHeaderView.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QQProfileHeaderViewDelegate <NSObject>

@required
- (void)btnClick:(UIButton *)button;

@end

@interface QMProfileHeaderView : UIView

- (instancetype)initWithImageNames:(NSArray *)imageNames titles:(NSArray *)titles subTitles:(NSArray *)subTitles frame:(CGRect)frame;

@end
