//
//  AddViewController.h
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableCell.h"
static const int KEYBOARD_HEIGHT = 200;

@protocol AddViewControllerDelegate;


@interface AddViewController : UIViewController <UITableViewDataSource,EditableCellDelegate>{
	id <AddViewControllerDelegate>delegate;
	IBOutlet UITableView *table;
	NSArray *fields;
	NSMutableDictionary *data;
	BOOL keyboardShown;
	EditableCell *currentCell;

}

@property (nonatomic, assign) id<AddViewControllerDelegate>delegate;
@property (nonatomic, retain) IBOutlet UITableView *table;
@property (readonly, copy, getter = values)NSDictionary *data;

- (IBAction)doneAdding:sender;
- (NSDictionary *)values;
- (void)clearFields;
@end

@protocol AddViewControllerDelegate
- (void)addViewControllerDidFinishAdding:(AddViewController *)controller;
@end
