//
//  myDay12ViewController.m
//  myDay12
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay12ViewController.h"

@implementation myDay12ViewController
@synthesize startDate;
@synthesize pokerImage;
 
int spadeOn = 0;


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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@ "考反映扑克游戏" message:@ "当黑桃出现时以最块的速度按下扑克。" delegate:self cancelButtonTitle:@ "游戏开始" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(void) alertview: (UIAlertView*)alertView didDismissWithButtonIndex: (NSInteger)buttonIndex
{
	pokerImage.image = [UIImage imageNamed:@ "pokerBack.png"];
	spadeOn = 0;
	[NSTimer scheduledTimerWithTimeInterval:(3.0)
									 target:self
								     selector:@selector(onOtherAceTime)
								     userInfo:nil 
									 repeats:NO];
	
}

-(void) onSpadesAceTimer{
	pokerImage.image = [UIImage imageNamed:@ "spadesAce.png"];
	spadeOn = 1;
	self.startDate = [NSDate date];
	
}

-(void)onOtherAceTimer{
	int rNumber = rand() % 3;
	switch (rNumber) {
		case 0:
			pokerImage.image = [UIImage imageNamed:@ "clubsAce.png"];
			break;
		case 1:
			pokerImage.image = [UIImage imageNamed:@ "diamonsAce.png"];	
			break;
		case 2:
			pokerImage.image = [UIImage imageNamed:@ "heartsAce.png"];
			break;


		default:
			break;
	}
	
	int delay = ((int)(random() % 7) + 1);
	
	[NSTimer scheduledTimerWithTimeInterval:(3.0 + delay)
								   taget:self 
								   selector:@selector(onSpadesAceTimer)
								   userInfo:nil
								   repeats:NO];
}

-(IBAction)pokerPressed{
	double noSeconds = 
	 (double)[self.startDate timeIntervalSinceNow] * -1000;
	
	NSString *reactionTime = [[NSString alloc] initWithFormat:@ "哎唷！不错哦。。 你的响应速度是 %1.0f 毫秒。继续加油！",noSeconds];
	if (spadeOn == 0) {
		reactionTime = @ "请不要着急。等黑桃出现。。  黑桃哦！";
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@ "myDay12"
							  message:reactionTime
							  delegate:self
							  cancelButtonTitle:@ "确定"
							  otherButtonTitles:nil];
		
		[alert show];
		
		[alert release];
	}
	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}



- (void)dealloc {
	[startDate release];
	[pokerImage release];
    [super dealloc];
}

@end
