//
//  NSAttributedString+Addition.h
//  QQMusic
//
//  Created by taolei-mac on 2017/5/4.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Addition)


+ (instancetype)imageTextWithImage:(UIImage*)image imageWH:(CGFloat)imageWH title:(NSString*)title fontSize:(CGFloat)fontSize titleColor:(UIColor*)titleColor spacing:(CGFloat)spacing;

@end
