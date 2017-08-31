//
//  ViewController.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年  Ruibin.Chow. All rights reserved.
//

#import "ViewController.h"
#import "RBScheduler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSThread detachNewThreadSelector:@selector(startTaskThread) toTarget:self withObject:nil];
    [[RBScheduler sharedInstance] run];
}

- (void)startTaskThread
{
    NSInteger i = 0;
    while (1) {
        [NSThread sleepForTimeInterval:5];
        [[RBScheduler sharedInstance] runTask:[NSObject new]];
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


@end
