//
//  FlipsideViewController.h
//  ReturnMe
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kReward @"reward"
#define kPicture @"picture"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	id <FlipsideViewControllerDelegate> delegate;
	
	NSArray *preferenceNames;
	NSArray *preferenceObjects;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

@property (nonatomic, assign) NSArray *preferenceNames;
@property (nonatomic, assign) NSArray *preferenceObjects;

- (IBAction)done;


@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

