//
//  FlowerColorTableAppDelegate.m
//  FlowerColorTable
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlowerColorTableAppDelegate.h"
#import "FlowerColorTableViewController.h"

@implementation FlowerColorTableAppDelegate


@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	[window addSubview:flowerColorTableViewController.view];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[flowerColorTableViewController release];
    [window release];
    [super dealloc];
}


@end
