//
//  SpotOnViewController.h
//  SpotOn
//
//  Created by 路宏亮 on 12-4-3.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface SpotOnViewController : UIViewController <UIAlertViewDelegate> {
	IBOutlet UILabel *scoreLabel;
	IBOutlet UILabel *levelLabel;
	IBOutlet UILabel *highScoreLabel;
	NSMutableArray *spots;
	NSMutableArray *lives;
	AVAudioPlayer *hitPlayer;
	AVAudioPlayer *missPlayer;
	AVAudioPlayer *disappearPlayer;
	int spotsTouched;
	int score;
	int level;
	float drawTime;
	BOOL gameOver;
	UIImage *touchedImage;
	UIImage *untouchedImage;
}

@property (nonatomic, retain)IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain)IBOutlet UILabel *levelLabel;
@property (nonatomic, retain)IBOutlet UILabel *highScoreLabel;

- (void)resetGame;
- (void)addNewSpot;

- (void)finishedAnimation:(NSString *)animationId finished:(BOOL)finished context:(void *)context;
- (void)touchedSpot:(UIImageView *)spot;

@end

