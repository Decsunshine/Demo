//
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"


@implementation AddDrinkViewController
@synthesize drinkArray;

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)] autorelease];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)] autorelease];
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	NSLog(@"Registering for keyboard events");
	[[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
	
	keyboardVisible = NO;
	
	if (self.drink != nil) {
		nameTextField.text = [self.drink objectForKey:NAME_KEY];
		ingredientsTextView.text = [self.drink objectForKey:INGREDIENTS_KEY];
		directionsTextView.text = [self.drink objectForKey:DIRECTIONS_KEY];
	}
}

- (void)viewWillDisappear:(BOOL)animated{
	NSLog(@ "Unregistering for keyboard events");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidShow:(NSNotification *)notif{
	if (keyboardVisible) {
		NSLog(@ "keyboard is already visible. Ignoring notification.");
		return;
	}
	
	NSLog(@ "Received UIKeyboardDidShowNotification.");
	
	NSDictionary* info = [notif userInfo];
	
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	CGRect viewFrame = self.view.frame;
	
	viewFrame.size.height -= keyboardSize.height;
	
	scrollView.frame = viewFrame;
	
	keyboardVisible = YES;}

-(void)keyboardDidHide:(NSNotification *)notif{
	if (!keyboardVisible) {
		NSLog(@ "Keyboard already hidden. Ignoring notification.");
		return;
	}
	NSLog(@ "Received UIKeyboardDidHideNotification.");
	
	NSDictionary* info = [notif userInfo];
	
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize =  [aValue CGRectValue].size;
	
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height += keyboardSize.height;
	
	scrollView.frame = viewFrame;
	keyboardVisible = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];	
}



#pragma mark -
#pragma mark Save and Cancel

- (IBAction) save: (id) sender{
	
	if (drink != nil) {
		[drinkArray removeObject:drink];
		self.drink = nil;
	}
	
	NSMutableDictionary* newDrink = [[NSMutableDictionary alloc] init ];
	[newDrink setValue:nameTextField.text forKey:NAME_KEY];
	[newDrink setValue:ingredientsTextView.text forKey:INGREDIENTS_KEY];
	[newDrink setValue:directionsTextView.text forKey:DIRECTIONS_KEY];
	
	[drinkArray addObject:newDrink];
	[newDrink release];
	
	NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:NAME_KEY ascending:YES selector:@selector(caseInsensitiveCompare:)];
	
	[drinkArray sortUsingDescriptors:[NSArray arrayWithObject:nameSorter]];

	[nameSorter release];
	
	[self.navigationController dismissModalViewControllerAnimated:YES];

}

- (IBAction) cancel: (id) sender {
	
	[self.navigationController dismissModalViewControllerAnimated:YES];
}


- (void)dealloc {
	[drinkArray release];
    [super dealloc];
}


@end
