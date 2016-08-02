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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[_firstButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
                
        [self.navigationController pushViewController:firstViewController animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
