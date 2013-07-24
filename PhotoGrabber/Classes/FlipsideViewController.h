//
//  FlipsideViewController.h
//  PhotoGrabber
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
#import <MessageUI/MessageUI.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController 
<UINavigationControllerDelegate,MFMailComposeViewControllerDelegate> {
	id <FlipsideViewControllerDelegate> delegate;
	IBOutlet UIBarButtonItem *feedback;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;

- (IBAction)sendFeedback:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

