//
//  MYSixPasswordTestViewController.m
//  MYYKit_Example
//
//  Created by gmy on 3/28/23.
//  Copyright © 2023 liumingzhi912@163.com. All rights reserved.
//

#import "MYSixPasswordTestViewController.h"

#import "UIColor+Extension.h"
#import "Masonry.h"
#import <MYYKit/MYCodeInputView.h>
#import <MYYKit/defines.h>
#import <MYYKit/GMLayoutRate.h>

@interface MYSixPasswordTestViewController ()

@property (nonatomic, strong) MYCodeInputView *inputView;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation MYSixPasswordTestViewController

#pragma mark - init UI
-(void)initUI
{
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.cancelButton];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-GMLAYOUTRATE(100));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBString:@"#FFFFFF"];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initUI];
}

#pragma mark - button actions
-(void)cancelAction
{
    [self.inputView clear];
}

#pragma mark - getters and setters
-(UIView *)inputView
{
    if (!_inputView) {
        _inputView = [MYCodeInputView InitCodeInputViewWithFrame:CGRectMake(0,GMLAYOUTRATE(221) - 64, DEVICE_WIDTH, GMLAYOUTRATE(50)) CodeNums:6];
        _inputView.borderColor = [UIColor colorWithRGBString:@"#999999"];
        _inputView.heighlightBorderColor = [UIColor colorWithRGBString:@"#1E86FF"];
        __weak typeof(self) weakSelf = self;
        _inputView.completedBlock = ^(NSString *text) {
            NSLog(@"text = %@", text);
            //            if (weakSelf.completedBlock) {
            //                weakSelf.completedBlock(text);
            //            }
        };
    }
    return _inputView;
}

-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"clear" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(NSString *)codeText
{
    return self.inputView.codeText;
}

@end
