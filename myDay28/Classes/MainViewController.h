//
//  MainViewController.h
//  myDay28
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>



@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {

	IBOutlet UIImageView *UFO;
	
	CGPoint currentTouch;
	
	NSString *soundFile;
	
}

@property (nonatomic, retain)UIImageView *UFO;

@property (nonatomic, retain)NSString *soundFile;

- (void)playSound:(NSString*)soundAct;

- (IBAction)showInfo;

@end
