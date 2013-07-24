//
//  RootViewController.m
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "AddressBookAppDelegate.h"                   //!@#$%^&
#import "RootViewController.h"

@implementation RootViewController


- (void)viewDidLoad
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *directory = [paths objectAtIndex:0];
	
	filePath = [[NSString alloc]initWithString:[directory stringByAppendingPathComponent:@ "contacts"]];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if ([fileManager fileExistsAtPath:filePath]) {
		
		contacts = [[NSMutableArray alloc] initWithContentsOfFile:filePath]; //这个方法通过解析plist文件创建一个包含文件内容的nsmutablearray对象
	
	}else {
	
		contacts = [[NSMutableArray alloc]init];
	
	}
	
	UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];

	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@ "Back" style:UIBarButtonItemStylePlain target:nil action:nil];
	
	self.navigationItem.rightBarButtonItem = plusButton;
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	self.navigationItem.backBarButtonItem = backButton;
	
	[plusButton release];
	[backButton release];
	
}

- (void)addContact
{
	AddViewController *controller = [[AddViewController alloc] init];
	controller.delegate = self;
	
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

- (void)addViewControllerDidFinishAdding:(AddViewController *)controller
{
	NSDictionary *person = [controller values];
	
	if (person != nil) {
		[contacts addObject:person];
		
		[contacts sortUsingSelector:@selector(compareContactNames:)];
	}
	
	[self dismissModalViewControllerAnimated:YES];
	
	[contacts writeToFile:filePath atomically:NO];
	
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}



- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contacts.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"StandardCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
    }
    
	// Configure the cell.
	NSString *name = [[contacts objectAtIndex:indexPath.row]valueForKey:@ "Name"];
	UILabel *label = [cell textLabel];
	label.text = name;
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

	ContactViewController *controller = [[ContactViewController alloc] initWithNibName:@ "ContactViewController" bundle:nil];
	
	[controller setPerson:[contacts objectAtIndex:[indexPath row]]];
	[controller updateTitle];
	
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[contacts removeObjectAtIndex:indexPath.row]
		
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
		[contacts writeToFile:filePath atomically:NO];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
	[contacts release];
    [super dealloc];
}


@end

@implementation NSDictionary(sorting)

- (NSComparisonResult)compareContactNames:(NSDictionary *)contact{
	return [[self valueForKey:@ "Name"] caseInsensitiveCompare:[contact valueForKey:@ "Name"]]; 
}

@end
