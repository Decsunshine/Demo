//
//  FlowerDetailViewController.m
//  FlowerInfoNavigator
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FlowerDetailViewController.h"


@implementation FlowerDetailViewController

@synthesize detailURL;
@synthesize detailWebView;

- (void)viewDidLoad {
    [detailWebView loadRequest:[NSURLRequest requestWithURL:detailURL]];
	[super viewDidLoad];
	
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[detailURL release];
	[detailWebView release];
    [super dealloc];
}


@end
