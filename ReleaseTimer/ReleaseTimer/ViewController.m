//
//  ViewController.m
//  ReleaseTimer
//
//  Created by honglianglu on 2/16/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SecondViewController *vc = [SecondViewController new];
    [vc.view setBackgroundColor:[UIColor lightGrayColor]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
