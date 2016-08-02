//
//  FirstViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "FirstViewControllerVM.h"
#import "FirstViewController.h"

@interface FirstViewControllerVM ()

@property (nonatomic, strong) NSArray<Doctor *> *dataSourceArray;

@end

@implementation FirstViewControllerVM

- (FirstViewController *)firstViewController {
    return (FirstViewController *)_targetVC;
}

#pragma - mark bind active
- (void)initialBind {
    [self bindRequest];
}

#pragma - mark netWork
- (void)bindRequest {
    _requestDoctors = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSString *urlStr = @"http://www.921cha.com/apps-server/doctor/search_doctor.json?_sdk=8.000000&_c=1&placeCode=310100&_ct=1470108968000&departmentId=-1&k=1AHMWBThBMXqxU&_n=2&timeInterval=&t=1&subDepartmentId=-1&pageNo=1&v=41700&udid=5269fb0c27870287e9fe4dd57d246f0b33f5b01c";
            NSURL *url = [NSURL URLWithString:urlStr];
            NSURLRequest *requst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
            //异步链接(形式1,较少用)
            [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSArray *result = dic[@"page"][@"result"];
                _dataSourceArray = [Doctor initWithArray:result];
                
                [subscriber sendNext:@"医生信息请求完成"];
                [subscriber sendCompleted];
            }];
            
            return nil;
        }];
    }];
}

#pragma - mark dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celllll"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    Doctor *doctor = _dataSourceArray[indexPath.row];
    cell.textLabel.text = doctor.name;
    return cell;
}

@end
