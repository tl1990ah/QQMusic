//
//  NSString+LCExtension.m
//  HQBProject
//
//  Created by taolei-mac on 2017/4/28.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "NSString+LCExtension.h"

@implementation NSString (LCExtension)

- (NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght
{
    NSString *newStr = originalStr;
    for (int i = 0; i < lenght; i++) {
        NSRange range = NSMakeRange(startLocation, 1);
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLocation ++;
    }
    return newStr;
}

@end
