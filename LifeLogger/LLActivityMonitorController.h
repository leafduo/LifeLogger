//
//  LLActivityMonitorController.h
//  LifeLogger
//
//  Created by leafduo on 3/22/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLActivityMonitorController : NSObject

+ (instancetype)sharedMonitor;
- (void)beginMonitor;

@end
