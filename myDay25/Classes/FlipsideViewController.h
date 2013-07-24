//
//  FlipsideViewController.h
//  myDay25
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

