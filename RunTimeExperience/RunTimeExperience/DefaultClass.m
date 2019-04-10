//
//  DefaultClass.m
//  RunTimeExperience
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 decsunshine. All rights reserved.
//

#import "DefaultClass.h"

@implementation DefaultClass

- (void)printB
{
    NSLog(@"instance method printB");
}

+ (void)printB
{
    NSLog(@"class method printB");
}

- (void)printC
{
    NSLog(@"instance method printC");
}

+ (void)printC
{
    NSLog(@"class method printC");
}

@end
