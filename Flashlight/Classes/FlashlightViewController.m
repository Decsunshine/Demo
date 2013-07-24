//
//  FlashlightViewController.m
//  Flashlight
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlashlightViewController.h"

@implementation FlashlightViewController

@synthesize lightSource;
@synthesize toggleSwitch;
@synthesize brightnessSlider;

- (void) viewWillDisappear:(BOOL)animated
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setBool:toggleSwitch.on forKey:kOnffToggle];
	[userDefaults setFloat:brightnessSlider.value forKey:kBrightnessLevel];
	
	[super viewWillDisappear:animated];
}

- (void) viewDidLoad {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	brightnessSlider.value = [userDefaults floatForKey:kBrightnessLevel];
	toggleSwitch.on = [userDefaults boolForKey:kOnffToggle];
	
	if ([userDefaults boolForKey:kOnffToggle]) {
		lightSource.alpha = [userDefaults floatForKey:kBrightnessLevel];
	} else {
		lightSource.alpha = 0.0;
	}
	[super viewDidLoad];
}

- (IBAction) setLightSourceAlphaValue
{
	if (toggleSwitch.on) {
		lightSource.alpha = brightnessSlider.value;
	} else {
		lightSource.alpha = 0.0;
	}

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[lightSource release];
	[toggleSwitch release];
	[brightnessSlider release];
    [super dealloc];
}

@end
