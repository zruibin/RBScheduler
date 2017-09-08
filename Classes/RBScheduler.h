//
//  RBScheduler.h
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBScheduler : NSObject

@property (assign, readonly, getter=isExecuting) BOOL executing;

+ (instancetype)sharedInstance;

/**
 Start running the task scheduler.
 */
- (void)run;

/**
 Add and execute scheduling tasks block.

 The return value of the scheduler block must be true, and then the scheduler can be continue running.
 NOTE: Reference cycles can be caused!!!

 @param schedulerBlock Task block
 */
- (void)runTask:(void (^)(void))schedulerBlock;


/**
 Dispatch task block into system serial queue

 @param schedulerBlock Task block
 */
- (void)dispatchTask:(void (^)(void))schedulerBlock;

@end
