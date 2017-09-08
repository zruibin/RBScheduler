//
//  RBScheduler.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import "RBScheduler.h"
#import "RBSaftLinkList.h"

@interface RBSchedulerObject : NSObject
/**
 The return value of the scheduler block must be true, and then the scheduler can be continue running.
 NOTE: Reference cycles can be caused!!!
 */
@property(nonatomic, copy) void (^ schedulerBlock)(void);
@end

@implementation RBSchedulerObject
@end



static NSString * const SCHEDULER_QUEUE_NAME = @"scheduler.queue.RBScheduler";
static const NSUInteger sizeOfQueue = 1500;
static NSString * const TASK_QUEUE_NAME = @"serial.queue.RBScheduler";

@interface RBScheduler ()

@property (assign, readwrite, getter=isExecuting) BOOL executing;
@property (nonatomic, strong) RBSaftLinkList *taskList;
@property (nonatomic, strong) dispatch_semaphore_t runSemaphore;
@property (nonatomic, strong) dispatch_semaphore_t taskSemaphore;
@property (nonatomic, strong) dispatch_queue_t dispatchTaskQueue;

@end

@implementation RBScheduler

+ (instancetype)sharedInstance
{
    static RBScheduler *scheduler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (scheduler == nil) {
            scheduler = [[super allocWithZone:NULL] init];
        }
    });
    return scheduler;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [RBScheduler sharedInstance];
}

- (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return [RBScheduler sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taskList = [RBSaftLinkList CreateQueueWithCapacity:sizeOfQueue];
        _runSemaphore = dispatch_semaphore_create(1);
        _taskSemaphore = dispatch_semaphore_create(0);
        _dispatchTaskQueue = dispatch_queue_create([TASK_QUEUE_NAME UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}


#pragma mark - Private

- (void)startTaskThread
{
    /*常驻线程，串行执行*/
    [[NSThread currentThread] setName:SCHEDULER_QUEUE_NAME];
    while (YES) {
        @autoreleasepool {
            dispatch_semaphore_wait(self.runSemaphore, DISPATCH_TIME_FOREVER);
            
            RBSchedulerObject *schedulerObj = (RBSchedulerObject *)[self.taskList dequeueObject];
            if (schedulerObj == nil) {
                dispatch_semaphore_signal(self.runSemaphore);
                dispatch_semaphore_wait(self.taskSemaphore, DISPATCH_TIME_FOREVER);
            } else {
//                __weak typeof(RBScheduler *) wself = self;
                if (schedulerObj.schedulerBlock) {
                    schedulerObj.schedulerBlock();
                    dispatch_semaphore_signal(self.runSemaphore);
                } else {
                    dispatch_semaphore_signal(self.runSemaphore);
                }
            }
        }
    }
}

#pragma mark - Public

- (void)run
{
    [NSThread detachNewThreadSelector:@selector(startTaskThread) toTarget:self withObject:nil];
    self.executing = YES;
}

- (void)runTask:(void (^)(void))schedulerBlock
{
    if (schedulerBlock) {
        RBSchedulerObject *obj = [[RBSchedulerObject alloc] init];
        obj.schedulerBlock = schedulerBlock;
        BOOL empty = [self.taskList isEmpty];
        [self.taskList appendObject:obj];
        if (empty) {
            dispatch_semaphore_signal(self.taskSemaphore);
        }
    }
}

- (void)dispatchTask:(void (^)(void))schedulerBlock
{
    dispatch_async(_dispatchTaskQueue, schedulerBlock);
}

@end
