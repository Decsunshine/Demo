//
//  NSTimer+EOCBlocksSupport.h
//  ReleaseTimer
//
//  Created by honglianglu on 2/16/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (EOCBlocksSupport)

+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats;

@end
