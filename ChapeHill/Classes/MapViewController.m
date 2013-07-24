//
//  MapViewController.m
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "MapPin.h"

@implementation MapViewController
@synthesize map;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		CLLocation *chapelHill = [[[CLLocation alloc]
								   initWithLatitude:kChapelHillLatitude
								   longitude:kChapelHillLongitude] autorelease];
	
	MKCoordinateRegion region = 
	  MKCoordinateRegionMakeWithDistance(chapelHill.coordinate, 6000, 6000);
	[self.map setRegion:region animated:YES];
}


- (void)addAnnotations
{
	CLLocationCoordinate2D coordinate = {35.9077803, -79.0454936};
	
	MapPin *pin = [[MapPin alloc] initWithCoordinates:coordinate
											placeName:@ "Keenan Stadium"
										  description:@ "Tar Heel Football"];
	
	[self.map addAnnotation:pin];
	[pin release];
	
	coordinate.latitude = 35.910777;
    coordinate.longitude = -79.048412;
    pin = [[MapPin alloc]initWithCoordinates:coordinate
								   placeName:@"Davis Library"
								 description:@"Main Campus Library"];
    [self.map addAnnotation:pin];
    [pin release];
    
    coordinate.latitude = 35.9131808;
    coordinate.longitude = -79.0557201;
    pin = [[MapPin alloc]initWithCoordinates:coordinate
                                   placeName:@"Spanky's"
                                 description:@"Spanky's Restaurant"];
    [self.map addAnnotation:pin];
    [pin release];
	
    coordinate.latitude = 35.9639089;
    coordinate.longitude = -79.0567349;
    pin = [[MapPin alloc]initWithCoordinates:coordinate
                                   placeName:@"Sage"
                                 description:@"Sage Vegetarian Cafe"];
    [self.map addAnnotation:pin];
    [pin release];
    
    coordinate.latitude = 35.914687;
    coordinate.longitude = -79.051539;
    pin = [[MapPin alloc]initWithCoordinates:coordinate
                                   placeName:@"Planetarium"
                                 description:@"Morehead Planetarium & Science Center"];
    [self.map addAnnotation:pin];
    [pin release];
	
    coordinate.latitude = 35.9130572;
    coordinate.longitude = -79.055671;
    pin = [[MapPin alloc]initWithCoordinates:coordinate
                                   placeName:@"Art Museum"
                                 description:@"Ackland Art Museum"];
    [self.map addAnnotation:pin];
    [pin release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
