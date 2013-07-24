//
//  FlipsideViewController.m
//  ReturnMe
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;
@synthesize preferenceObjects;
@synthesize preferenceNames;

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSString *) tableView:(UITableView *)table
 titleForHeaderInSection:(NSInteger)section {
	return @"Settings";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return preferenceNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @ "ReturnMe";
	UITableViewCell *preference = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (preference == nil) {
		preference = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
	}
	
	preference.textLabel.text = [preferenceNames objectAtIndex:indexPath.row];
	[preference.contentView addSubview:[preferenceObjects objectAtIndex:indexPath.row]];
	return preference;
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      
	
	preferenceNames = [[NSArray alloc] initWithObjects:@ "Your Name", @ "Email Address", @ "Phone Number", nil];
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	UITextField *name = [[[UITextField alloc] initWithFrame:CGRectMake(150.0, 11.0, 150.0, 30.0)] autorelease];
	name.text = [userDefaults stringForKey:kName];
	
	UITextField *email = [[[UITextField alloc] initWithFrame:CGRectMake(150.0, 11.0, 150.0, 30.0)] autorelease];
	email.text = [userDefaults stringForKey:kEmail];
	
	UITextField *phone = [[[UITextField alloc] initWithFrame:CGRectMake(150.0, 11.0, 150.0, 30.0)] autorelease];
	phone.text = [userDefaults stringForKey:kPhone];
	
	preferenceObjects = [[NSArray alloc] initWithObjects:name, email, phone, nil];
}


- (IBAction)done {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	[userDefaults setObject:[[preferenceObjects objectAtIndex:0] text ]forKey:kName];
	
	[userDefaults setObject:[[preferenceObjects objectAtIndex:1] text ]forKey:kEmail];
	
	[userDefaults setObject:[[preferenceObjects objectAtIndex:2] text ]forKey:kPhone];
	
	[self.delegate flipsideViewControllerDidFinish:self];	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[preferenceNames release];
	[preferenceObjects release];
    [super dealloc];
}


@end
