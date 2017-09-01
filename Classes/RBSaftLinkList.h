//
//  RBSaftLinkList.h
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RBSaftLinkList : NSObject

@property(nonatomic, assign, readonly, getter=length) NSUInteger count;


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
 add elements into the end of the queue

 @param obj queue object
 */
- (void)appendObject:(NSObject *)obj;

/**
 Insert an element into the header

 @param obj  queue object
 */
- (void)insertHeadOfList:(NSObject *)obj;

/**
 Inserts an element into the specified location

 @param obj queue object
 @param index location
 */
- (void)insertObject:(NSObject *)obj at:(NSUInteger)index;

/**
 dequeue

 @return queue object
 */
- (NSObject *)dequeueObject;

/**
 Removing Elements

 @param obj queue object
 */
- (void)removeObject:(NSObject *)obj;

/**
 Get the current length of queue

 @return the current length of queue
 */
- (NSUInteger)length;

/**
 Get the capacity of queue
 
 @return the capacity of queue
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
