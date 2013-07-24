//
//  MainViewController.h
//  myDay25
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UIImage *flakeImage;
}

@property (nonatomic, retain) UIImage *flakeImage;

- (IBAction)showInfo;

@end
