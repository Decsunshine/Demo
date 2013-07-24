//
//  myDay31AppDelegate.m
//  myDay31
//
//  Created by 路宏亮 on 12-3-16.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay31AppDelegate.h"
#import "myDay31ViewController.h"

@implementation myDay31AppDelegate

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
