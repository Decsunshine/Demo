//
//  ChapeHillAppDelegate.m
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ChapeHillAppDelegate.h"
#import "ChapeHillViewController.h"

@implementation ChapeHillAppDelegate

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
