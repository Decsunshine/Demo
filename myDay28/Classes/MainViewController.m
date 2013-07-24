//
//  MainViewController.m
//  myDay28
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

@synthesize UFO;

@synthesize soundFile;

- (void)playSound:(NSString *)soundAct{
	

	NSString *path = [NSString stringWithFormat:@ "%@%@",[[NSBundle mainBundle] resourcePath],soundAct];
	
	NSLog(@ "%@\n", path);
	
	SystemSoundID soundID;
	
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
	
	AudioServicesPlaySystemSound(soundID);
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	
	currentTouch = [touch locationInView:self.view];
	
	[UIImageView beginAnimations:nil context:UFO];
	
	[UIImageView setAnimationDuration:1.0];
	
	UFO.center = CGPointMake(currentTouch.x, currentTouch.y);
	
	[UIImageView commitAnimations];
	
	soundFile = [NSString stringWithFormat:@ "/Sound.wav"];
	
	[self playSound:soundFile];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
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
	
	[UFO release];
	[soundFile release];
    [super dealloc];
}


@end
