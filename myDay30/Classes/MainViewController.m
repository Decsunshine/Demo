//
//  MainViewController.m
//  myDay30
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"



@implementation MainViewController
@synthesize level,score,highest;
@synthesize numOfBricks;
@synthesize speed;
@synthesize soundFile;

- (void) playSound:(NSString *)soundAct{
	NSString *path = [NSString stringWithFormat:@ "%@%@",[[NSBundle mainBundle] resourcePath],soundAct];
	
	SystemSoundID soundID;
	
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
	
	AudioServicesPlaySystemSound(soundID);
}

- (IBAction) onLeft:(id)sender {
	[UIImageView beginAnimations:@ "animLeft" context:nil];
	
	[UIImageView setAnimationDuration:0.2];
	
	board.center = CGPointMake(board.center.x - 20, board.center.y);
	
	[UIImageView commitAnimations];
	
	soundFile = [NSString stringWithFormat:@ "/button_press.caf"];
	
	[self playSound:soundFile];
}

- (IBAction) onRight:(id)sender {
	[UIImageView beginAnimations:@ "animRight" context:nil];
	
	[UIImageView setAnimationDuration:0.2];
	
	board.center = CGPointMake(board.center.x + 20, board.center.y);
	
	[UIImageView commitAnimations];
	
	soundFile = [NSString stringWithFormat:@ "/button_press.caf"];
	
	[self playSound:soundFile];
}

- (IBAction)onStart:(id)sender{
	if (!timer) {
		timer = [NSTimer scheduledTimerWithTimeInterval:speed
												 target:self
											   selector:@selector(onTimer)
											   userInfo:nil
												repeats:YES];
		
		ball.frame = CGRectMake(160, 328, 32, 32);
		
		[self.view addSubview:ball];
		
		board.frame = CGRectMake(160, 360, 48, 10);
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	moveDis = CGPointMake(-3, -3);
	
	speed = 0.03;
	
	board = [[BoardView alloc] initWithImage:[UIImage imageNamed:@ "board.png"]];
	
	[board setUserInteractionEnabled:YES];
	
	board.frame = CGRectMake(160, 360, BOARDWIGTH, BOARDHIGHT);
	
	ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "ball.png"]];
	
	[self.view addSubview:board];
	
	level = 1; score = 0; highest = 0;
	
	levelLabel.text = [NSString stringWithFormat:@ "游戏级别: %i", level];
	
	scoreLabel.text = [NSString stringWithFormat:@ "现时得分: %i", score];
	
	HighestLabel.text = [NSString stringWithFormat:@ "最高成绩: %i", highest];
	
	[self levelMap:level];
}

- (void)levelMap:(int)inlevel{
	UIImageView *brick;
	
	switch (inlevel) {
		case 1:
			bricks = [NSMutableArray arrayWithCapacity:20];
			
			numOfBricks = 20;
			
			for (int i = 0; i < 3; i ++) {
				for (int j = 0; j < 6; j ++) {
					brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "brick.png"]];
					
					brick.frame = CGRectMake(20 + j * BRICKWIDTH + j * 5, TOP + 10 + BRICKHIGHT * i + 5 * i, BRICKWIDTH, BRICKHIGHT);
					
					[self.view addSubview:brick];
					
					[bricks addObject:brick];
				}
			}
					 
					 brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "brick.png"]];
					 
					 brick.frame = CGRectMake(20, TOP + 10 + 20 * 2 + 5 * 4, BRICKWIDTH, BRICKHIGHT);
					 
					 [self.view addSubview:brick];
					 
					 [bricks addObject:brick];
					 
					 brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "brick.png"]];
					 
					 brick.frame = CGRectMake(20 + 5 * BRICKWIDTH + 5 * 5, TOP + 10 + 20 * 2 + 5 * 4, BRICKWIDTH, BRICKHIGHT);
					 
					 [self.view addSubview:brick];
					 
					 [self.view addSubview:brick];
					 
					 [bricks addObject:brick];
					 
					 [bricks retain];
					 
					 
			break;
					 
		case 2:
					 
			bricks = [NSMutableArray arrayWithCapacity:28];
					 
			numOfBricks = 20;
					 
					 for	(int i = 0; i < 7; i ++) {
						 for (int j = 0; j < 2; j ++) {
							 brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "brick.png"]];
							 
							 brick.frame = CGRectMake(20 + j * BRICKWIDTH + j * 5, TOP + 10 + BRICKHIGHT * i + 5 * i, BRICKWIDTH, BRICKHIGHT);
							 
							 [self.view	 addSubview:brick];
							 
							 [bricks addObject:brick];
						}
					 }
					 
					 for (int i = 0; i < 7; i ++) {
						 for (int j = 0; j < 2; j ++) {
							 brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "brick.png"]];
							 
							 brick.frame = CGRectMake(20 + j * BRICKWIDTH + j * 5 + 180, TOP + 10 + BRICKHIGHT * i + 5 * i, BRICKWIDTH , BRICKHIGHT);
							 
							 [self.view addSubview:brick];
							 
							 [bricks addObject:brick];
							 
							 
						 }
					 }
					 
					 [bricks retain];
					 
					 break;
					 
					 
		default:
			break;
	}
}

					
					 
 - (void)onTimer{
	 float posx, posy;
	 
	 posx = ball.center.x;
	 posy = ball.center.y;
	 
	 ball.center  = CGPointMake(posx + moveDis.x, posy + moveDis.y);
	 
	 if (ball.center.x > 305 || ball.center.x < 15) {
		 moveDis.x = -moveDis.x;
	 }
	 
	 if (ball.center.y < TOP) {
		 moveDis.y = -moveDis.y;
	 }
	 
	 int j = [bricks count];
	 
	 for (int i = 0; i < j; i ++) {
		 UIImageView *brick = (UIImageView*)[bricks objectAtIndex:i];
		 
		 if (CGRectIntersectsRect(ball.frame, brick.frame) && [brick superview]) {
			 soundFile = [NSString stringWithFormat:@ "/Brick_move.caf"];
			 
			 [self playSound:soundFile];
			 
			 score  = score + 100;
			 
			 [brick removeFromSuperview];
			 
			 if (rand() % 5 == 0) {
				 UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "shorten.png"]];
				 
				 imageView.frame = CGRectMake(brick.frame.origin.x, brick.frame.origin.y, 48, 48);
				 
				 [self.view addSubview:imageView];
				 
				 [UIView beginAnimations:nil context:imageView];
				 
				 [UIView setAnimationDuration:5.0];
				 
				 [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
				 
				 imageView.frame = CGRectMake(brick.frame.origin.x, 380, 40, 40);
				 
				 [UIView setAnimationDelegate:self];
				 
				 [UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];
				 
				 [UIView commitAnimations];
				 
			 }
			 
			 numOfBricks--;
			 
			 if ((ball.center.y - 16 < brick.frame.origin.y + BRICKHIGHT || ball.center.y + 16 > brick.frame.origin.y) && ball.center.x > brick.frame.origin.x && ball.center.x < brick.frame.origin.x + BRICKWIDTH	) {
				 moveDis.y = -moveDis.y;
			 }else if (ball.center.y > brick.frame.origin.y && ball.center.y < brick.frame.origin.y + BRICKHIGHT && (ball.center.x + 16 > brick.frame.origin.x || ball.center.x - 16 < brick.frame.origin.x + BRICKWIDTH )) {
				 moveDis.x  = -moveDis.x;
			 }else {
				 moveDis.x = -moveDis.x;
				 
				 moveDis.y = -moveDis.y;
			 }

			 break;
		 }
		 
	 }
	 
	 if (numOfBricks == 0) {
		 if (level < 2) {
			 [ball removeFromSuperview];
			 
			 [timer	invalidate];
			 
			 level ++;
			 
			 speed = speed - 0.003;
			 
			 levelLabel.text = [NSString stringWithFormat:@ "Level %i", level];
			  
			 [self levelMap:level];
		 }else {
			 UIAlertView *alert = [[UIAlertView alloc]
								   initWithTitle:@ "K.O."
									message:@ "Congratullations! You win!"
								   delegate:self cancelButtonTitle:@ "OK"
								   otherButtonTitles:nil];
			 
			 [alert	 show];
			 
			 soundFile = [NSString stringWithFormat:@ "/Win.caf"];
			 
			 [self playSound:soundFile];
		 }

		 
	 }
	 
	 if (CGRectIntersectsRect(ball.frame, board.frame)) {
		 soundFile = [NSString stringWithFormat:@ "/Kick.caf"];
		 
		 [self playSound:soundFile];
		 
		 if (ball.center.x > board.frame.origin.x && ball.center.x < board.frame.origin.x + BOARDWIGTH) {
			 moveDis.y = -moveDis.y;
		 }else {
			 moveDis.x = -moveDis.x;
			 
			 moveDis.y = -moveDis.y;
		 }

	 }else {
		 if (ball.center.y > 380) {
			 [ball removeFromSuperview];
			 
			 [timer invalidate];
			 
			 timer = NULL;
			 
			 UIAlertView * alert = [[UIAlertView alloc]
									initWithTitle:@ "Game Over!"
									message:@ "失败了，下次努力哦。。。" 
									delegate:self cancelButtonTitle:@ "确定" 
									otherButtonTitles:nil];
			 [alert show];
			 
			 soundFile = [NSString stringWithFormat:@ "/Lose.caf"];
			 
			 [self playSound:soundFile];
		 }
	 }

 }

/*
- (void) removeSmoke:(NSString*)animationID finished:(NSNumber*)finished context:(void)context{

	UIImageView *imageView = context;
	
	[imageView removeFromSuperview];
	
	[imageView release];
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
	
	[controller release];
}




- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[soundFile release];
    [super dealloc];
}


@end
