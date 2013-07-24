//
//  FlipsideView.m
//  myDay29
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideView.h"

@implementation FlipsideView

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
