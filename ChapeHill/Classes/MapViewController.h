//
//  MapViewController.h
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#define kChapelHillLatitude 35.9131501
#define kChapelHillLongitude -79.0557029
@interface MapViewController : UIViewController {
	IBOutlet MKMapView *map;
}

@property (retain, nonatomic) MKMapView *map;

-(void)addAnnotations;

@end
