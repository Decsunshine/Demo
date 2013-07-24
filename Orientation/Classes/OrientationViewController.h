//
//  OrientationViewController.h
//  Orientation
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrientationViewController : UIViewController <UIAccelerometerDelegate>{
	IBOutlet UILabel *orientation;
}

@property (nonatomic, retain) UILabel *orientation;

@end

