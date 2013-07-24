//
//  AddViewController.m
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"


@implementation AddViewController

@synthesize delegate;
@synthesize table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		fields = [[NSArray alloc] initWithObjects:@ "Name", @ "Email", @ "Phone", @ "Street", @ "City/State/Zip", nil];
		
		data = [[NSMutableDictionary alloc] initWithCapacity:fields.count];
		
		keyboardShown = NO;
		
		currentCell = nil;
	}
	return self;
}

- (IBAction)doneAdding:sender
{
	if (currentCell != nil) {
		[data setValue:currentCell.textField.text forKey:currentCell.label.text];
	}	
		[delegate addViewControllerDidFinishAdding:self];
	
}

- (NSDictionary *)values 
{
	if ([data valueForKey:@ "name"] == nil) {
		return nil;
	}
	return [NSDictionary dictionaryWithDictionary:data];
}

- (void)editableCellDidBeginEditing:(EditableCell *)cell
{
   if (!keyboardShown) {
	   [UIView beginAnimations:nil context:NULL];
	   [UIView setAnimationDuration:0.25];
	   [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	   CGRect frame = table.frame;
	   frame.size.height -= KEYBOARD_HEIGHT;
	   [table setFrame:frame];
	   [UIView commitAnimations];
   }	
	
	keyboardShown = YES;
	currentCell = cell;
	
	NSIndexPath *path = [table indexPathForCell:cell];
	
	[table scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)editableCellDidEndEditing:(EditableCell *)cell
{
	[data setValue:cell.textField.text forKey:cell.label.text];	
}

- (void)editableCellDidEndOnExit:(EditableCell *)cell
{
	CGRect frame = table.frame;
	frame.size.height +=KEYBOARD_HEIGHT;
	[table setFrame:frame];
	
	keyboardShown = NO;
	currentCell = nil;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 3;
	}else {
		return fields.count - 3;
	}

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (section == 1) {
		return @ "Address";
	}else {
		return nil;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @ "EditableCell";
	
	EditableCell *cell = (EditableCell *)[table dequeueReusableCellWithIdentifier:identifier];
	
	if (cell == nil) {
		cell = [[EditableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	
	NSString *key = [fields objectAtIndex:indexPath.row + indexPath.section * 3];
	[cell.textField.text:key];
	
	cell.textField.text = [data valueForKey:key];
	
	if (indexPath.section == 0 && indexPath.row == 1) {
		cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
	}else if (indexPath.section == 0 && indexPath.row == 2) {
		cell.textField.keyboardType = UIKeyboardTypePhonePad;
	}

	cell.editing = NO;
	cell.delegate = self
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
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
	[fields release];
	[data release];
	[table release]
    [super dealloc];
}


@end

