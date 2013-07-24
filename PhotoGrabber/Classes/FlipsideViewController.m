//
//  FlipsideViewController.m
//  PhotoGrabber
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];    
	if (! [MFMailComposeViewController canSendMail]) {
		feedback.enabled = NO;
	}
}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

- (IBAction)sendFeedback:(id)sender {
	MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc]init];
	mailer.delegate = self;
	
	[mailer setToRecipients:[NSArray arrayWithObject:@ "feedback@snootymonkey.com"]];
	[mailer setSubject:@ "Feedback on Photo Grabber"];
	[mailer setMessageBody:
	 @ "<p>Hi Sean,</p><p>I have some feedback on Photo Grabber:</p>\
	 <br><br><p>Thanks!</p>" isHTML:YES];
	[self presentModalViewController:mailer animated:YES];
	[mailer release];
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)mailer
		  didFinishWithResult:(MFMailComposeResult)result 
						error:(NSError *)error {
	[mailer dismissModalViewControllerAnimated:YES];
}
#pragma mark -

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
    [super dealloc];
}


@end
