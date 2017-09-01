//
//  RBSaftLinkList.m
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import "RBSaftLinkList.h"
#import <pthread.h>

@interface RBSaftLinkList ()

@property(nonatomic, strong) NSMutableArray *linkedList;
@property(nonatomic, assign) NSUInteger capacity;
@property(nonatomic, assign) pthread_mutex_t mutex;

@end

@implementation RBSaftLinkList

#pragma mark - public method

+ (RBSaftLinkList *)CreateQueueWithCapacity:(NSUInteger)numItems
{
    RBSaftLinkList *linkList = [[RBSaftLinkList alloc] initWithCapacity:numItems];
    return linkList;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self) {
        _linkedList = [[NSMutableArray alloc] initWithCapacity:numItems];
        _capacity = numItems;
        pthread_mutex_init(&_mutex, NULL);
    }
    return self;
}

- (void)appendObject:(NSObject *)obj
{
    pthread_mutex_lock(&_mutex);
    if (_linkedList.count < _capacity) {
        [_linkedList addObject:obj];
    }
    pthread_mutex_unlock(&_mutex);
}

- (void)insertHeadOfList:(NSObject *)obj
{
    pthread_mutex_lock(&_mutex);
    if (_linkedList.count < _capacity) {
        [_linkedList insertObject:obj atIndex:0];
    }
    pthread_mutex_unlock(&_mutex);
}

- (void)insertObject:(NSObject *)obj at:(NSUInteger)index
{
    pthread_mutex_lock(&_mutex);
    if (_linkedList.count < _capacity) {
        [_linkedList insertObject:obj atIndex:index];
    }
    pthread_mutex_unlock(&_mutex);
}

- (NSObject *)dequeueObject
{
    NSObject *obj = nil;
    pthread_mutex_lock(&_mutex);
    if (_linkedList.count < _capacity && ![self isEmpty]) {
        obj = [_linkedList firstObject];
        [_linkedList removeObjectAtIndex:0];
    }
    pthread_mutex_unlock(&_mutex);
    return obj;
}

- (void)removeObject:(NSObject *)obj
{
    pthread_mutex_lock(&_mutex);
    if ([_linkedList containsObject:obj]) {
        [_linkedList removeObject:obj];
    }
    pthread_mutex_unlock(&_mutex);
}

- (NSUInteger)length
{
    pthread_mutex_lock(&_mutex);
    NSUInteger lenth = [_linkedList count];
    pthread_mutex_unlock(&_mutex);
    return lenth;
}

- (NSUInteger)size
{
    return _capacity;
}

- (BOOL)isEmpty
{
    if (_linkedList.count == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isFull
{
    if (_linkedList.count == _capacity) {
        return YES;
    }
    return NO;
}

- (void)clearLinkList
{
    pthread_mutex_lock(&_mutex);
    [_linkedList removeAllObjects];
    pthread_mutex_unlock(&_mutex);
}


@end
