//
//  EOCClass.m
//  ReleaseTimer
//
//  Created by honglianglu on 2/16/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "EOCClass.h"

@interface EOCClass ()

@property (nonatomic, strong) NSTimer *pollTimer;

@end

@implementation EOCClass

- (void)dealloc
{
    [_pollTimer invalidate];
    NSLog(@"---EOCClass Released---");
}

- (void)startPolling
{
    _pollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(p_doPoll)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopPolling
{
    [_pollTimer invalidate];
    _pollTimer = nil;
}

- (void)p_doPoll
{
    NSLog(@"--tick--%@", [NSDate date]);
}

@end
