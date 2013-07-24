//
//  ReframeViewController.m
//  Reframe
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ReframeViewController.h"

@implementation ReframeViewController

@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize viewLabel;

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		viewLabel.frame = CGRectMake(175.0, 140.0, 130.0, 20.0);
		buttonOne.frame = CGRectMake(20.0, 20.0, 440.0, 100.0);
		buttonTwo.frame = CGRectMake(20.0, 180.0, 440.0, 100.0);
	} else {
		viewLabel.frame = CGRectMake(95.0, 15.0, 130.0, 20.0);
		buttonOne.frame = CGRectMake(20.0, 50.0, 280.0, 190.0);
		buttonTwo.frame = CGRectMake(20.0, 250.0, 280.0, 190.0);
		
	}

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



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
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


- (void)dealloc {
	[buttonOne release];
	[buttonTwo release];
	[viewLabel release];
    [super dealloc];
}

@end
