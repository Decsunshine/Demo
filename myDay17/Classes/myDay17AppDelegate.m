//
//  myDay17AppDelegate.m
//  myDay17
//
//  Created by 路宏亮 on 12-2-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay17AppDelegate.h"
#import "myDay17ViewController.h"

@implementation myDay17AppDelegate

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
