//
//  SecondViewController.m
//  ReleaseTimer
//
//  Created by honglianglu on 2/16/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "SecondViewController.h"
#import "EOCClass.h"
#import "EOCClass2.h"

@interface SecondViewController ()

@property (nonatomic, strong) id timer;

@end

@implementation SecondViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.timer = [EOCClass new];
    self.timer = [EOCClass2 new];
    [self.timer startPolling];
}

- (void)dealloc
{
//    [self.timer stopPolling];
}

@end
