//
//  FirstViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "FirstViewControllerVM.h"
#import "FirstViewController.h"
#import "DoctorInfoCell.h"
#import "SecondViewController.h"

@interface FirstViewControllerVM ()

@property (nonatomic, strong) NSArray<Doctor *> *doctorsArray;

@end

@implementation FirstViewControllerVM

#pragma - mark 父类方法覆盖

- (FirstViewController *)targetVC {
    return (FirstViewController *)_targetVC;
}

- (void)initialBind {
    [self bindRequest];
    [self bindCellClicked];
}

#pragma - mark netWork
/**
 *  绑定 网络请求
 */
- (void)bindRequest {
    _requestDoctors = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSString *urlStr = @"http://www.921cha.com/apps-server/doctor/search_doctor.json?_sdk=8.000000&_c=1&placeCode=310100&_ct=1470108968000&departmentId=-1&k=1AHMWBThBMXqxU&_n=2&timeInterval=&t=1&subDepartmentId=-1&pageNo=1&v=41700&udid=5269fb0c27870287e9fe4dd57d246f0b33f5b01c";
            NSURL *url = [NSURL URLWithString:urlStr];
            NSURLRequest *requst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
            [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSArray *result = dic[@"page"][@"result"];
                _doctorsArray = [Doctor initWithArray:result];
                
                NSMutableArray *temp = [NSMutableArray array];
                for (Doctor *aDoctor in _doctorsArray) {
                    [temp addObject:[[DoctorInfoCellM alloc] initWithDoctor:aDoctor]];
                }
                self.dataSourceCellsArray = temp;
                
                [subscriber sendNext:@"医生信息请求完成"];
                [subscriber sendCompleted];
            }];
            
            return nil;
        }];
    }];
}

#pragma - mark cell clicked
- (void)bindCellClicked {
    _cellSelected = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath *input) {
        DoctorInfoCellM *doctorInfoCellM = _dataSourceCellsArray[input.row];
        NSLog(@"%@",doctorInfoCellM);
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            SecondViewController *vc = [[SecondViewController alloc] init];
            vc.preposeRequset = self.targetVC.preposeRequset;
            if (vc.preposeRequset) {
                //前置请求
                [[vc.baseVM.requestDoctors execute:doctorInfoCellM.doctor] subscribeNext:^(id x) {
                    [self vmPushViewController:vc animated:YES];
                }];
            }else{
                //后置请求
                vc.baseVM.doctor = doctorInfoCellM.doctor;
                [self vmPushViewController:vc animated:YES];
            }
            
            [subscriber sendNext:doctorInfoCellM];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

#pragma - mark UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSourceCellsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celllll"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"DoctorInfoCell" owner:nil options:nil].lastObject;
    }
    DoctorInfoCellM *doctor = _dataSourceCellsArray[indexPath.row];
    cell.doctorInfoCellM = doctor;
    return cell;
}

#pragma - mark other

@end
