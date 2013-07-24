//
//  Day15AppDelegate.m
//  Day15
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "Day15AppDelegate.h"
#import "RootViewController.h"


@implementation Day15AppDelegate

@synthesize window;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

