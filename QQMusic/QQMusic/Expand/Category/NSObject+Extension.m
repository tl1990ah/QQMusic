//
//  NSObject+Extension.m
//  HQBProject
//
//  Created by kang on 2017/4/24.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

+ (void)call:(NSString *)phoneNumber {
    if (!phoneNumber || phoneNumber.length == 0) {
        return;
    }
    NSString *URLString = [NSString stringWithFormat:@"tel://%@",phoneNumber];
    NSURL *url = [NSURL URLWithString:URLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

@end
