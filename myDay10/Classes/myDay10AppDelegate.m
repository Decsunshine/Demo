//
//  myDay10AppDelegate.m
//  myDay10
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay10AppDelegate.h"
#import "myDay10ViewController.h"

@implementation myDay10AppDelegate

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
