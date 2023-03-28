//
//  MYViewController.m
//  MYYKit
//
//  Created by liumingzhi912@163.com on 03/28/2023.
//  Copyright (c) 2023 liumingzhi912@163.com. All rights reserved.
//

#import "MYViewController.h"
#import "Masonry.h"
#import <MYYKit/GMLayoutRate.h>
#import <MYYKit/defines.h>

#import "MYSixPasswordTestViewController.h"

@interface MYViewController ()

@property (nonatomic, strong) UIButton *sixPasswordButton;

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.sixPasswordButton];
    
    [self.sixPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-GMLAYOUTRATE(100));
    }];
}

-(UIButton *)sixPasswordButton
{
    if (!_sixPasswordButton) {
        _sixPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sixPasswordButton setTitle:@"sixPassword" forState:UIControlStateNormal];
        [_sixPasswordButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_sixPasswordButton addTarget:self action:@selector(sixPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sixPasswordButton;
}

-(void)sixPasswordAction {
    MYSixPasswordTestViewController *mvc = [[MYSixPasswordTestViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
