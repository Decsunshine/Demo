//
//  EOCClass2.m
//  ReleaseTimer
//
//  Created by honglianglu on 2/16/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "EOCClass2.h"
#import "NSTimer+EOCBlocksSupport.h"

@interface EOCClass2 ()

@property (nonatomic, strong) NSTimer *pollTimer;

@end

@implementation EOCClass2

- (void)dealloc
{
    [_pollTimer invalidate];
    NSLog(@"---EOCClass Released---");
}

- (void)startPolling
{
    __weak EOCClass2 *weakSelf = self;
    _pollTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:1.0
                                                       block:^{
                                                           EOCClass2 *strongSelf = weakSelf;
                                                           [strongSelf p_doPoll];
                                                       }
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
