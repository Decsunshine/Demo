//
//  FlagQuizAppDelegate.m
//  FlagQuiz
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlagQuizAppDelegate.h"
#import "MainViewController.h"

@implementation FlagQuizAppDelegate


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
