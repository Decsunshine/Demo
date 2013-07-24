//
//  RootViewController.m
//  Day15
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize listData;
@synthesize rowNameField;

#pragma mark  -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	listData = [[NSMutableArray alloc] initWithObjects:@ "Row01", @ "Row02", @ "Row03", @ "Row04", @ "Row05", nil];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
								  initWithTitle:@ "Add"
									style:UIBarButtonItemStyleBordered
									target:self
								  action:@selector (AddButtonAction:)];
	
	self.navigationItem.leftBarButtonItem = addButton;
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	self.title = @ "15th table";
}

- (IBAction)AddButtonAction:(id)sender
{
	UIAlertView *dialog = [[UIAlertView alloc]initWithTitle:@ "添加新的一项" 
													message:@ ""
												   delegate:self 
										  cancelButtonTitle:@ "取消"
										  otherButtonTitles:@ "确定",nil];
	
	rowNameField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 38.0, 245.0, 20.0)];
	
	[rowNameField setBackgroundColor:[UIColor whiteColor]];
	
	[dialog addSubview:rowNameField];
	
	[dialog show];
	
	[dialog release];
	
	[rowNameField release];
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if ((buttonIndex != [alertView cancelButtonIndex]) && (rowNameField.text != nil)) {
		[listData insertObject:[rowNameField text] atIndex:listData.count];
		
		[self.tableView reloadData];
	}
}




#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return listData.count;
	}
	if (section == 1) {
		return 0;
	}else return 0;
		
}

- (NSString *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
	NSString *title = nil;
	
	switch (section) {
		case 0:
			title =@ "table 1";
			break;
		case 1:
			title = @ "table 2";
			break;

		default:
			break;
	}
	return title;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if (indexPath.section == 0) {
		cell.textLabel.text = [listData objectAtIndex:indexPath.row];
	}
	// Configure the cell.

    return cell;
}

- (BOOL)tableView:(UITableView*)tableview canEditRowAtIndexPath:(NSIndexPath*)indexPath{

	return YES;
}

- (void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[listData removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)tableView:(UITableView*)tableView
moveRowAtIndexPath:(NSIndexPath*)fromIndexPath
	  toIndexPath:(NSIndexPath*)toIndexPath{

	[listData insertObject: [listData objectAtIndex:fromIndexPath.row] atIndex: toIndexPath.row];
	
	[listData removeObjectAtIndex:(NSUInteger) fromIndexPath.row + 1];
}

- (BOOL)tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath{
	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[listData release];
	[rowNameField release];
	
    [super dealloc];
}


@end

