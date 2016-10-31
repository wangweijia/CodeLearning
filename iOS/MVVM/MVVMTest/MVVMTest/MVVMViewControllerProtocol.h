//
//  MVVMBaseViewControllerProtocol.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#ifndef MVVMBaseViewControllerProtocol_h
#define MVVMBaseViewControllerProtocol_h


#endif /* MVVMBaseViewControllerProtocol_h */

@protocol MVVMBaseViewControllerProtocol <NSObject>


/**
 指向自己对应的 控制器模型
 */
@property (nonatomic, strong) id<MVVMViewControllerVMProtocol> baseVM;

@end
