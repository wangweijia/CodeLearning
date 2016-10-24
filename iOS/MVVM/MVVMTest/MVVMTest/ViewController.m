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

@property (nonatomic, strong) RACSignal *signal;

@property (nonatomic, strong) RACSubject *subject;

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
    
    _signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
//        [subscriber sendCompleted];
        
        return nil;
    }];
    
    [_signal subscribeNext:^(id x) {
        NSLog(@"aaaaaaaaa");
    }];

    _subject = [RACSubject subject];
    
    [_subject subscribeNext:^(id x) {
        NSLog(@"ccccccccc%@",x);
    }];
    
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        for (NSInteger i = 0; i < 100; i++) {
//            sleep(3);
//            NSLog(@"-=-=-=-=-=%@=-=-=-=-=-",@(i));
//            [_subject sendNext:@(i)];
//            [_subject sendCompleted];
//        }
//    });
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

- (IBAction)button1:(id)sender {
    [_signal subscribeNext:^(id x) {
        NSLog(@"button1 %@",x);
    }];
    
    [_subject subscribeNext:^(id x) {
        NSLog(@"button1 %@",x);
    }];
}

- (IBAction)button2:(id)sender {
    [_signal subscribeNext:^(id x) {
        NSLog(@"button2 %@",x);
    }];
    
    [_subject subscribeNext:^(id x) {
        NSLog(@"button2 %@",x);
    }];
}

@end
