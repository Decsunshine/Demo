//
//  Best_FriendViewController.m
//  Best Friend
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "Best_FriendViewController.h"

@implementation Best_FriendViewController

@synthesize name;
@synthesize photo;



- (IBAction)newBFF:(id)sender
{
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc]init];
	picker.peoplePickerDelegate = self;
	
	[self presentModalViewController:picker animated:YES];
	[picker release];
}

#pragma mark -
#pragma mark ABPeoplePickerNavigationControllerDelegate

- (void) peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
	[self dismissModalViewControllerAnimated:YES];
}

-(BOOL) peoplePickerNavigationController:
        (ABPeoplePickerNavigationController *)peoplePicker
	  shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	NSString *bffName = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
	
	name.text = bffName;
	
	if (ABPersonHasImageData(person)) {
		photo.image = [UIImage imageWithData:(NSData *)ABPersonHasImageData(person)];
	}
	
	[bffName release];	
	[self dismissModalViewControllerAnimated:YES];
	return NO;
}
- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
	shouldContinueAfterSelectingPerson:(ABRecordRef)person
                         property:(ABPropertyID)property
					   identifier:(ABMultiValueIdentifier)identifier {
	[self dismissModalViewControllerAnimated:YES];
	return NO;
}

#pragma mark -

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	[name release];
	[photo release];
    [super dealloc];
}

@end
