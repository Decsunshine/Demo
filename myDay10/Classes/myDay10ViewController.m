//
//  myDay10ViewController.m
//  myDay10
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay10ViewController.h"

@implementation myDay10ViewController
@synthesize time;
@synthesize myday10Ticker;

-(IBAction)start{
	myday10Ticker = [NSTimer scheduledTimerWithTimeInterval:1.0
													 target:self
												   selector:@selector(showAct)
												   userInfo:nil repeats:YES];
}

-(IBAction)stop{
	[myday10Ticker invalidate];
}

-(IBAction)reset{
	time.text = @"0";
}

-(IBAction)showAct{
	int currentTime = [time.text intValue];
	int newTime = currentTime + 1;
	time.text = [NSString stringWithFormat:@ "%d", newTime];
}





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
	[time release];
	[myday10Ticker release];
    [super dealloc];
}

@end
