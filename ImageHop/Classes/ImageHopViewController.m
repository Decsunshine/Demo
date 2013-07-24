//
//  ImageHopViewController.m
//  ImageHop
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ImageHopViewController.h"

@implementation ImageHopViewController

@synthesize toggleButton;
@synthesize imageView;
@synthesize animationSpeed;
@synthesize hopsPerSecond;

-(void)viewDidLoad
{
	NSArray *hopAnimation;
	hopAnimation = [[NSArray alloc] initWithObjects:
					[UIImage imageNamed:@ "frame-1.png"],
					[UIImage imageNamed:@ "frame-2.png"],
					[UIImage imageNamed:@ "frame-3.png"],					
					[UIImage imageNamed:@ "frame-4.png"],					
					[UIImage imageNamed:@ "frame-5.png"],	
					[UIImage imageNamed:@ "frame-6.png"],					
					[UIImage imageNamed:@ "frame-7.png"],					
					[UIImage imageNamed:@ "frame-8.png"],					
					[UIImage imageNamed:@ "frame-9.png"],					
					[UIImage imageNamed:@ "frame-10.png"],
					[UIImage imageNamed:@ "frame-11.png"],					
					[UIImage imageNamed:@ "frame-12.png"],					
					[UIImage imageNamed:@ "frame-13.png"],					
					[UIImage imageNamed:@ "frame-14.png"],					
					[UIImage imageNamed:@ "frame-15.png"],
					[UIImage imageNamed:@ "frame-16.png"],					
					[UIImage imageNamed:@ "frame-17.png"],
					[UIImage imageNamed:@ "frame-18.png"],
					[UIImage imageNamed:@ "frame-19.png"],
					[UIImage imageNamed:@ "frame-20.png"],	
					nil
					];
	
	imageView.animationImages = hopAnimation;
	imageView.animationDuration = 1;
	[hopAnimation release];
	[super viewDidLoad];
}

- (IBAction) toggleAnimation:(id)sender
{
	if (imageView.isAnimating) {
		[imageView stopAnimating];
		[toggleButton setTitle:@ "Hop!" forState:UIControlStateNormal];
	}else {
		[imageView startAnimating];
		[toggleButton setTitle:@ "Sit Still!" forState:UIControlStateNormal];
	}
}

- (IBAction)setSpeed:(id)sender
{
	NSString *hopRateString;
	imageView.animationDuration = 2 - animationSpeed.value;
	[imageView startAnimating];
	[toggleButton setTitle:@ "Sit Still!" forState:UIControlStateNormal];
	hopRateString = [[NSString alloc] initWithFormat:@ "%1.2f hps", 1/(2 - animationSpeed.value)];
	hopsPerSecond.text = hopRateString;
	[hopRateString release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[toggleButton release];
	[imageView release];
	[hopsPerSecond release];
	[animationSpeed release];
    [super dealloc];
}

@end
