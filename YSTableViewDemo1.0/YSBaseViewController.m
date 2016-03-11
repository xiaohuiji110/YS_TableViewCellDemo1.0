//
//  YSBaseViewController.m
//  YSTableViewDemo1.0
//
//  Created by youzi on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#import "YSBaseViewController.h"

static NSInteger const hex6EColor = 0xeeeeee;

@interface YSBaseViewController ()

@end

@implementation YSBaseViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.tableView = [[YSTableView alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];

        
        }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = HexRGB(hex6EColor);
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"daohang_bg.png"]
                                                  forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *navBarTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                           NSFontAttributeName : [UIFont boldSystemFontOfSize:19]};
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}



@end
