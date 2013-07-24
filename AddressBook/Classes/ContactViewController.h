//
//  ContactViewController.h
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ContactViewController : UIViewController <UITableViewDataSource>{

	NSDictionary *person;
}

@property(nonatomic, retain) NSDictionary *person;

-(void)updateTitle;

@end
