//
//  GettingAttentionViewController.m
//  GettingAttention
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "GettingAttentionViewController.h"

@implementation GettingAttentionViewController

@synthesize statusMessage;

- (IBAction)doAlert:(id)sender
{
	UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
				   initWithTitle:@ "Alert Button Selected"
				   message:@ "I need your attention NOW!"
				   delegate:self
				   cancelButtonTitle:@ "OK"
				   otherButtonTitles:@ "Maybe Later", @ "Never", nil];
	[alertDialog show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@ "Maybe Later"]) {
		statusMessage.text = @ "Clicked 'Maybe Later'";
	} else if ([buttonTitle isEqualToString:@ "Never"])	{
		statusMessage.text = @ "Clicked 'Never'";
	} else {
		statusMessage.text = @ "Clicked 'OK'";
	}
}


- (IBAction)doActionSheet:(id)sender
{
	UIActionSheet *actionSheet;
	actionSheet = [[UIActionSheet alloc] initWithTitle:@ "Available Actions"
											  delegate:self
									 cancelButtonTitle:@ "Cancel"
								destructiveButtonTitle:@ "Destroy"
									 otherButtonTitles:@ "Negotiate", @ "Compromise", nil];
	//[actionSheet addButtonWithTitle:@ "ddd"];
	actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

{
	NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@ "Destroy"]) {
		statusMessage.text = @ "Clicked 'Destroy'";
	}else if ([buttonTitle isEqualToString:@ "Negotiate"]) {
		statusMessage.text = @ "Clicked 'Negotiate'";
	}else if ([buttonTitle isEqualToString:@ "Compromise"]) {
		statusMessage.text = @ "Clicked 'Compromise'";
	}else {
		statusMessage.text = @ "Clicked 'Cancel'";
	}
}

- (IBAction)doSound:(id)sender
{
	SystemSoundID soundID;
	NSString *soundFile = [[NSBundle mainBundle] pathForResource:@ "soundeffect" ofType:@ "wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundFile],&soundID);
	AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender
{
	SystemSoundID soundID;
	NSString *soundFile = [[NSBundle mainBundle] pathForResource:@ "alertsound" ofType:@ "wav"];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundFile],&soundID);
	AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender
{
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


@end
