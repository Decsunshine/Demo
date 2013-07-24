//
//  FieldButtonFunViewController.m
//  FieldButtonFun
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FieldButtonFunViewController.h"

@implementation FieldButtonFunViewController

@synthesize thePlace;
@synthesize theVerb;
@synthesize theNumber;
@synthesize theStory;
@synthesize theTemplate;
@synthesize generateStory;

- (IBAction) hideKeyboard:(id)sender
{
	[thePlace resignFirstResponder];
	[theVerb resignFirstResponder];
	[theNumber resignFirstResponder];
	[theTemplate resignFirstResponder];
}

- (IBAction) createStory:(id)sender
{
	theStory.text = [theTemplate.text stringByReplacingOccurrencesOfString:@ "<place>" withString:thePlace.text];
	theStory.text = [theStory.text stringByReplacingOccurrencesOfString:@ "<verb>" withString:theVerb.text];
	theStory.text = [theStory.text stringByReplacingOccurrencesOfString:@ "<number>" withString:theNumber.text];
}

- (void)viewDidLoad 
{
	UIImage *normalImage = [[UIImage imageNamed:@ "whiteButton.png"]stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[generateStory setBackgroundImage:normalImage forState:UIControlStateNormal];
	
	UIImage *pressedImage = [[UIImage imageNamed:@ "blueButton.png"]stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[generateStory setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
	
	[super viewDidLoad];
}


- (void)dealloc {
	[theTemplate release];
	[thePlace release];
	[theNumber release];
	[theStory release];
	[theVerb release];
	[generateStory release];
    [super dealloc];
}

@end
