//
//  myDay01ViewController.m
//  myDay01
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay01ViewController.h"


@implementation myDay01ViewController

@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
	label.text	=	@"Hello World!!";
}

- (void)dealloc {
	[label release];
    [super dealloc];
}

@end
