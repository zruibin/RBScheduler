//
//  TestController.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年  Ruibin.Chow. All rights reserved.
//

#import "TestController.h"
#import "RBScheduler.h"

#define WAIT do {\
[self expectationForNotification:@"CreactionTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

//#define NOTIFY \
[[NSNotificationCenter defaultCenter] postNotificationName:@"CreactionTest" object:nil];

@interface TestController ()

@end

@implementation TestController

- (void)dealloc
{
    NSLog(@"TestController dealloc.....");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSThread detachNewThreadSelector:@selector(startTaskThread) toTarget:self withObject:nil];
}

- (void)startTaskThread
{
    NSInteger i = 0;
    while (1) {
        RBSchedulerObject *obj = [RBSchedulerObject new];
        [obj setSchedulerBlock:^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"obj block run....");
            
            dispatch_semaphore_t taskSemaphore = dispatch_semaphore_create(0);
            NSURL *url = [NSURL URLWithString:@"http://zruibin.cc/api/tag_0.json"];
            NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSessionTask *task = [[NSURLSession sessionWithConfiguration:configure] dataTaskWithURL:url
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSString *string = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
                    NSLog(@"response: %@", string);
                    dispatch_semaphore_signal(taskSemaphore);
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        int x = arc4random() % 100;
                       [[NSNotificationCenter defaultCenter] postNotificationName:@"updateLabel" object:[NSNumber numberWithInt:x]];
                    });
            }];
            [task resume];
            dispatch_semaphore_wait(taskSemaphore, DISPATCH_TIME_FOREVER);
            NSLog(@"obj run over....");
            return YES;
        }];
        [[RBScheduler sharedInstance] runTask:obj];
        ++i;
        if (i > 2) {
            NSLog(@"break...");
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
