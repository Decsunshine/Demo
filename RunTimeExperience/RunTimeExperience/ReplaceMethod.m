//
//  ReplaceMethod.m
//  RunTimeExperience
//
//  Created by honglianglu on 3/9/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "ReplaceMethod.h"
#import <objc/runtime.h>

@implementation ReplaceMethod

+ (void)load
{
    SEL swizzledSEL = @selector(printB);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSEL); // 之前一直用 class_getClassMethod ,结果总是不预期
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    
    SEL originalSEL = @selector(printA);
    class_replaceMethod(self, originalSEL, swizzledIMP, nil);
}

- (void)run
{
    [self printA];
}

- (void)printA
{
    NSLog(@"A");
}

- (void)printB
{
    NSLog(@"B");
}

@end
