//
//  myDay17ViewController.m
//  myDay17
//
//  Created by 路宏亮 on 12-2-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay17ViewController.h"

@implementation myDay17ViewController

@synthesize picker;
@synthesize winLabel;

@synthesize column1, column2, column3, column4, column5;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImage *seven = [UIImage imageNamed:@ "seven.png"];
	UIImage *bar = [UIImage imageNamed:@ "bar.png"];
	UIImage *crown = [UIImage imageNamed:@ "crown.png"];
	UIImage *cherry = [UIImage imageNamed:@ "cherry.png"];
	UIImage *lemon = [UIImage imageNamed:@ "lemon.png"];
	UIImage *apple = [UIImage imageNamed:@ "apple.png"];
	for (int i = 1; i <= 5; i++) {
		UIImageView *sevenView = [[UIImageView alloc]initWithImage:seven ];
		UIImageView *barView = [[UIImageView alloc]initWithImage:bar ];
		UIImageView *crownView = [[UIImageView alloc]initWithImage:crown ];
		UIImageView *cherryView = [[UIImageView alloc]initWithImage:cherry ];
		UIImageView *lemonView = [[UIImageView alloc]initWithImage:lemon ];	
	    UIImageView *appleView = [[UIImageView alloc]initWithImage:apple ];
		
		NSArray *imageViewArray = [[NSArray alloc] initWithObjects:sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,								   
								   sevenView ,barView, crownView, cherryView, lemonView, appleView,
								   nil];
		
		NSString *fieldName = [[NSString alloc] initWithFormat:@ "column%d",i];
		[self setValue:imageViewArray forKey:fieldName];
		
		[fieldName release];
		[imageViewArray release];
		[sevenView release];
		[barView release];
		[crownView release];
		[cherryView release];
		[lemonView release];
		[appleView release];
	}
	srandom(time(NULL));
}

-(IBAction)spin {
	
	BOOL win = NO;
	
	int numInRow = 1;
	
	int lastVal = -1;
	
	for (int i=0; i<5; i++) {
		
		int newValue = random() % [self.column1 count];
		
		if ((newValue % 6 )== lastVal ) {
			numInRow ++;
		}else {
			numInRow = 1;
		}
		
		lastVal = (newValue % 6);
		
		
		
		[picker selectRow:newValue inComponent:i animated:YES];
		
		[picker reloadComponent:i];
		
		if (numInRow >= 3) {
			win = YES;
			
		}

	}
	if (win) {
		winLabel.text  = @ "WIN!";
	}else {
		winLabel.text = @ "~LOSE~";
	}

}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
	return 5;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.column1 count];
}


-(UIView*)pickerView:(UIPickerView*)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger) component reusingView :(UIView*)view
{
	NSString *arrayName = [[NSString alloc] initWithFormat:@ "column%d", component + 1];
	NSArray *array = [self valueForKey:arrayName];
	return [array objectAtIndex:row];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[picker release];
	[winLabel release];
	[column1 release];
	[column2 release];
	[column3 release];
	[column4 release];
	[column5 release];
    [super dealloc];
}

@end
