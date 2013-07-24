//
//  MainViewController.h
//  myDay29
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

	IBOutlet UIImageView *RYU;
	
	NSString *soundFile;
}

@property (nonatomic, retain)UIImageView *RYU;
@property (nonatomic, retain)NSString *soundFile;

- (void)playSound:(NSString*)soundAct;

- (IBAction)jump:(id) sender;


- (IBAction)showInfo:(id) sender;

@end
