//
//  ContactViewController.m
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"
#import "EditableCell.h"

@implementation ContactViewController

@synthesize person;

- (void)updateTitle
{
	[self.navigationItem setTitle:[person valueForKey:@ "Name"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	static NSString *MyIdentifier = @ "NormalCell";
	
	UITableViewCell *cell = [talbeView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	
	NSString *key = [[person allKeys] objectAtIndex:indexPath.row];
	NSString *value = [person valueForKey:key];
	UILabel *label = [cell textLabel];
	
	label.text = [NSString stringWithFormat:@ "%@:%@",key,value];
	return cell;
}

- (NSString *)tableView:(UITableView *)table titleForHeaderInSection:(NSInteger)section
{
	return nil;
}

- (BOOL)tableView:(UITableView *)table canEditRowAtIndexPath:(NSindexPath *)indexPath
{
	return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[person release];
    [super dealloc];
}


@end
