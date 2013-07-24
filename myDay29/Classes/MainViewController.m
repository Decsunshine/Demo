//
//  MainViewController.m
//  myDay29
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController
@synthesize RYU;
@synthesize soundFile;

- (void)playSound:(NSString *)soundAct{
	NSString *path = [NSString stringWithFormat:@ "%@%@",[[NSBundle mainBundle] resourcePath],soundAct];
	
	NSLog(@ "%@\n", path);
	
	SystemSoundID soundID;
	
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
	
	AudioServicesPlaySystemSound(soundID);
	
	
}

- (IBAction)jump:(id) sender{
	if (RYU.center.y > 216) {
		RYU.animationImages = [NSArray arrayWithObjects:
							   [UIImage imageNamed:@ "jump1.png"],
							   [UIImage imageNamed:@ "jump2.png"],
							   [UIImage imageNamed:@ "jump2.png"],
							   [UIImage imageNamed:@ "jump1.png"],
							   nil];
		
		RYU.animationDuration = 0.1;
		
		RYU.animationRepeatCount = 1;
		
		[RYU startAnimating];
		
		[UIImageView beginAnimations:@ "jump" context:RYU];
		
		[UIImageView setAnimationDuration:0.1];
		
		RYU.center = CGPointMake(RYU.center.x, RYU.center.y-50);
		
		RYU.center = CGPointMake(RYU.center.x, RYU.center.y+50);
		
		[UIImageView commitAnimations];
		
		soundFile = [NSString stringWithFormat:@ "/sound.caf"];
		
		[self playSound:soundFile];
	}
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


 


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id) sender {    
	
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


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[RYU release];
	[soundFile release];
    [super dealloc];
}


@end
