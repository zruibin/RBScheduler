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

+ (RBSaftLinkList *)CreateQueueWithCapacity:(NSUInteger)numItems;

- (instancetype)initWithCapacity:(NSUInteger)numItems;

/*将元素插入到队尾*/
- (void)insertObject:(RBSchedulerObject *)obj;

/*将元素插入到队头*/
- (void)insertHeadOfList:(RBSchedulerObject *)obj;

/*将元素插入到指定位置*/
- (void)insertObject:(RBSchedulerObject *)obj atIndex:(NSUInteger)index;

/*出队*/
- (RBSchedulerObject *)dequeueObject;

/*移除元素*/
- (void)removeObject:(RBSchedulerObject *)obj;

/*获取数组长度*/
- (NSUInteger)lenth;

/*获取数组总容量*/
- (NSUInteger)size;

/*检测数组是否为空*/
- (BOOL)isEmpty;

/*检测数组是否已满*/
- (BOOL)isFull;

/*清空数组内元素*/
- (void)clearLinkList;



@end
