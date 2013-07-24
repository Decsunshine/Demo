
#import "FlashCardsViewController.h"

@implementation FlashCardsViewController

@synthesize cardCount, wrongCount, rightCount;
@synthesize question, answer;
@synthesize deleteButton, rightButton, wrongButton, actionButton;
@synthesize flashCards;
@synthesize currentCardCounter;

- (NSString *)archivePath{
	NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	
	return [docDir stringByAppendingPathComponent:@ "FlashCards.dat"];
}

- (void)archiveFlashCards{
	[NSKeyedArchiver archiveRootObject:flashCards toFile:[self archivePath]];
}

- (FlashCard *) currentCard{
	if (self.currentCardCounter < 0) {
		return nil;
	}
	FlashCard *flashCard = [self.flashCards objectAtIndex:self.currentCardCounter];
	return flashCard;
}

- (void)viewDidLoad{
	self.flashCards = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
	self.currentCardCounter = -1;
	if (self.flashCards == nil) {
		self.flashCards = [[NSMutableArray alloc] init];
	}
	[self showNextCard];
	[super viewDidLoad];
}

-(void)showNextCard{
	
	self.rightButton.enabled = NO;
	self.wrongButton.enabled = NO;
	
	NSUInteger numberOfCards = [self.flashCards count];

	if (numberOfCards == 0) {
		self.question.text = @ "";
		self.answer.text = @ "";
		self.cardCount.text = @ "Add a flash card to get Started";
		self.wrongCount.text = @ "";
		self.rightCount.text = @ "";
		self.deleteButton.enabled = NO;
		self.actionButton.enabled = NO;
	}else {
		self.currentCardCounter += 1;
		if (self.currentCardCounter >= numberOfCards)
		{
			self.currentCardCounter = 0;
		}
			self.cardCount.text = [NSString stringWithFormat:@ "%i of %i", (self.currentCardCounter + 1),numberOfCards];
			self.question.text = self.currentCard.question;
			self.answer.hidden = YES;
			self.answer.text = self.currentCard.answer;
			[self updateRightWrongCounters];
			self.deleteButton.enabled = YES;
			self.actionButton.enabled = YES;		
	}

}

- (void) updateRightWrongCounters {
	self.wrongCount.text = [NSString stringWithFormat:@ "Wrong: %i", self.currentCard.wrongCount];
	self.rightCount.text = [NSString stringWithFormat:@ "Right: %i", self.currentCard.rightCount];
}

- (IBAction) nextAction{
	if (self.answer.hidden) {
		self.answer.hidden = NO;
		self.rightButton.enabled = YES;
		self.wrongButton.enabled = YES;
		
	}else {
		[self showNextCard];
	}	
}

- (IBAction)markWrong{
	self.currentCard.wrongCount += 1;
	if(!self.rightButton.enabled){

		self.currentCard.rightCount -= 1;
	}
	self.wrongButton.enabled = NO;
	self.rightButton.enabled = YES;
	[self updateRightWrongCounters];
}

- (IBAction)markRight{
	self.currentCard.rightCount += 1;
	if (!self.wrongButton.enabled) {
		self.currentCard.wrongCount -= 1;
	}
	self.wrongButton.enabled = YES;
	self.rightButton.enabled = NO;
	[self updateRightWrongCounters];
}

- (IBAction)deleteCard{
	[self.flashCards removeObjectAtIndex:currentCardCounter];
	[self showNextCard];
}

#pragma mark -	
#pragma mark CreateCardDelegate

- (void)didCancelCardCreation {

	[self dismissModalViewControllerAnimated:YES];
	
}

- (void)didCreateCardWithQuestion:(NSString *)thisQuestion
						   answer:(NSString *)thisAnswer{
	FlashCard *newCard = [[FlashCard alloc] initWithQuestion:thisQuestion answer:thisAnswer];
	
	if (self.currentCardCounter >= [self.flashCards count]) {
		[self.flashCards addObject:newCard];
	}else {
		[self.flashCards insertObject:newCard atIndex:(self.currentCardCounter + 1)];
	}
	
	[self showNextCard];
	[self dismissModalViewControllerAnimated:YES];	
}

#pragma mark -

- (IBAction)addCard{
	CreateCardViewController *c = [[CreateCardViewController alloc]init];
	c.cardDelegate = self;
	[self presentModalViewController:c animated:YES];
	[c release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[cardCount release];
	[wrongCount release];
	[rightCount release];
	[question release];
	[answer release];
	[deleteButton release];
	[rightButton release];
	[wrongButton release];
	[actionButton release];
	[flashCards release];
    [super dealloc];
}

@end
