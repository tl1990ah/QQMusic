//
//  QQLeftViewItem.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMLeftViewItem : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
