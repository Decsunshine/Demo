//
//  MainViewController.m
//  FlagQuiz
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

static const int BAR_OFFSET = 260;

@implementation MainViewController

@synthesize flagView;
@synthesize answerLabel;
@synthesize numCorrectLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		
		guessRows = 1;
		bars = [[NSMutableArray alloc] init];
		filenames = [[NSMutableArray alloc] init];
		
		quizCountries = [[NSMutableArray alloc] initWithCapacity:10];
		
		regions = [[NSMutableDictionary alloc] init];
		
		NSNumber *yesBool = [NSNumber numberWithBool:YES];
		[regions setValue:yesBool forKey:@ "Africa"];
		[regions setValue:yesBool forKey:@ "Asia"];
		[regions setValue:yesBool forKey:@ "Europe"];
		[regions setValue:yesBool forKey:@ "North_America"];
		[regions setValue:yesBool forKey:@ "Oceania"];
		[regions setValue:yesBool forKey:@ "South_America"];
    }
    return self;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 
	 srandom(time(0));
	 
	 [answerLabel setText:nil];
	 [numCorrectLabel setText:@ "Question 1 of 10"];
	 
	 NSMutableArray *paths = [[[NSBundle mainBundle]
							  pathsForResourcesOfType:@"png" inDirectory:nil] mutableCopy];
	 
	 for (NSString * filename in paths) {
		 filename = [filename lastPathComponent];
		 [filenames addObject:filename];
	 }
	 
	 [paths release];
	 [self resetQuiz];
 }

- (void)loadNextFlag
{
	NSString *nextImageName = [[quizCountries lastObject] retain];
	[quizCountries removeLastObject];
	correctAnswer = nextImageName;
	
	UIImage *nextImage = [UIImage imageNamed:nextImageName];
	UIImageView *nextImageView = [[UIImageView alloc] initWithImage:nextImage];
	
	[nextImageView setFrame:[flagView frame]];
	[flagView removeFromSuperview];
	[flagView release];
	flagView = nextImageView;
	[self.view addSubview:flagView];
	
	int offset = BAR_OFFSET + 40 * bars.count;
	
	for (int i = bars.count; i < guessRows; i++) {
		UISegmentedControl *bar = [[UISegmentedControl alloc] initWithItems:
								   [NSArray arrayWithObjects:@"", @"", @"", nil]];
		bar.segmentedControlStyle = UISegmentedControlStyleBar;
		
		bar.momentary = YES;
		
		[bar addTarget:self action:@selector(submitGuess:)
	  forControlEvents:UIControlEventValueChanged];
		CGRect frame = bar.frame;
		frame.origin.y = offset;
		frame.origin.x = 20;
		
		frame.size.width = self.view.frame.size.width - 40;
		bar.frame = frame;
		[self.view addSubview:bar];
		[bars addObject:bar];
		[bar release];
		offset += 40;
	}
	
	for (int i = bars.count; i > guessRows; i --) {
		UISegmentedControl *bar = [bars lastObject];
		[bar removeFromSuperview];
		[bars removeLastObject];
	}
	
	for (UISegmentedControl *bar in bars) {
		bar.enabled = YES;
		for (int i = 0; i < 3; i++) {
			[bar setEnabled:YES forSegmentAtIndex:i];
		}
	}
	
	for (int i = 0; i < filenames.count; i ++) {
		int n = (random() % (filenames.count - i)) + i;
		[filenames exchangeObjectAtIndex:i withObjectAtIndex:n];
	}
	
	int correct = [filenames indexOfObject:correctAnswer];
	
	[filenames exchangeObjectAtIndex:filenames.count - 1 withObjectAtIndex:correct];
	
	int flagIndex = 0;
	
	for (int i = 0; i < guessRows; i++) {
		UISegmentedControl *bar = (UISegmentedControl*)[bars objectAtIndex:i];
		int segmentIndex = 0;
		
		while (segmentIndex < 3) {
			NSString *name;
			
			if (flagIndex < filenames.count) {
				name = [filenames objectAtIndex:flagIndex];
			} else name = nil;
			
			NSString *region = [[name componentsSeparatedByString:@ "-"]objectAtIndex:0];
			
			if ([[regions valueForKey:region] boolValue]) {
				[bar setTitle:[name convertToDisplayName]
			forSegmentAtIndex:segmentIndex];
				++segmentIndex;
			}
			
			++flagIndex;
		}
	}
	
	int z = random() % guessRows;
	
	UISegmentedControl *bar = [bars objectAtIndex:z];
	
	[bar setTitle:[correctAnswer convertToDisplayName]
forSegmentAtIndex:random() % 3];
	[numCorrectLabel setText:[NSString stringWithFormat:
							  @ "Question %i of 10", numCorrect + 1]];
	[answerLabel setText:nil];
}

- (IBAction)submitGuess:sender
{
	int index = [sender selectedSegmentIndex];
	
	NSString *guess = [sender titleForSegmentAtIndex:index];
	++totalGuesses;
	
	if ([guess isEqualToString:[correctAnswer convertToDisplayName]]) {
		answerLabel.textColor = [UIColor colorWithRed:0.0 green:0.7 blue:0.0 alpha:1.0];
		answerLabel.text = @ "Correct!";
		
		NSString *correct = [correctAnswer convertToDisplayName];
		
		for (UISegmentedControl *bar in bars) 
		{
			bar.enabled = NO;
			
			for (int i = 0; i < 3; i ++) 
			{
				NSString *title = [bar titleForSegmentAtIndex:i];
				
				if (![title isEqualToString:correct])
				{
					[bar setEnabled:NO forSegmentAtIndex:i];
				}
			}
			
			++numCorrect;
			if (numCorrect == 10)
			{
				NSString *message = [NSString stringWithFormat:
									 @ "%i guesses,%0.2f%%correct",totalGuesses,
									 1000/(float)totalGuesses];
				
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
															   @ "Results"
															   message:message
															  delegate:self
													 cancelButtonTitle:@ "Reset Quiz" 
													 otherButtonTitles:nil];
				[alert show];
				[alert release];
			}
			else 
			{
				[self performSelector:@selector(loadNextFlag) withObject:nil
						   afterDelay:3];
			}

		}
	}
		else 
		{
			answerLabel.textColor = [UIColor redColor];
			answerLabel.text = @ "Incorrect";
			
			[sender setEnabled:NO forSegmentAtIndex:index];
		}

	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self resetQuiz];
}

- (void)setGuessRows:(int)rows
{
	guessRows = rows;
}

- (void)resetQuiz
{
	numCorrect = 0;
	totalGuesses = 0;
	int i = 0;
	while (i < 10) {
		int n = random() % filenames.count;
		
		NSString *filename = [filenames objectAtIndex:n];
		NSArray *components = [filename componentsSeparatedByString:@ "-"];
		
		NSString *region = [components objectAtIndex:0];
		
		NSNumber *regionEnabled = [regions valueForKey:region];
		
		if ([regionEnabled boolValue] && ![quizCountries containsObject:filename]) {
			[quizCountries addObject:filename];
			++i;
		}
	}
	[self loadNextFlag];
}

- (NSMutableDictionary *) regions
{
	return regions;
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	[controller setSwitches:regions];
	[controller setSelectedIndex:guessRows - 1];
	
	[controller release];
}



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
	[filenames release];
	[bars release];
	[quizCountries release];
	[flagView release];
	[answerLabel release];
	[numCorrectLabel release];
    [super dealloc];
}


@end

@implementation NSString (displayName)
- (NSString *)convertToDisplayName
{
	NSString *name = [[self componentsSeparatedByString:@ "-"] objectAtIndex:1];
	
	NSMutableString *displayName = [[name mutableCopy] autorelease];
	
	[displayName replaceOccurrencesOfString:@ ".png" withString:@ "" options:NSLiteralSearch range:NSMakeRange(0, displayName.length)];
	
	[displayName replaceOccurrencesOfString:@ "-" withString:@ "" options:NSLiteralSearch range:NSMakeRange(0, displayName.length)];
	return displayName;
}

@end

