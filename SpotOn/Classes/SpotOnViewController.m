//
//  SpotOnViewController.m
//  SpotOn
//
//  Created by 路宏亮 on 12-4-3.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "SpotOnViewController.h"
static const int BALL_RADIUS = 40;

@implementation SpotOnViewController

@synthesize scoreLabel;
@synthesize levelLabel;
@synthesize highScoreLabel;

- (void)viewDidLoad {
	[super viewDidLoad];
	srandom(time(0));
	spots = [[NSMutableArray alloc] init];
	lives = [[NSMutableArray alloc] init];
	
	touchedImage = [UIImage imageNamed:@ "touched.png"];
	untouchedImage = [UIImage imageNamed:@ "untouched.png"];
	
	
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:@ "hit" ofType:@ "wav"];
	
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundPath];
	
	hitPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
	hitPlayer.volume = 0.3;
	
	
	soundPath = [[NSBundle mainBundle] pathForResource:@ "miss" ofType:@ "wav"];
	
	[fileURL release];
	fileURL = [[NSURL alloc] initFileURLWithPath:soundPath];
	
	missPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
	missPlayer.volume = 0.7;
	
	
	soundPath = [[NSBundle mainBundle] pathForResource:@ "disappear" ofType:@ "wav"];
	
	[fileURL release];
	fileURL = [[NSURL alloc] initFileURLWithPath:soundPath];
	
	disappearPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
	disappearPlayer.volume = 0.3;
	[fileURL release];
	
	
	[self resetGame];
}

- (void)resetGame
{
	[spots removeAllObjects];
	drawTime = 3.0;
	spotsTouched = 0;
	score = 0;
	level = 1;
	[scoreLabel setText:@ "Score: 0"];
	[levelLabel setText:@ "Level: 1"];
	
	NSNumber *highScore = [[NSUserDefaults standardUserDefaults] valueForKey:@ "highScore"];
	
	if (highScore == nil) {
		highScore = [NSNumber numberWithInt:0];
	}
	
	[highScoreLabel setText:[NSString stringWithFormat:@ "High Score:%@", highScore]];
	gameOver = NO;
	
	for (int i = 0; i < 3; i ++) {
		UIImageView *life = [[UIImageView alloc] initWithImage:touchedImage];
		
		CGRect frame = CGRectMake(10 + 40 * i, 420, 30, 30);
		life.frame = frame;
		[lives addObject:life];
		[self.view addSubview:life];
		[life release];
	}
	
	[self addNewSpot];
	[self performSelector:@selector(addNewSpot) withObject:nil afterDelay:1.0];
	[self performSelector:@selector(addNewSpot) withObject:nil afterDelay:2.0];
}

- (void)addNewSpot
{
	float viewWidth = self.view.bounds.size.width;
	float viewHeight = self.view.bounds.size.height;
	
	float x = random() % (int)(viewWidth - 2 * BALL_RADIUS);
	float y = random() % (int)(viewHeight -2 * BALL_RADIUS);
	
	UIImageView *spot = [[UIImageView alloc] initWithImage:untouchedImage];
	[spots addObject:spot];
	[self.view addSubview:spot];
	
	[spot setFrame:CGRectMake(x, y, BALL_RADIUS * 2, BALL_RADIUS * 2)];
	
	[self performSelector:@selector(beginSpotAnimation:)withObject:spot	afterDelay:0.01];
	
	[spot release];
}

- (void)beginSpotAnimation:(UIImageView *)spot
{
	float viewWidth = [self.view bounds].size.width;
	float viewHeight = [self.view bounds].size.height;
	
	float x = random() % (int)(viewWidth - 2 * BALL_RADIUS);
	float y = random() % (int)(viewHeight - 2 * BALL_RADIUS);
	
	[UIView beginAnimations:nil context:spot];
	[UIView setAnimationDelegate:self];
	
	[UIView setAnimationDidStopSelector:@selector(finishAnimation:finished:context:)];
	[UIView setAnimationDuration:drawTime];
	
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	
	[spot setFrame:CGRectMake(x + BALL_RADIUS, y + BALL_RADIUS, 0, 0)];
	[UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	BOOL hitSpot = NO;
	
	for (UITouch *touch in touches) {
		CGPoint point = [touch locationInView:self.view];
		
		for (int i = spots.count - 1; i >= 0 && !hitSpot; i --) {
			UIImageView *spot = [spots objectAtIndex:i];
			
			CGRect frame = [[spot.layer presentationLayer] frame];
			
			CGPoint origin = CGPointMake(frame.origin.x + frame.size.width / 2, frame.origin.y + frame.size.height / 2);
			
			float distance = pow(origin.x - point.x, 2) + pow(origin.y - point.y, 2);
			distance = sqrt(distance);
			
			if (distance <= frame.size.width / 2) {
				spot.image = touchedImage;
				[self touchedSpot:spot];
				hitSpot = YES;
			}
		}
	}
	
	if (!hitSpot) {
		[missPlayer play];
		score -= 20 * level;
		if (score < 0) {
			score = 0;
		}
		
		[scoreLabel setText:[NSString stringWithFormat:@ "Score:%i",score]];
	}
}

- (void) touchedSpot:(UIImageView *)spot
{
	++ spotsTouched;
	score += 10 * level;
	hitPlayer.currentTime = 0;
	[hitPlayer play];
	
	[scoreLabel setText:[NSString stringWithFormat:@ "Score:%i", score]];
	
	if (spotsTouched % 10 == 0) {
		++level;
		drawTime *= 0.95;
		
		[levelLabel setText:[NSString stringWithFormat:@ "Level:%i",level]];
		
		if (lives.count < 7) {
			UIImageView *life = [[UIImageView alloc]initWithImage:touchedImage];
			
			CGRect frame = CGRectMake(10 + 40 * lives.count, 420, 30, 30);
			life.frame = frame;
			[self.view addSubview:life];
			[lives addObject:life];
			[life release];
		}
	}
	
		CGRect frame = [[spot.layer presentationLayer]frame];
		[spot.layer removeAllAnimations];
		spot.frame = frame;
		[spot setNeedsDisplay];
		
		[self performSelector:@selector(beginSpotEndAnimation:)withObject:spot afterDelay:0.01];

}

- (void)beginSpotEndAnimation:(UIImageView *)spot
{
	[UIView beginAnimations:@ "end" context:spot];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationDelegate:self];
	
	[UIView setAnimationDidStopSelector:@selector(finishedAnimation:finished:context:)];
	
	CGRect frame = spot.frame;
	frame.origin.x += frame.size.width / 2;
	frame.origin.y += frame.size.height / 2;
	frame.size.width = 0;
	frame.size.height = 0;
	[spot setFrame:frame];
	[spot setAlpha:0.0];
	[UIView commitAnimations];
}

- (void)finishedAnimation:(NSString *)animationId finished:(BOOL)finished context:(void *)context
{
	if (gameOver) {
		return;
	}
	
	UIImageView *spot = (UIImageView *)context;
	if (animationId == @ "end") {
		[spots removeObject:spot];
		[spot removeFromSuperview];
		[self addNewSpot];
	} else if ([spot.image isEqual:untouchedImage]) {
		[disappearPlayer play];
		
		if (lives.count == 0) {
			for (UIImageView *spot in spots) {
				[spot removeFromSuperview];
				[spot.layer removeAllAnimations];
				
			}
			
			gameOver = YES;
			
			NSString *message = [NSString stringWithFormat:@ "Score: %i",score];
			
			NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
			
			int highScore = [[defaults valueForKey:@ "highScore"] intValue];
			
			if (score > highScore) {
				[defaults setValue:[NSNumber numberWithInt:score] forKey:@ "highScore"];
				
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@ "Game Over" message:message delegate:self cancelButtonTitle:@ "Reset Game" otherButtonTitles:nil];
				[alert show];
				[alert release];
			} else {
				UIImageView *life = [lives lastObject];
				[lives removeLastObject];
				[life removeFromSuperview];
				
				[spot removeFromSuperview];
				[self addNewSpot];
			}

		}
	}
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self resetGame];
	
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{	
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

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
	[spots release];
	[lives release];
	[hitPlayer release];
	[missPlayer release];
	[disappearPlayer release];
	[scoreLabel release];
	[levelLabel release];
	[highScoreLabel release];
    [super dealloc];
}

@end
