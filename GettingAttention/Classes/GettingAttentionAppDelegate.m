//
//  GettingAttentionAppDelegate.m
//  GettingAttention
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "GettingAttentionAppDelegate.h"
#import "GettingAttentionViewController.h"

@implementation GettingAttentionAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}




@end
