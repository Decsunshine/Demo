//
//  ViewController.m
//  CopyExperience
//
//  Created by honglianglu on 3/10/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "ViewController.h"
#import "DeepCopy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DeepCopy new] run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
