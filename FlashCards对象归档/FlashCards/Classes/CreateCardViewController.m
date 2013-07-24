//
//  CreateCardViewController.m
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateCardViewController.h"

@implementation CreateCardViewController

@synthesize	cardDelegate;
@synthesize question, answer;



- (IBAction) save{
	[self.cardDelegate didCreateCardWithQuestion:question.text answer:answer.text];	
}

- (IBAction) cancel{
	[self.cardDelegate didCancelCardCreation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[question release];
	[answer release];
    [super dealloc];
}


@end
