//
//  MapViewController.m
//  BadiduMapDemo
//
//  Created by lhl on 13-6-8.
//  Copyright (c) 2013年 lhl. All rights reserved.
//

#import "MapViewController.h"
#import "BMKMapView.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = mapView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

@end
