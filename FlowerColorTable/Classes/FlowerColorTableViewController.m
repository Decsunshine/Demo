//
//  FlowerColorTableViewController.m
//  FlowerColorTable
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FlowerColorTableViewController.h"

#define sectionCount 2
#define redSection 0
#define blueSection 1

@implementation FlowerColorTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	redFlowers = [[NSMutableArray alloc] initWithObjects:@ "Gerbera", @ "Peony", @ "Rose", @ "Poppy", nil];
	blueFlowers = [[NSMutableArray alloc] initWithObjects:@ "Hyacinth", @ "Hydrangea", @ "Sea Holly", @ "Phlox", @ "Iris", nil];
				  
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionCount;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
		case redSection:
			return [redFlowers count];
			break;
		case blueSection:
			return [blueFlowers count];
			break;

		default:
			return 0;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) {
		case redSection:
			return @ "Red";
		case blueSection:
			return @ "Blue";
		default:
			return @ "Unknown";
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	switch (indexPath.section) {
		case redSection:
			[[cell textLabel] setText:[redFlowers objectAtIndex:indexPath.row]];
			break;
		case blueSection:
			[[cell textLabel] setText:[blueFlowers objectAtIndex:indexPath.row]];
			break;
			

		default:
			[[cell textLabel] setText:@ "Unknown"];
			break;
	}
    // Set up the cell...
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIAlertView *showSelection;
	NSString *flowerMessage;
	switch (indexPath.section) {
		case redSection:
			flowerMessage = [[NSString alloc] initWithFormat:@ "You chose the red flower - %@", [redFlowers objectAtIndex:indexPath.row]];
			break;
		case blueSection:
			flowerMessage = [[NSString alloc] initWithFormat:@ "You chose the blue flower - %@", [blueFlowers objectAtIndex:indexPath.row]];
			break;

		default:
			flowerMessage = [[NSString alloc] initWithFormat:@ "I have no idea what you chose!?"];
			break;

	}
	
	showSelection = [[UIAlertView alloc]
					 initWithTitle:@ "Flower Selected!"
					 message:flowerMessage
					 delegate:nil cancelButtonTitle:@ "OK"
					 otherButtonTitles:nil];
	[showSelection show];
	[showSelection release];
	[flowerMessage release];
}




- (void)dealloc {
	[redFlowers release];
	[blueFlowers release];
    [super dealloc];
}


@end

