//
//  ColorTiltViewController.h
//  ColorTilt
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorTiltViewController : UIViewController <UIAccelerometerDelegate> {	
	IBOutlet UIView *colorView;
}

@property (nonatomic, retain) UIView *colorView;

@end

