//
//  BoardView.m
//  myDay30
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"




@implementation BoardView

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	startLocation = [[touches anyObject] locationInView:self];
	
	[[self superview] bringSubviewToFront:self];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt  = [[touches anyObject] locationInView:self];
	
	CGRect frame = [self frame];
	
	frame.origin.x = frame.origin.x + (pt.x - startLocation.x);
	
	[self setFrame:frame];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}


@end
