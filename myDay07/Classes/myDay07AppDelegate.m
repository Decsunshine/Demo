//
//  myDay07AppDelegate.m
//  myDay07
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay07AppDelegate.h"

@implementation myDay07AppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
