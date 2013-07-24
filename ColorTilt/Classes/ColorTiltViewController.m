//
//  ColorTiltViewController.m
//  ColorTilt
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ColorTiltViewController.h"

@implementation ColorTiltViewController

@synthesize colorView;

#pragma mark -
#pragma mark UIAccelerometerDelegate


- (void)setBaseColor:(UIAcceleration *) acceleration
{
	if (acceleration.x > 1.3) {
		colorView.backgroundColor = [UIColor greenColor];
	} else if (acceleration.x < -1.3) {
		colorView.backgroundColor = [UIColor orangeColor];
	} else if (acceleration.y > 1.3) {
		colorView.backgroundColor = [UIColor redColor];
	} else if (acceleration.y < -1.3) {
		colorView.backgroundColor = [UIColor blueColor];
	} else if (acceleration.z > 1.3) {
		colorView.backgroundColor = [UIColor yellowColor];
	} else if (acceleration.z < -1.3) {
		colorView.backgroundColor = [UIColor purpleColor];
	}
	
}
- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration

{
	[self setBaseColor:acceleration];
	UIAccelerationValue value = fabs(acceleration.x);
	if (value > 1.0) {
		value = 1.0;
	}
	
	colorView.alpha = value;
}
#pragma  mark - 


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
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;
	accelerometer.updateInterval = 0.1;
	
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
	[colorView release];
    [super dealloc];
}

@end
