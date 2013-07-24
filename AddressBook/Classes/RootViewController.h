//
//  RootViewController.h
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "ContactViewController.h"


@interface RootViewController : UITableViewController <AddViewControllerDelegate>{

	NSMutableArray *contacts;
	NSString *filePath;
}

- (void)addContact;

@end

@interface NSDictionary (sorting)

- (NSComparisonResult)compareContactNames:(NSDictionary *)contact;

@end

