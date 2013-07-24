//
//  myDay08ViewController.m
//  myDay08
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay08ViewController.h"

@implementation myDay08ViewController
@synthesize result;

-(IBAction)agreeDisagree{
	int rNumber = rand() % 2;
	switch (rNumber) {
		case 0:
			result.text = @"agree";
			break;
		case 1:
			result.text = @"disagree";
		    break;
			
		default:
			break;
	}
}
-(IBAction)leftCenterRight{
	int rNumber = rand() % 3;
	switch (rNumber) {
		case 0:
			result.text = @"left";	
			break;
		case 1:
			result.text = @"middle";	
			break;
		case 2:
			result.text = @"right";	
			break;
		default:
			break;
	}
}

-(IBAction)oneToHundred{
	int rNumber = rand() % 100;
	result.text = [NSString stringWithFormat:@"%d",rNumber];
}

-(IBAction)russianRoulette{
	int rNumber = rand() % 6;
	switch (rNumber) {
		case 0:
			result.text = @"bang!!!";
			break;
		
		default:
			result.text = @"Nothing Happend...";
			break;
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
	[result release];
    [super dealloc];
}

@end
