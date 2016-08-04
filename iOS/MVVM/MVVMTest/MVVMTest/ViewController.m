//
//  ViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@property (weak, nonatomic) IBOutlet UIButton *firstButton2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //rac 绑定按钮点击事件
    [[_firstButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:firstViewController animated:YES];
    }];
    
    //正常为按钮绑定点击事件
    [_firstButton2 addTarget:self action:@selector(firstButton2Clicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)firstButton2Clicked:(UIButton *)btn {
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    firstViewController.preposeRequset = YES;
    [[firstViewController.baseVM.requestDoctors execute:nil] subscribeNext:^(id x) {
        [self.navigationController pushViewController:firstViewController animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
