//
//  SimonSaysViewController.m
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "SimonSaysViewController.h"
#include <stdlib.h>

@implementation SimonSaysViewController

@synthesize instructionLabel;
@synthesize instructions;

@synthesize initialFingerDistance;
@synthesize currentFingerDistance;

@synthesize goodSwipe;

- (BOOL)canBecomeFirstResponder
{
	return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
	[self becomeFirstResponder];
	[super viewDidAppear:animated];
}


- (CGFloat)fingerDistance:(NSSet *)touches
{
	CGFloat distance = 0.0;
	
	if (touches.count == 2) {
		NSArray *fingerTouches = [touches allObjects];
		
		UITouch *finger1 = [fingerTouches objectAtIndex:0];
		UITouch *finger2 = [fingerTouches objectAtIndex:1];
		CGPoint finger1Point = [finger1 locationInView: self.view];
		CGPoint finger2Point = [finger2 locationInView: self.view];
		
		CGFloat x = finger1Point.x - finger2Point.x;
		CGFloat y = finger1Point.y - finger2Point.y;
		distance = sqrt((x * x) + (y * y));
	}
	return distance;
}



- (void) viewDidLoad 
{
	lastSuccess = 0;
	currentInstructionCounter = 0;
	instructions = [self randomizeInstructions:100];
	[self nextInstruction];
	
	[super viewDidLoad];
}

- (NSMutableArray *)randomizeInstructions:(int)howMany
{
	NSArray *initialInstructions = [[NSArray alloc] initWithObjects:
									[[Instruction alloc] initWithType:InstructionTypeTap modifier:2],
									[[Instruction alloc] initWithType:InstructionTypeTap modifier:3],									
									[[Instruction alloc] initWithType:InstructionTypeTap modifier:4],									
									[[Instruction alloc] initWithType:InstructionTypeTap modifier:5],
									[[Instruction alloc] initWithType:InstructionTypeSwipe modifier:1],
									[[Instruction alloc] initWithType:InstructionTypeSwipe modifier:2],									
									[[Instruction alloc] initWithType:InstructionTypeSwipe modifier:3],									
									[[Instruction alloc] initWithType:InstructionTypeSwipe modifier:4],	
									[[Instruction alloc] initWithType:InstructionTypePinch modifier:Pinch],
									[[Instruction alloc] initWithType:InstructionTypePinch modifier:PinchApart],
									[[Instruction alloc] initWithType:InstructionTypeShake modifier:-1],
									nil];
	
	instructions = [[NSMutableArray alloc] initWithCapacity:howMany];
	
	for (int i = 0; i < howMany; i ++) {
		[instructions addObject:[initialInstructions objectAtIndex:(arc4random() % 11)]];
	}
	return instructions;
}

- (Instruction *)currentInstruction {
	return [instructions objectAtIndex:(currentInstructionCounter - 1)];
}

- (void)nextInstruction {
	currentInstructionCounter += 1;
	
	if (currentInstructionCounter > [instructions count]) {
		currentInstructionCounter = 1;
	}
	
	instructionLabel.text = [[self currentInstruction] description];
}

- (BOOL) tooSoon:(UIEvent *)event
{
	if (event.timestamp - lastSuccess < 0.75) {
		return YES;
	}
	return NO;
}


- (void)handleSuccess:(BOOL)success withEvent:(UIEvent *)event
{
	if (success) {
		lastSuccess = event.timestamp;
		self.view.backgroundColor = [UIColor greenColor];
		[self nextInstruction];
	} else {
		self.view.backgroundColor = [UIColor redColor];
	}
	
}


#pragma mark -
#pragma mark UIResponder

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{


}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ([self tooSoon:event]) {
		return;
	}
	
	Instruction *simonSaid = [self currentInstruction];
	
	if (touches.count == simonSaid.modifier) {
		goodSwipe = true;
	} else if (simonSaid.type == InstructionTypePinch && touches.count == 2) {
		currentFingerDistance = [self fingerDistance:touches];
		if (initialFingerDistance == 0.0) {
			initialFingerDistance == currentFingerDistance;
		}
	}

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ([self tooSoon:event]) {
		return;
	}
	
	BOOL success = NO;
	
	Instruction *simonSaid = [self currentInstruction];
	if (simonSaid.type == InstructionTypeSwipe && goodSwipe == YES) {
		
		goodSwipe = NO;
		
		success = YES;
	
	} else if (simonSaid.type == InstructionTypeTap && touches.count == 1) {
		
		UITouch *touch = [touches anyObject];
		
		if (simonSaid.modifier == touch.tapCount) {
		
			success = YES;
		
		}
	} else if (simonSaid.type == InstructionTypePinch && initialFingerDistance != 0.0 && currentFingerDistance != 0.0) {
		CGFloat distance = 0.0;
		
		if (simonSaid.modifier == Pinch) {
			distance = initialFingerDistance - currentFingerDistance;
		} else {
			distance = currentFingerDistance - initialFingerDistance;
		}
		
		if (distance > PINCH_DISTANCE) {
			initialFingerDistance = 0.0;
			currentFingerDistance = 0.0;
			success = YES;
		}

	}
	/*
	if (success) {
		lastSuccess = event.timestamp;
		self.view.backgroundColor = [UIColor greenColor];
		[self nextInstruction];
	}else {
		self.view.backgroundColor = [UIColor redColor];
	}
	  */
	
	[self handleSuccess: success withEvent:event];

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	BOOL success = NO;
	
	Instruction *simonSaid = [self currentInstruction];
	if (simonSaid.type == InstructionTypeShake && motion == UIEventSubtypeMotionShake) {
		success = YES;
	}
	[self handleSuccess: success withEvent:event];
}

#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
			
	}
	return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[instructions release];
	[instructionLabel release]; 
    [super dealloc];
}

@end
