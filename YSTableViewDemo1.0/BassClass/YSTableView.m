//
//  UWTableView.m
//  Uniwa
//
//  Created by LOFT.LIFE.ZHENG on 15/11/27.
//  Copyright © 2015年 com.zws. All rights reserved.
//

#import "YSTableView.h"


@implementation YSTableView

- (void)awakeFromNib {

    [self baseConfigure];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self baseConfigure];
    }
    return self;
}

- (void)baseConfigure {
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 2)];
    
    footerView.backgroundColor = HexRGB(0xeeeeee);
    self.tableFooterView = footerView;
    self.backgroundColor = HexRGB(0xeeeeee);
    NSLog(@"UWTableView");
}

@end
