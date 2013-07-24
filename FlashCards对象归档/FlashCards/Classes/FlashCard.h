//
//  FlashCard.h
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kQuestion @ "Question"
#define kAnswer @ "Answer"
#define kRightCount @ "RightCount"
#define kWrongCount @ "WrongCount"

@interface FlashCard : NSObject <NSCoding>{
	
	NSString *question;
	NSString *answer;
	NSUInteger rightCount;
	NSUInteger wrongCount;

	
}

@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSString *answer;
@property (nonatomic, assign) NSUInteger rightCount;
@property (nonatomic, assign) NSUInteger wrongCount;

- (id)initWithQuestion:(NSString *)thisQuestion 
				answer:(NSString *)thisAnswer;

@end
