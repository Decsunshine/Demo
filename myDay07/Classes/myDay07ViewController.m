//
//  myDay07ViewController.m
//  myDay07
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay07ViewController.h"

@implementation myDay07ViewController

@synthesize chi,feet,meter;


-(IBAction)reset{
	chi.text	=	@"3.0003";
	meter.text	=	 @"1";
	feet.text	=	@"3.2808";
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch	*touch	=	[[event allTouches] anyObject];
	
	if (touch.tapCount >= 1) {
		
		[chi resignFirstResponder];
		[meter resignFirstResponder];
		[feet resignFirstResponder];
	}
}
- (BOOL) textFieldShouldReturn:(UITextField*)textField{
	
	if (textField ==chi) {
		[chi resignFirstResponder];
		double m	=	[chi.text doubleValue]/3.0003;
		double f	=	m*3.2808;
		meter.text	=	[[NSString alloc]initWithFormat:@ "%.4f",m];
		feet.text	=	[[NSString alloc]initWithFormat:@ "%.4f",f];
	}
	
	if(textField == meter){
		[meter resignFirstResponder];
		double c	=	[meter.text doubleValue]*3.0003;
		double f = [meter.text doubleValue] * 3.2808;
		chi.text = [[NSString alloc]initWithFormat:@ "%.4f", c];
		feet.text = [[NSString alloc]initWithFormat:@ "%.4f", f];
	}
	if (textField == feet) {
		[feet resignFirstResponder];
		double m = [feet.text doubleValue]/3.2808;
		double c = m*3.0003;
		meter.text = [[NSString alloc]initWithFormat:@ "%.4f", m];
		chi.text = [[NSString alloc]initWithFormat:@ "%.4f", c];
	}
	return YES;
}

- (void)dealloc {
	[chi release];
	[meter release];
	[feet release];    
    [super dealloc];
}

@end
