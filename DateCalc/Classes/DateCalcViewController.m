//
//  DateCalcViewController.m
//  DateCalc
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "DateCalcViewController.h"

@implementation DateCalcViewController

@synthesize differenceResult;

- (IBAction)showDate:(id)sender
{
	NSDate *todaysDate;
	NSString *differenceOutput;
	NSString *todaysDateString;
	NSDateFormatter *dateFormat;
	NSTimeInterval difference;
	
	todaysDate = [[NSDate alloc] init];
	difference = [todaysDate timeIntervalSinceDate:[sender date]] / 86400;
	
	dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@ "MMMM d, yyyy hh:mm:ssa"];
	todaysDateString = [dateFormat stringFromDate:todaysDate];
	
	differenceOutput = [[NSString alloc] initWithFormat:@ "Difference between chosen date and today (%@) in days: %1.2f", todaysDateString, fabs(difference)];
	differenceResult.text = differenceOutput;
	
	[todaysDate release];
	[dateFormat release];
	[differenceOutput release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[differenceResult release];
    [super dealloc];
}

@end
