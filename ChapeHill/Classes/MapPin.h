//
//  MapPin.h
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapPin : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *subtitle;
	NSString *title;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location
				placeName:placeName
			  description:description;

@end
