//
//  RBScheduler.h
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBSchedulerObject.h"

@interface RBScheduler : NSObject


+ (instancetype)sharedInstance;


/**
 启动任务调度器
 */
- (void)run;

- (void)runTask:(RBSchedulerObject *)schedulerObject;

@end
