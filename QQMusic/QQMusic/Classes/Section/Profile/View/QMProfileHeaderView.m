//
//  QQProfileHeaderView.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMProfileHeaderView.h"

@interface QMProfileHeaderView ()


@end

@implementation QMProfileHeaderView

- (instancetype)initWithImageNames:(NSArray *)imageNames titles:(NSArray *)titles subTitles:(NSArray *)subTitles frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupSubViewsWithImages:imageNames titles:titles subTitles:subTitles];
    }
    return self;
}


- (void)setupSubViewsWithImages:(NSArray *)images titles:(NSArray *)titles subTitles:(NSArray *)subTitles
{
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = QQColor(237, 237, 237, 1.0);
    [self addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.top.equalTo(self.mas_bottom).offset(-1);
        make.height.equalTo(@1);
    }];
    
    [self addheaderBtnsWithImages:images titles:titles subTitles:subTitles];
}

- (void)addheaderBtnsWithImages:(NSArray *)images titles:(NSArray *)titles subTitles:(NSArray *)subTitles
{
    CGFloat btnW = self.width / 3;
    for (int i = 0; i < images.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //btn.backgroundColor = QQRandomColor;
        NSAttributedString *attrStr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:images[i]] imageWH:35 title:titles[i] fontSize:13 titleColor:[UIColor blackColor] spacing:8];
        // 设置按钮换行
        btn.titleLabel.numberOfLines = 0;
        // 设置按钮中的文字居中显示
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setAttributedTitle:attrStr forState:UIControlStateNormal];

        [self addSubview:btn];
        btn.width = btnW;
        btn.x = btnW * i;
        btn.y = 55;
        btn.height = 60;
    }
    
    for (int i = 0; i < subTitles.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = QQColor(180, 180, 180, 1.0);
        titleLabel.text = subTitles[i];
        [self addSubview:titleLabel];
        
        titleLabel.width = btnW;
        titleLabel.height = 20;
        titleLabel.x = btnW * i;
        titleLabel.y = 55 + 60;
    }
    
}


@end
