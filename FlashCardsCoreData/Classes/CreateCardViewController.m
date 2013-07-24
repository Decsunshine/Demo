//
//  CreateCardViewController.m
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateCardViewController.h"

@implementation CreateCardViewController

@synthesize	cardDelegate;
@synthesize question, answer;



- (IBAction) save{
	[self.cardDelegate didCreateCardWithQuestion:question.text answer:answer.text];
	
}

- (IBAction) cancel{
	[self.cardDelegate didCancelCardCreation];
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
	[question release];
	[answer release];
    [super dealloc];
}


@end
