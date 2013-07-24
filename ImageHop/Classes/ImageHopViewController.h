//
//  ImageHopViewController.h
//  ImageHop
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageHopViewController : UIViewController {
	IBOutlet UIImageView *imageView;
	IBOutlet UIButton *toggleButton;
	IBOutlet UISlider *animationSpeed;
	IBOutlet UILabel *hopsPerSecond;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIButton *toggleButton;
@property (nonatomic, retain) UISlider *animationSpeed;
@property (nonatomic, retain) UILabel *hopsPerSecond;

- (IBAction)toggleAnimation:(id)sender;
- (IBAction)setSpeed:(id)sender;

@end

