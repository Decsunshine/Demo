//
//  myDay30AppDelegate.m
//  myDay30
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay30AppDelegate.h"
#import "MainViewController.h"

@implementation myDay30AppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
