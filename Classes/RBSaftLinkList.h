//
//  RBSaftLinkList.h
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBSchedulerObject.h"

@interface RBSaftLinkList : NSObject

@property(nonatomic, assign, readonly, getter=lenth) NSUInteger count;


/**
 Factory method create RBSaftLinkList object

 @param numItems the size of queue
 @return RBSaftLinkList object
 */
+ (RBSaftLinkList *)CreateQueueWithCapacity:(NSUInteger)numItems;

/**
 Initialization queue

 @param numItems the size of queue
 @return RBSaftLinkList object
 */
- (instancetype)initWithCapacity:(NSUInteger)numItems;

/**
 Insert elements into the end of the queue

 @param obj Task object
 */
- (void)insertObject:(RBSchedulerObject *)obj;

/**
 Insert an element into the header

 @param obj  Task object
 */
- (void)insertHeadOfList:(RBSchedulerObject *)obj;

/**
 Inserts an element into the specified location

 @param obj Task object
 @param index location
 */
- (void)insertObject:(RBSchedulerObject *)obj atIndex:(NSUInteger)index;

/**
 dequeue

 @return Task object
 */
- (RBSchedulerObject *)dequeueObject;

/**
 Removing Elements

 @param obj Task object
 */
- (void)removeObject:(RBSchedulerObject *)obj;

/**
 Get the length of queue

 @return the length of queue
 */
- (NSUInteger)lenth;

/**
 Get the size of queue
 
 @return the size of queue
 */
- (NSUInteger)size;

/**
 Checking if the queue is empty

 @return result
 */
- (BOOL)isEmpty;

/**
 Checking if the queue is full
 
 @return result
 */
- (BOOL)isFull;

/**
 Empty all elements
 */
- (void)clearLinkList;


@end
