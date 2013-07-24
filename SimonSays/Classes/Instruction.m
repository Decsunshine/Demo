//
//  Instruction.m
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Instruction.h"


@implementation Instruction

@synthesize type;
@synthesize modifier;

- (Instruction *)initWithType:(InstructionType)thisType modifier:(NSUInteger)thisModifier {
	self = [super init];
	type = thisType;
	modifier = thisModifier;
	
	return self;
}

- (NSString *)description {
	NSString *description = nil;
	switch (type){
		case InstructionTypeTap:
			description = [NSString stringWithFormat:@ "Simon says tap %i times.", modifier];
			break;
		case InstructionTypeSwipe:
			 
			if(modifier == 1) 
				description = [NSString stringWithFormat:@ "Simon says swipe with 1 finger."];
			else
				description = [NSString stringWithFormat:@ "Simon says swipe with %i finger", modifier];
			break;
		case InstructionTypePinch:
			if (modifier == Pinch)
				description = @ "Simon says pinch.";
			else 
				description = @ "Simon says pinch apart.";
			break;
		case InstructionTypeShake:
			description = @ "Simon says shake, shake shake.";
			break;

	}
	
	return description;
}

@end
