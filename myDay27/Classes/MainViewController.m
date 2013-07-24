//
//  MainViewController.m
//  myDay27
//
//  Created by 路宏亮 on 12-3-12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController
@synthesize soundFile;

- (void)playSound:(NSString *)soundAct{
	NSString *path = [NSString stringWithFormat:@ "%@%@",[[NSBundle mainBundle] resourcePath],soundAct];
	
	NSLog(@ "%@\n", path);
	
	SystemSoundID soundID;
	
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
	
	AudioServicesPlaySystemSound(soundID);
}

- (IBAction)onLeft:(id)sender{
	if (PacMan.center.x > 50) {
		[UIImageView beginAnimations:nil context:PacMan];
		
		[UIImageView setAnimationDuration:0.5];
		
		PacMan.center = CGPointMake(PacMan.center.x - 10, PacMan.center.y);
		
		[PacMan setImage:[UIImage imageNamed:@ "PacMan_Left.png"]];
		
		[UIImageView commitAnimations];
	}
	
	soundFile = [NSString stringWithFormat:@ "/Sound.wav"];
	
	[self playSound: soundFile];
}

- (void)onRight:(id)sender{
	if (PacMan.center.x < 270) {
		[UIImageView beginAnimations:nil context:PacMan];
		
		[UIImageView setAnimationDuration:0.5];
		
		PacMan.center = CGPointMake(PacMan.center.x + 10, PacMan.center.y);
		
		[PacMan setImage:[UIImage imageNamed:@ "PacMan_Right.png"]];
		
		[UIImageView commitAnimations];
	}
	
	soundFile = [NSString stringWithFormat:@ "/Sound.wav"];
	
	[self playSound: soundFile];
}

- (IBAction)onUp:(id)sender{
	if (PacMan.center.y > 50) {
		[UIImageView beginAnimations:nil context:PacMan];
		
		[UIImageView setAnimationDuration:0.5];
		
		PacMan.center = CGPointMake(PacMan.center.x, PacMan.center.y - 10);
		
		[PacMan setImage:[UIImage imageNamed:@ "PacMan_Up.png"]];
		
		[UIImageView commitAnimations];
	}
	
	soundFile = [NSString stringWithFormat:@ "/Sound.wav"];
	
	[self playSound: soundFile];
}

- (IBAction)onDown:(id)sender {
	if (PacMan.center.y < 270) {
		[UIImageView beginAnimations:nil context:PacMan];
		
		[UIImageView setAnimationDuration:0.5];
		
		PacMan.center = CGPointMake(PacMan.center.x, PacMan.center.y + 10);
		
		[PacMan setImage:[UIImage imageNamed:@ "PacMan_Down.png"]];
		
		[UIImageView commitAnimations];
	}
	
	soundFile = [NSString stringWithFormat:@ "/Sound.wav"];
	
	[self playSound: soundFile];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
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
	
	[PacMan release];
	[soundFile release];
    [super dealloc];
}


@end
