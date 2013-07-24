//
//  FlashCardsViewController.h
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCard.h"
#import "CreateCardViewController.h"

@interface FlashCardsViewController : UIViewController <CreateCardDelegate> {

	IBOutlet UILabel *cardCount;
	IBOutlet UILabel *wrongCount;
	IBOutlet UILabel *rightCount;
	IBOutlet UILabel *question;
	IBOutlet UILabel *answer;
	IBOutlet UIBarButtonItem *deleteButton;
	IBOutlet UIBarButtonItem *rightButton;
	IBOutlet UIBarButtonItem *wrongButton;
	IBOutlet UIBarButtonItem *actionButton;
	
	NSMutableArray *flashCards;
	NSUInteger currentCardCounter;
	FlashCard *currentCard;
	NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain)UILabel *cardCount;
@property (nonatomic, retain)UILabel *wrongCount;
@property (nonatomic, retain)UILabel *rightCount;
@property (nonatomic, retain)UILabel *question;
@property (nonatomic, retain)UILabel *answer;
@property (nonatomic, retain)UIBarButtonItem *deleteButton;
@property (nonatomic, retain)UIBarButtonItem *rightButton;
@property (nonatomic, retain)UIBarButtonItem *wrongButton;
@property (nonatomic, retain)UIBarButtonItem *actionButton;

@property (nonatomic, retain)NSMutableArray *flashCards;
@property (nonatomic, assign)NSUInteger currentCardCounter;
@property (nonatomic, readonly)FlashCard *currentCard;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (IBAction) markWrong;
- (IBAction) markRight;
- (IBAction) nextAction;
- (IBAction) addCard;
- (IBAction) deleteCard;

- (void)showNextCard;
- (void)updateRightWrongCounters;

@end

