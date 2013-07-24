//
//  ChangeRectView.m
//  myDay23
//
//  Created by 路宏亮 on 12-3-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChangeRectView.h"


@implementation ChangeRectView

- (void)ChangeView
{
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:2.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    [self setTransform:CGAffineTransformMakeRotation(-0.75)];
    
    [UIView commitAnimations];
	
}

- (void)FlyView
{
	
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1.75];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [self setTransform:CGAffineTransformMakeScale(2.0, 2.0)];
    [self setTransform:CGAffineTransformMakeTranslation(120.0, -290.0)];
	
    [UIView commitAnimations];    
}




- (void)dealloc {
    [super dealloc];
}


@end