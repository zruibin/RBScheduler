//
//  TestController.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年  Ruibin.Chow. All rights reserved.
//

#import "TestController.h"
#import "RBScheduler.h"

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
            return YES;
        }];
        [[RBScheduler sharedInstance] runTask:obj];
        ++i;
        if (i > 5) {
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
