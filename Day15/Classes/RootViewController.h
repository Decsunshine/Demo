//
//  RootViewController.h
//  Day15
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RootViewController : UITableViewController {

	NSMutableArray *listData;
	UITextField *rowNameField;
}

@property (nonatomic, retain) NSMutableArray *listData;

@property (nonatomic, retain) UITextField *rowNameField;

@end
