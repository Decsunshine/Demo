//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkDetailViewController.h"


@interface AddDrinkViewController : DrinkDetailViewController {

	BOOL keyboardVisible;
	
	NSMutableArray *drinkArray;
}
@property (nonatomic, retain) NSMutableArray* drinkArray;

- (IBAction) save: (id) sender;

- (IBAction) cancel: (id) sender;

- (void) keyboardDidShow: (NSNotification*) notif;

- (void) keyboardDidHide: (NSNotification*) notif;

@end
