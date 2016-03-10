//
//  NSArray+DeepCopy.m
//  CopyExperience
//
//  Created by honglianglu on 3/10/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//
// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Collections/Articles/Copying.html#//apple_ref/doc/uid/TP40010162-SW3

#import "NSArray+DeepCopy.h"

@implementation NSArray (DeepCopy)

- (NSArray *)dp_copy
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(dp_copy)]) {
            [array addObject:[obj dp_copy]];
        } else if ([obj respondsToSelector:@selector(copyWithZone:)]) {
            [array addObject:[obj copy]];
        } else {
            [array addObject:obj];
        }
    }];
    return [array copy];
}

@end
