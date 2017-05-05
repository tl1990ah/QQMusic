//
//  QQProfileFooteriew.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonTag) {
    SetBtn = 0,
    LoginBtn = 1,
};

@protocol QMProfileFooterViewDelegate <NSObject>

@required
- (void)btnClick:(UIButton *)button;

@end

@interface QMProfileFooterView : UIView

@property (nonatomic, weak) id<QMProfileFooterViewDelegate> delegate;

@end
