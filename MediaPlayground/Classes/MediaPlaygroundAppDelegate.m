//
//  MediaPlaygroundAppDelegate.m
//  MediaPlayground
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MediaPlaygroundAppDelegate.h"
#import "MediaPlaygroundViewController.h"

@implementation MediaPlaygroundAppDelegate

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
