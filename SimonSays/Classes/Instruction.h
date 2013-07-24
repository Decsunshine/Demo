//
//  Instruction.h
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PINCH_DISTANCE 75


typedef enum
{
	Pinch = 0,
	PinchApart = 1
} PinchType;

typedef enum {
	InstructionTypeTap,
	InstructionTypeSwipe,
	InstructionTypePinch,
	InstructionTypeShake
} InstructionType;

@interface Instruction : NSObject {
	InstructionType type;
	NSUInteger modifier;
}

@property (nonatomic, readonly) InstructionType  type;
@property (nonatomic, readonly) NSUInteger modifier;

- (Instruction *)initWithType:(InstructionType) type 
					 modifier:(NSUInteger)modifier;
- (NSString *)description;

@end
