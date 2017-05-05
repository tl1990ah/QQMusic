//
//  QQProfileFooteriew.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQProfileFooteriew.h"

@implementation QQProfileFooteriew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{

    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = QQColor(237, 237, 237, 1.0);
    [self addSubview:bottomLine];
    
    UIButton *setBtn = [self makeFooterViewWithButtonImageName:@"more_icon_bottom_setting" andButtonWithTitle:@"设置"];
    [setBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    
    UIButton *loginBtn = [self makeFooterViewWithButtonImageName:@"more_icon_bottom_login" andButtonWithTitle:@"立即登录"];
    [loginBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(@1);
    }];
    
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.top.equalTo(bottomLine.mas_bottom).offset(0);
        make.width.equalTo(@60);
        make.bottom.equalTo(self.mas_bottom).offset(0);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-20);
        make.width.equalTo(@100);
        make.top.equalTo(bottomLine.mas_bottom).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
    }];
    
}

- (UIButton *)makeFooterViewWithButtonImageName:(NSString *)imageName andButtonWithTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:btn];
    return btn;
}

@end
