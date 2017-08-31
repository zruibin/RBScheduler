//
//  RBSchedulerObject.h
//  RBScheduler
//
//  Created by  Ruibin.Chow on 2017/8/31.
//  Copyright © 2017年 Ruibin.Chow All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBSchedulerObject : NSObject

/**
 The return value of the scheduler block must be true, and then the scheduler can continue running.
 NOTE: Reference cycles can be caused!!!
 */
@property (nonatomic, copy) BOOL (^ schedulerBlock)(void);

@end
