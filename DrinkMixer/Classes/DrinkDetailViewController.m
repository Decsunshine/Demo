//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"


@implementation DrinkDetailViewController
@synthesize scrollView,drink, nameTextField, ingredientsTextView, directionsTextView;



- (void) viewDidLoad{

	[super viewDidLoad];
	scrollView.contentSize = self.view.frame.size;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	nameTextField.text = [drink objectForKey:NAME_KEY];
	
	
	ingredientsTextView.text = [drink objectForKey:INGREDIENTS_KEY];
	
	directionsTextView.text = [drink objectForKey:DIRECTIONS_KEY];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	
	[scrollView release];
	[drink release];
	[nameTextField release];
	[ingredientsTextView release];
	[directionsTextView release];
    [super dealloc];
}


@end
