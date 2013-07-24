//
//  ChapeHillViewController.h
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface ChapeHillViewController : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *locMan;
	
	CLLocation *recentLocation;
	
	IBOutlet UILabel *distanceLabel;
	IBOutlet UIView *distanceView;
	IBOutlet UIView *waitView;
	
	IBOutlet UIImageView *directionArrow;
}

@property (nonatomic, assign) CLLocationManager *locMan;

@property (nonatomic, retain) CLLocation *recentLocation;
@property (nonatomic, retain) UIImageView *directionArrow;

@property (nonatomic, retain) UILabel *distanceLabel;
@property (nonatomic, retain) UIView *distanceView;
@property (nonatomic, retain) UIView *waitView;

- (void)startMapViewSwitchTimer;
- (void)mapViewSwitch;

- (double)headingToLocation:(CLLocationCoordinate2D)desired
					current:(CLLocationCoordinate2D)current;

@end

