//
//  MainViewController.h
//  myDay30
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>
#import "BoardView.h"

#define BRICKHIGHT 15
#define BRICKWIDTH 44

#define BOARDHIGHT 10
#define BOARDWIGTH 48
#define TOP 40

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UILabel *HighestLabel;
	
	IBOutlet UILabel *levelLabel;
	
	IBOutlet UILabel *scoreLabel;
	
	NSTimer *timer;
	
	UIImageView *ball;
	
	CGPoint moveDis;
	
	BoardView *board;
	
	NSMutableArray *bricks;
	
	int highest,level,score;
	
	int numOfBricks;
	
	double speed;
	
	NSString *soundFile;
}

@property int level,score,highest;

@property int numOfBricks;

@property double speed;

@property(nonatomic, retain)NSString *soundFile;

- (IBAction)onLeft:(id)sender;


- (IBAction)onRight:(id)sender;

- (IBAction)onStart:(id)sender;

- (void)levelMap:(int)inlevel;

- (void)playSound:(NSString*)soundAct;

- (IBAction)showInfo;

@end
