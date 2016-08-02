//
//  ViewController.m
//  RAC_01
//
//  Created by apple on 01/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.run1(@"sss").run2(@"aaa");
    [[self run1](@"eeee") run2](@"ccc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ViewController *(^)(NSString *param))run1 {
    return ^(NSString *param) {
        NSLog(@"run1:%@",param);
        return self;
    };
}

- (ViewController *(^)(NSString *param))run2 {
    return ^(NSString *param) {
        NSLog(@"run2:%@",param);
        return self;
    };
}


@end
