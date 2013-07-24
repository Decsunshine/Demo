//
//  Best_FriendViewController.h
//  Best Friend
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface Best_FriendViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate> {
	IBOutlet UILabel *name;
	IBOutlet UIImageView *photo;
}

@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UIImageView *photo;

- (IBAction)newBFF:(id)sender;

@end

