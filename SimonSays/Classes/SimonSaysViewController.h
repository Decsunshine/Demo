//
//  SimonSaysViewController.h
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instruction.h"

@interface SimonSaysViewController : UIViewController {
	IBOutlet UILabel *instructionLabel;
	
	NSMutableArray *instructions;
	NSUInteger currentInstructionCounter;
	NSTimeInterval lastSuccess;
	
	BOOL goodSwipe;
	
	CGFloat initialFingerDistance;
	CGFloat currentFingerDistance;
}

@property (nonatomic, retain) UILabel *instructionLabel;

@property (nonatomic, retain) NSMutableArray *instructions;

@property (nonatomic, assign) BOOL goodSwipe;

@property (nonatomic, assign) CGFloat initialFingerDistance;
@property (nonatomic, assign) CGFloat currentFingerDistance;

- (NSMutableArray *)randomizeInstructions:(int)howMany;
- (Instruction *)currentInstruction;
- (void) nextInstruction;
- (BOOL) tooSoon:(UIEvent *)event;

- (CGFloat)fingerDistance:(NSSet *)touches;

@end

