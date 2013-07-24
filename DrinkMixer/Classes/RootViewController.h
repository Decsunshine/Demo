//
//  RootViewController.h
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@interface RootViewController : UITableViewController {
	NSMutableArray* drinks;
	
	IBOutlet UIBarButtonItem *addButtonItem;
}

@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) UIBarButtonItem *addButtonItem;

- (IBAction) addButtonPressed: (id)sender;

@end
