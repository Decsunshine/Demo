//
//  myDay23AppDelegate.m
//  myDay23
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import "myDay23AppDelegate.h"

#import "ChangeRectView.h"

@implementation myDay23AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	CGRect windowRect = [[UIScreen mainScreen] applicationFrame];
	
    UIWindow *window = [[UIWindow alloc] initWithFrame:windowRect];
    
	[window setBackgroundColor:[UIColor greenColor]];
    
    [self setWindow:window];
    
    CGRect changeRect1 = { 80.0, 100.0, 160.0, 100.0 };
    
	ChangeRectView *changeView1 = [[ChangeRectView alloc] initWithFrame:changeRect1];
    
	[changeView1 setBackgroundColor:[UIColor darkGrayColor]];
	
    CGRect changeRect2 = { 80.0, 300.0, 80.0, 50.0 };
	
    ChangeRectView *changeView2 = [[ChangeRectView alloc] initWithFrame:changeRect2];
	
    [changeView2 setBackgroundColor:[UIColor redColor]];
    
    [window addSubview: changeView2];
	
    [window addSubview: changeView1];
	
    [window makeKeyAndVisible];
    
    
    [changeView1 ChangeView];
	
    [changeView2 FlyView];
    
    [window release];
    [changeView1 release];
    [changeView2 release];
}


- (void)dealloc {
    [_window release];
    [super dealloc];
}


@end
