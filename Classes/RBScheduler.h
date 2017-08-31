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
 Start task scheduler
 */
- (void)run;


/**
 Add and execute scheduling tasks

 @param schedulerObject Task object
 */
- (void)runTask:(RBSchedulerObject *)schedulerObject;

@end
