//
//  MainViewController.h
//  FlagQuiz
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UIImageView *flagView;
	IBOutlet UILabel *answerLabel;
	IBOutlet UILabel *numCorrectLabel;
	NSMutableArray *bars;
	NSMutableArray *filenames;
	NSMutableArray *quizCountries;
	NSMutableDictionary *regions;
	NSString *correctAnswer;
	int totalGuesses;
	int numCorrect;
	int guessRows;
}

@property (nonatomic, retain) IBOutlet UIImageView *flagView;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;
@property (nonatomic, retain) IBOutlet UILabel *numCorrectLabel;



- (IBAction)showInfo;

- (IBAction)submitGuess:sender;
- (void) loadNextFlag;
- (void) setGuessRows:(int)rows;
- (void) resetQuiz;
- (NSMutableDictionary*)regions;

@end


@interface NSString(displayName)
- (NSString *)convertToDisplayName;
@end