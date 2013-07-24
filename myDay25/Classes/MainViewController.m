//
//  MainViewController.m
//  myDay25
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController
@synthesize flakeImage;


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1.0];
	 
	 flakeImage = [UIImage imageNamed:@ "flake.png"];
	 
	 [NSTimer scheduledTimerWithTimeInterval:(0.05)
									  target:self
									selector:@selector(onTimer)
									userInfo:nil
									 repeats:YES];
	 
 }

- (void)onTimer
{
	UIImageView *flakeView = [[UIImageView alloc] initWithImage:flakeImage];
	
	int startX = round(random() % 320);
	int endX = round(random() % 320);
	double scale = 1 / round(random() % 100) + 1.0;
	double speed = 1 / round(random() % 100) + 1.0;
	flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
	flakeView.alpha = 0.25;
	[self.view addSubview:flakeView];
	[UIView beginAnimations:nil context:flakeView];
	[UIView setAnimationDuration:5 * speed];
	
	flakeView.frame = CGRectMake(endX, 500.0, 25.0 * scale, 25.0 * scale);
	
	[UIView commitAnimations];
}



- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo{    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
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
	[flakeImage release];
    [super dealloc];
}


@end
