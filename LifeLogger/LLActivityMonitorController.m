//
//  LLActivityMonitorController.m
//  LifeLogger
//
//  Created by leafduo on 3/22/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "LLActivityMonitorController.h"

@implementation LLActivityMonitorController

- (IBAction)printCurrentRunningApplications:(id)sender {
    for (NSRunningApplication *application in [[NSWorkspace sharedWorkspace] runningApplications]) {
        NSLog(@"%@", application.localizedName);
    };
}

@end
