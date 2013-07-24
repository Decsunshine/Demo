//
//  SimonSaysAppDelegate.m
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "SimonSaysAppDelegate.h"
#import "SimonSaysViewController.h"

@implementation SimonSaysAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
