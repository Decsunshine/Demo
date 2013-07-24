//
//  MainViewController.h
//  myDay27
//
//  Created by 路宏亮 on 12-3-12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>
#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {

	IBOutlet UIImageView *PacMan;
	
	NSString *soundFile;
	
}

@property(nonatomic, retain)NSString *soundFile;

- (void)playSound:(NSString*)soundAct;

- (IBAction)onLeft:(id)sender;

- (IBAction)onRight:(id)sender;

- (IBAction)onUp:(id)sender;

- (IBAction)onDown:(id)sender;

- (IBAction)showInfo;

@end
