//
//  myDay11ViewController.m
//  myDay11
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay11ViewController.h"

@implementation myDay11ViewController
@synthesize counter;



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
	
	count = 0;
	NSString *numValue = [NSString stringWithFormat:@ "%d", count];
	counter.text = numValue;
}

-(IBAction)addUnit {
	if (count <= 999) {
		count ++;
	}else {
		count = 999;
	}
	NSString *numValue = [NSString stringWithFormat:@ "%d", count ];
	counter.text = numValue;
}

-(IBAction)subtractUnit {
	if (count > 0) {
		count--;
	}else {
		count = 0;
	}
	NSString *numValue = [NSString stringWithFormat:@ "%d",count];
	counter.text = numValue;

	
}

-(IBAction)reset {
	count = 0;
	NSString *numValue = [NSString stringWithFormat:@ "%d",count];
	counter.text = numValue;
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
	[counter release];
    [super dealloc];
}

@end
