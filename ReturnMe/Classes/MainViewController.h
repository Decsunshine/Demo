//
//  MainViewController.h
//  ReturnMe
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"

#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kReward @"reward"
#define kPicture @"picture"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UIImageView *picture;
	IBOutlet UILabel *name;
	IBOutlet UILabel *email;
	IBOutlet UILabel *phone;
	
}

@property (nonatomic, retain) UIImageView *picture;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *email;
@property (nonatomic, retain) UILabel *phone;

- (IBAction)showInfo;

@end
