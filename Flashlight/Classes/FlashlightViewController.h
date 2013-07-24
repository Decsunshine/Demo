//
//  FlashlightViewController.h
//  Flashlight
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOnffToggle @"onOff"
#define kBrightnessLevel @"brightness"

@interface FlashlightViewController : UIViewController {
	IBOutlet UIView *lightSource;
	IBOutlet UISwitch *toggleSwitch;
	IBOutlet UISlider *brightnessSlider;
}
	
@property (nonatomic, retain) UIView *lightSource;
@property (nonatomic, retain) UISwitch *toggleSwitch;
@property (nonatomic, retain) UISlider *brightnessSlider;

- (IBAction) setLightSourceAlphaValue;

@end

