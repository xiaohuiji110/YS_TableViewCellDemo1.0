//
//  YSTools.m
//  YSTableViewDemo
//
//  Created by YS on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import "YSTools.h"


@implementation YSTools

+ (void)dealTableViewSeparator:(id)sender {
    
    if ([sender respondsToSelector:@selector(setSeparatorInset:)]) {
        [sender setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([sender respondsToSelector:@selector(setLayoutMargins:)]) {
        [sender setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
