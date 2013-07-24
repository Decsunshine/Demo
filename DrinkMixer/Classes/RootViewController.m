//
//  RootViewController.m
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "RootViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"
#import "AddDrinkViewController.h"

@implementation RootViewController
@synthesize drinks, addButtonItem;

- (void)viewDidLoad{
	
	[super viewDidLoad];
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = self.addButtonItem;
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@ "DrinkDirections" ofType:@ "plist"];
	
	NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
	
	self.drinks = tmpArray;
	
	[tmpArray release];
}

- (void) tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[self.drinks removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		
	}
	
}

- (IBAction)addButtonPressed: (id)sender{
	NSLog(@ "add button pressed!");
	
	AddDrinkViewController *addDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@ "DrinkDetailViewController" bundle:nil];
	
	UINavigationController *addNavCon = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
	
	addDrinkVC.drinkArray = self.drinks;
	
	[self presentModalViewController:addNavCon animated:YES];
	
	[addDrinkVC release];
	
	[addNavCon release];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
}



#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.drinks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [[self.drinks objectAtIndex:indexPath.row] objectForKey:NAME_KEY];
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	if (self.editing) {
	DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@ "DrinkDetailViewController" bundle:nil];
	
	drinkDetailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
	
	[self.navigationController pushViewController:drinkDetailViewController animated:YES];
	
	[drinkDetailViewController release];
	}
	else {
		AddDrinkViewController *editingDrickVC = [[AddDrinkViewController alloc] initWithNibName:@ "DrinkDetailViewController" bundle:nil];
		UINavigationController *editingNavCon = [[UINavigationController alloc] initWithRootViewController:editingDrickVC];
		editingDrickVC.drink = [self.drinks objectAtIndex:indexPath.row];
		editingDrickVC.drinkArray = self.drinks;
		[self.navigationController presentModalViewController:editingNavCon animated:YES];
		
		[editingDrickVC release];
		[editingNavCon release];
	}

	
}

- (void)dealloc {
	[addButtonItem release];
	[drinks release];
    [super dealloc];
}


@end

