//
//  SomeObject.m
//  RunTimeExperience
//
//  Created by lu hongliang on 2019/3/28.
//  Copyright © 2019 decsunshine. All rights reserved.
//

#import "SomeObject.h"

@interface SomeObject ()

@property (nonatomic, copy) NSString *name;

@end

@implementation SomeObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"superS";
    }
    return self;
}

- (void)readName
{
    NSLog(@"%@", self.name);
}

- (void)privateMethod:(BOOL)isTure
{
    if (isTure) {
        NSLog(@"private method true");
    } else {
        NSLog(@"private method false");
    }
}


@end
