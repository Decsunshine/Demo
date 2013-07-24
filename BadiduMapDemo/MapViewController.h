//
//  MapViewController.h
//  BadiduMapDemo
//
//  Created by lhl on 13-6-8.
//  Copyright (c) 2013年 lhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface MapViewController : UIViewController<BMKMapViewDelegate>
{
    BMKMapView *_mapView;
}
@end
