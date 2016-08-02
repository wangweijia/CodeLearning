//
//  MVVMBaseViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "MVVMBaseViewControllerVM.h"


@interface MVVMBaseViewControllerVM ()

@end

@implementation MVVMBaseViewControllerVM

- (instancetype)initWithViewController:(UIViewController *)vc {
    self = [super init];
    if (self) {
        self.targetVC = vc;
        
        [self initialBind];
    }
    return self;
}

- (void)setTargetVC:(UIViewController *)targetVC {
    _targetVC = targetVC;
}

- (UIViewController *)targetVC {
    return _targetVC;
}

- (void)initialBind {
}

@end
