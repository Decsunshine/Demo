//
//  FlowerWebViewController.m
//  FlowerWeb
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlowerWebViewController.h"

@implementation FlowerWebViewController

@synthesize colorChoice;
@synthesize flowerDetailView;
@synthesize flowerView;

- (void) viewDidLoad 
{
    flowerDetailView.hidden = YES;
	[self getFlower:nil];
	[super viewDidLoad];
}

- (IBAction)toggleFlowerDetail:(id)sender
{
	flowerDetailView.hidden =! [sender isOn];
}

- (IBAction)getFlower:(id)sender 
{
	NSURL *imageURL;
	NSURL *detailURL;
	NSString *imageURLString;
	NSString *detailURLString;
	NSString *color;
	int sessionID;
	
	color = [colorChoice titleForSegmentAtIndex:colorChoice.selectedSegmentIndex];
	sessionID = random() % 10000;
	
	imageURLString = [[NSString alloc] initWithFormat:@ "http://www.floraphotographs.com/showrandomi phone.php?color = %@&session=%d",color, sessionID	];
	detailURLString = [[NSString alloc] initWithFormat:@ "http://www.floraphotographs.com/detailiphone.php?session=%d",sessionID];
	
	imageURL = [[NSURL alloc] initWithString:imageURLString];
	detailURL = [[NSURL alloc] initWithString:detailURLString];
	
	[flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
	[flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
	
	flowerDetailView.backgroundColor = [UIColor clearColor];
	
	[imageURLString release];
	[detailURLString release];
	[imageURL release];
	[detailURL release];
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
	[colorChoice release];
	[flowerView release];
	[flowerDetailView release];
    [super dealloc];
}

@end
