//
//  SwapperViewController.m
//  Swapper
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "SwapperViewController.h"
#define deg2rda (3.1415926 / 180.0)
@implementation SwapperViewController

@synthesize portraitView;
@synthesize landscapeView;

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.view = landscapeView;
		self.view.transform = CGAffineTransformMakeRotation(deg2rda * (90));
		self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 320.0);
	} else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		self.view = landscapeView;
		self.view.transform = CGAffineTransformMakeRotation(deg2rda * (- 90));
		self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 320.0);
	} else {
		self.view = portraitView;
		self.view.transform = CGAffineTransformMakeRotation(0);
		self.view.bounds = CGRectMake(0.0, 0.0, 300.0, 460.0);
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight);
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
	[landscapeView release];
	[portraitView release];
    [super dealloc];
}

@end
