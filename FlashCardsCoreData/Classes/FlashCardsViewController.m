
#import "FlashCardsViewController.h"

@implementation FlashCardsViewController

@synthesize cardCount, wrongCount, rightCount;
@synthesize question, answer;
@synthesize deleteButton, rightButton, wrongButton, actionButton;
@synthesize flashCards;
@synthesize currentCardCounter;

@synthesize managedObjectContext;



- (FlashCard *) currentCard{
	if (self.currentCardCounter < 0) {
		return nil;
		
	}
	FlashCard *flashCard = [self.flashCards objectAtIndex:self.currentCardCounter];
	return flashCard;
	
}

- (void)viewDidLoad{
	//self.flashCards = [[NSMutableArray alloc] init];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@ "FlashCard" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
	NSError *error;
	self.flashCards = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	[request release];
	
	self.currentCardCounter = -1;
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
	self.wrongCount.text = [NSString stringWithFormat:@ "Wrong: %i", [self.currentCard.wrongCount intValue]];
							//self.currentCard.wrongCount];
							
	self.rightCount.text = [NSString stringWithFormat:@ "Right: %i",[self.currentCard.rightCount intValue]];
							//self.currentCard.rightCount];
							
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
	//self.currentCard.wrongCount += 1;
	self.currentCard.wrongCount = [NSNumber numberWithInt:[self.currentCard.wrongCount intValue] + 1];
	
	if(!self.rightButton.enabled){

		//self.currentCard.rightCount -= 1;
		self.currentCard.rightCount = [NSNumber numberWithInt:[self.currentCard.rightCount intValue] - 1];
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
	FlashCard *cardToDelete = [self.flashCards objectAtIndex:currentCardCounter];
	
	[self.flashCards removeObjectAtIndex:currentCardCounter];
	
	[managedObjectContext deleteObject:cardToDelete];
	[self showNextCard];
}

#pragma mark -	
#pragma mark CreateCardDelegate

- (void)didCancelCardCreation {

	[self dismissModalViewControllerAnimated:YES];
	
}

-(void) didCreateCardWithQuestion:(NSString *)thisQuestion
                           answer:(NSString *)thisAnswer {
    
    // Add the new card as the next card
    FlashCard *newCard = [NSEntityDescription                          
						  insertNewObjectForEntityForName:@"FlashCard"
						  inManagedObjectContext:self.managedObjectContext];
    newCard.question = thisQuestion;
    newCard.answer = thisAnswer;
    if (self.currentCardCounter >= [self.flashCards count]) {
        [self.flashCards addObject:newCard];
    } else {
        [self.flashCards insertObject:newCard
							  atIndex:(self.currentCardCounter + 1)];
    }
    
    // Show the new card    
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
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
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
	
	[managedObjectContext release];
    [super dealloc];
}

@end
