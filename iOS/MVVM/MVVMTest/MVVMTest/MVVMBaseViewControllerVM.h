//
//  MVVMBaseViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <UIKit/UIKit.h>

@interface MVVMBaseViewControllerVM : NSObject {
    UIViewController *_targetVC;
}

/**
 *  weak target ViewController
 */
//@property (nonatomic, weak) UIViewController *targetVC;

/**
 *  初始化方法
 *
 *  @param vc 对应绑定的 ViewController
 */
- (instancetype)initWithViewController:(UIViewController *)vc;

/**
 *  vm 中直接推出控制器
 *
 *  @param viewController 需要推出的控制器
 */
- (void)vmPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  targetVC set方法
 */
- (void)setTargetVC:(UIViewController *)targetVC;

/**
 *  targetVC get方法
 */
- (UIViewController *)targetVC;

@end
