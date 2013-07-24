//
//  MainViewController.h
//  PhotoGrabber
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController
       <FlipsideViewControllerDelegate,
        UIImagePickerControllerDelegate,
        UINavigationControllerDelegate> { 
			IBOutlet UIButton *iPhoto;
			IBOutlet UIButton *cameraRoll;
			IBOutlet UIButton *camera;
			IBOutlet UIImageView *photo;
}

@property (nonatomic, retain) UIButton *iPhoto;
@property (nonatomic, retain) UIButton *cameraRoll;
@property (nonatomic, retain) UIButton *camera;
@property (nonatomic, retain) UIImageView *photo;

- (IBAction)showInfo;

- (IBAction)iPhotoPressed:(id)sender;
- (IBAction)cameraRollPressed:(id)sender;
- (IBAction)cameraPressed:(id)sender;

@end
