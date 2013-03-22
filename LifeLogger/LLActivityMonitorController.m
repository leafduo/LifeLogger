//
//  LLActivityMonitorController.m
//  LifeLogger
//
//  Created by leafduo on 3/22/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "LLActivityMonitorController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LLActivityMonitorController ()

@property (nonatomic, strong) IBOutlet NSTextView *textView;

@end

@implementation LLActivityMonitorController {
    NSTimer *_timer;
}

static LLActivityMonitorController *_sharedMonitor;

+ (instancetype)sharedMonitor {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMonitor = [[LLActivityMonitorController alloc] initPrivate];
    });
    return _sharedMonitor;
}

- (instancetype)init {
    return [[self class] sharedMonitor];
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        ;
    }
    return self;
}

- (void)awakeFromNib {
    [_textView setEditable:NO];
}

- (void)beginMonitor {
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(printCurrentRunningApplications:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)printCurrentRunningApplications:(NSTimer *)timer {
    for (NSRunningApplication *application in [[NSWorkspace sharedWorkspace] runningApplications]) {
        if (application.active) {
            NSLog(@"%@", application.localizedName);
            if (_textView) {
                NSAttributedString *attributedName =  [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", application.localizedName]];
                [_textView.textStorage appendAttributedString:attributedName];
            }
        }
    };
}

@end
