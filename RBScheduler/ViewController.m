//
//  ViewController.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年  Ruibin.Chow. All rights reserved.
//

#import "ViewController.h"
#import "TestController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(100, 100, 100, 60);
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)action
{
    [self.navigationController pushViewController:[TestController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
