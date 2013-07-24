//
//  MainViewController.m
//  ReturnMe
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

@synthesize picture;
@synthesize name;
@synthesize email;
@synthesize phone;

- (NSDictionary *)initialDefaults
{
	NSArray *keys = [[[NSArray alloc] initWithObjects:kPicture, kName, kEmail, kPhone, nil] autorelease];
	NSArray *values = [[[NSArray alloc] initWithObjects:@ "Hamster", @ "Your Name", @ "you@yours.com", @ "(555)555-1212", nil] autorelease];
	return [[[NSDictionary alloc] initWithObjects: values forKeys:keys] autorelease];
}

- (void)setValuesFromPreferences
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:[self initialDefaults]];
	NSString *picturePreference = [userDefaults stringForKey:kPicture];
	
	if ([picturePreference isEqualToString:@ "Rat"]) {
		picture.image = [UIImage imageNamed: @ "rat.jpg"];
	} else if ([picturePreference isEqualToString:@ "Dog"]) {
		picture.image = [UIImage imageNamed:@ "dog.jpg"];
	} else {
		picture.image = [UIImage imageNamed:@ "hamster.jpg"];
	}
	
	name.text = [userDefaults stringForKey:kName];
	email.text = [userDefaults stringForKey:kEmail];
	phone.text = [userDefaults stringForKey:kPhone];

}

- (void) viewDidLoad
{
	[self setValuesFromPreferences];
	[super viewDidLoad];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}




- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
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
	[picture release];
	[name release];
	[email release];
	[phone release];
    [super dealloc];
}


@end
