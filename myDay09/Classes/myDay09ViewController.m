//
//  myDay09ViewController.m
//  myDay09
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay09ViewController.h"

@implementation myDay09ViewController

@synthesize passwordlength, password;

@synthesize includeLowerCase,includeUpperCase, includeNumbers;

#define RANDOM_SEED() srandom(time(NULL))

#define RANDOM_INT(_MIN_,_MAX_) ((_MIN_) + random() % ((_MAX_+1) - (_MIN_)))

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch	*touch	=	[[event allTouches] anyObject];
	
	if (touch.tapCount >= 1) {
		
		[passwordlength resignFirstResponder];
	}
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
	if (textField == password) {
		[password resignFirstResponder];
	}
	if (textField == passwordlength) {
		[passwordlength resignFirstResponder];
	}
	return YES;
}

-(IBAction)setPassword{
	NSInteger iPasswordLength = [passwordlength.text intValue];
	
	BOOL bIncludeLowerCase = includeLowerCase.on;
	BOOL bIncludeUpperCase = includeUpperCase.on;
	BOOL bIncludeNumbers = includeNumbers.on;
	
	NSString *passwordText = @"";
	NSString *lowercaseChars = @"abcdefghijklmnopqrstuvwxyz";
	NSString *uppercaseChars = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *numbersChars = @"1234567890";
	
	RANDOM_SEED();
	
	NSString *passwordChars = @"";
	
	if(bIncludeLowerCase){
		passwordChars = [NSString stringWithFormat:@ "%@%@",passwordChars, lowercaseChars];
	}
	if(bIncludeUpperCase){
    
		passwordChars = [NSString stringWithFormat:@ "%@%@",passwordChars, uppercaseChars];
	}
	if(bIncludeNumbers){
		passwordChars = [NSString stringWithFormat:@ "%@%@",passwordChars, numbersChars];
	}
	
	for (NSInteger i = 0; i<iPasswordLength; i++) {
		int index = RANDOM_INT (0, [passwordChars length] - 1);
		
		NSRange range = NSMakeRange(index, 1);
		NSString *passwordChar = [passwordChars substringWithRange:range];
		passwordText = [NSString stringWithFormat:@ "%@%@", passwordText, passwordChar];
	}
	password.text = @"";
	password.text = passwordText;
}




/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[passwordlength release];
	[password release];
	[includeNumbers release];
	[includeLowerCase release];
	[includeUpperCase release];
    [super dealloc];
}

@end
