//
//  OrientationViewController.m
//  Orientation
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "OrientationViewController.h"

@implementation OrientationViewController

@synthesize orientation;

#pragma mark -
#pragma mark UIAccelerometerDelegate

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	if (acceleration.x > 0.5) {
		orientation.text = @ "Right Side";
	} else if (acceleration.x < -0.5) {
		orientation.text = @ "Left Side";	
	} else if (acceleration.y > 0.5) {
		orientation.text = @ "Upside Down";
	} else if (acceleration.y < -0.5) {
		orientation.text = @ "Standing Up";
	} else if (acceleration.z > 0.5) {
		orientation.text = @ "Face Down";
	} else if (acceleration.z < -0.5) {
		orientation.text = @ "Face up";
	}
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;
	accelerometer.updateInterval = 0.5;
	[super viewDidLoad];
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
	[orientation release];
    [super dealloc];
}

@end
