//
//  UIButton+Extension.m
//  HQBProject
//
//  Created by kang on 2017/4/25.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)setShadowOffset:(CGSize)size shadowOpaticy:(CGFloat)opaticy shadowColor:(UIColor *)color {
    self.layer.shadowOffset =  size;
    self.layer.shadowOpacity = opaticy;
    self.layer.shadowColor =  color.CGColor;
}

@end
