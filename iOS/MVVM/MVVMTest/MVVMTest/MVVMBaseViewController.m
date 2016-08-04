//
//  MVVMBaseViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "MVVMBaseViewController.h"

@interface MVVMBaseViewController ()

@end

@implementation MVVMBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        if (!self.baseVM) {
            NSString *className = NSStringFromClass(self.class);
            NSString *vmName = [NSString stringWithFormat:@"%@%@",className,@"VM"];
            Class vmClass = NSClassFromString(vmName);
            if (vmClass) {
                self.baseVM = [[vmClass alloc] initWithViewController:self];
            }
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (MVVMBaseViewControllerVM *)baseVM {
    return _baseVM;
}

- (void)setBaseVM:(MVVMBaseViewControllerVM *)baseVM {
    _baseVM = baseVM;
}

@end
