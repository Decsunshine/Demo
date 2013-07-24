//
//  MultipleViewsViewController.m
//  MultipleViews
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MultipleViewsViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation MultipleViewsViewController

@synthesize firstViewController;
@synthesize secondViewController;
@synthesize thirdViewController;

- (void)viewDidLoad{
	[self loadFirstView:nil];
	[super viewDidLoad];
}

- (IBAction) loadFirstView:(id)sender
{
	[self clearView];
	[self.view insertSubview:firstViewController.view atIndex:0];
}

- (IBAction) loadSecondView:(id)sender
{
	[self clearView];
	[self.view insertSubview:secondViewController.view atIndex:0];
}

- (IBAction) loadThirdView:(id)sender
{
	[self clearView];
	[self.view insertSubview:thirdViewController.view atIndex:0];
}

- (void)clearView {
	if (firstViewController.view.superview) {
		[firstViewController.view removeFromSuperview];
	} else if (secondViewController.view.superview) {
		[secondViewController.view removeFromSuperview];
	} else {
		[thirdViewController.view removeFromSuperview];
	}

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[firstViewController release];
	[secondViewController release];
	[thirdViewController release];
    [super dealloc];
}

@end
