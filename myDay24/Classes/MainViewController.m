//
//  MainViewController.m
//  myDay24
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController





 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 UIImageView *FireView = [[UIImageView alloc] initWithFrame:self.view.frame];
	 FireView.animationImages = [NSArray arrayWithObjects:
								 [UIImage imageNamed:@ "fire01.png"],
								 [UIImage imageNamed:@ "fire02.png"],
								 [UIImage imageNamed:@ "fire03.png"],								 
								 [UIImage imageNamed:@ "fire04.png"],
								 [UIImage imageNamed:@ "fire05.png"],								 
								 nil];
	 
	 FireView.animationDuration = 1.75;
	 
	 FireView.animationRepeatCount = 0;
	 
	 [FireView startAnimating];
	 
	 [self.view addSubview:FireView];
	 
	 [FireView release];
 }


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo
{    
	
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

- (void)dealloc {
    [super dealloc];
}


@end
