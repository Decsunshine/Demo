//
//  SpotOnAppDelegate.m
//  SpotOn
//
//  Created by 路宏亮 on 12-4-3.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "SpotOnAppDelegate.h"
#import "SpotOnViewController.h"

@implementation SpotOnAppDelegate

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
