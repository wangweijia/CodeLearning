//
//  MVVMBaseViewController.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBaseViewControllerVM.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MVVMBaseViewController : UIViewController {
    MVVMBaseViewControllerVM *_baseVM;
}

/**
 *  strong vm
 */
//@property (nonatomic, strong) MVVMBaseViewControllerVM *baseVM;

/**
 *  是否前置请求（默认为NO）
 */
@property (nonatomic, assign) BOOL preposeRequset;

- (MVVMBaseViewControllerVM *)baseVM;

- (void)setBaseVM:(MVVMBaseViewControllerVM *)baseVM;

@end
