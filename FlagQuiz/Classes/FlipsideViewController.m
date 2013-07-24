//
//  FlipsideViewController.m
//  FlagQuiz
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@implementation FlipsideViewController

@synthesize delegate;
@synthesize choicesControl;
@synthesize africaSwitch;
@synthesize asiaSwitch;
@synthesize europeSwitch;
@synthesize northAmericaSwitch;
@synthesize oceaniaSwitch;
@synthesize southAmericaSwitch;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      
}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
	
	if (!africaSwitch.on && !asiaSwitch.on && !europeSwitch.on &&
		!oceaniaSwitch.on && !northAmericaSwitch.on && 
		!southAmericaSwitch.on) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@ "Wa!!  Error"
							   message:@ "Please select at least one region"
													   delegate:self
											  cancelButtonTitle:@ "OK!!!"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	} else {
		int index = [choicesControl selectedSegmentIndex];
		
		[(MainViewController *)self.delegate setGuessRows:index + 1];
		
		NSMutableDictionary *regions = [(MainViewController*)self.delegate regions];
		[regions setValue:[NSNumber numberWithBool:africaSwitch.on] forKey:@ "Africa"];
		[regions setValue:[NSNumber numberWithBool:asiaSwitch.on] forKey:@ "Asia"];
		[regions setValue:[NSNumber numberWithBool:europeSwitch.on] forKey:@ "Europe"];
		[regions setValue:[NSNumber numberWithBool:northAmericaSwitch.on] forKey:@ "North_America"];
		[regions setValue:[NSNumber numberWithBool:southAmericaSwitch.on] forKey:@ "South_America"];
		[regions setValue:[NSNumber numberWithBool:oceaniaSwitch.on] forKey:@ "Oceania"];
		
		[(MainViewController *)self.delegate resetQuiz];
		[self.delegate flipsideViewControllerDidFinish:self];
	}

}

- (void)setSwitches:(NSDictionary *)dictionary
{
	[africaSwitch setOn:[[dictionary valueForKey:@ "Africa"]boolValue]];
	[asiaSwitch setOn:[[dictionary valueForKey:@ "Asia"]boolValue]];
	[europeSwitch setOn:[[dictionary valueForKey:@ "Europe"]boolValue]];
	[northAmericaSwitch setOn:[[dictionary valueForKey:@ "North_America"]boolValue]];
	[oceaniaSwitch setOn:[[dictionary valueForKey:@ "Oceania"]boolValue]];
	[southAmericaSwitch setOn:[[dictionary valueForKey:@ "South_America"]boolValue]];
}

- (void)setSelectedIndex:(int)index
{
	choicesControl.selectedSegmentIndex = index;
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
	[choicesControl release];
	[africaSwitch release];
	[asiaSwitch release];
	[europeSwitch release];
	[northAmericaSwitch release];
	[oceaniaSwitch release];
	[southAmericaSwitch release];
    [super dealloc];
}


@end
