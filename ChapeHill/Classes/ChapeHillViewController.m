//
//  ChapeHillViewController.m
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ChapeHillViewController.h"
#import "MapViewController.h"



@implementation ChapeHillViewController

@synthesize locMan;
@synthesize distanceLabel;
@synthesize distanceView;
@synthesize waitView;

@synthesize recentLocation;
@synthesize directionArrow;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	locMan = [[CLLocationManager alloc] init];
	locMan.delegate = self;
	locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
	locMan.distanceFilter = 1609;
	[locMan startUpdatingLocation];
	if (locMan.headingAvailable) {
		locMan.headingFilter = 2;
		[locMan startUpdatingHeading];
	}
	
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
			fromLoation:(CLLocation *)oldLocation {
	
	if (newLocation.horizontalAccuracy >= 0) {
		self.recentLocation = newLocation;
		
		CLLocation *ChapelHill = [[[CLLocation alloc] 
								  initWithLatitude:kChapelHillLatitude
								  longitude:kChapelHillLongitude] autorelease];
		CLLocationDistance delta = [ChapelHill getDistanceFrom: newLocation];
		long miles = (delta * 0.000621371) + 0.5;
		if (miles < 3) {
			[manager stopUpdatingLocation];
			
			[manager stopUpdatingHeading];
			
			[self startMapViewSwitchTimer];
			
			distanceLabel.text = @ "Enjoy the\nSouthern Part of Heaven!";
		} else {
			NSNumberFormatter *commaDelimited = [[[NSNumberFormatter alloc] init] autorelease];
			[commaDelimited setNumberStyle:NSNumberFormatterDecimalStyle];
			distanceLabel.text = [NSString stringWithFormat:
								  @ "%@ miles to the\nSouthern Part of Heaven",
								  [commaDelimited stringFromNumber:
								  [NSNumber numberWithLong:miles]]];
		}
		waitView.hidden = YES;
		distanceView.hidden = NO;
	}
}


- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading {
	
    if (self.recentLocation != nil && newHeading.headingAccuracy >= 0) {
        CLLocation *chapelHill = [[[CLLocation alloc]
                                   initWithLatitude:kChapelHillLatitude
                                   longitude:kChapelHillLongitude] autorelease];
        double course = [self headingToLocation:chapelHill.coordinate
                                        current:recentLocation.coordinate];
        double delta = newHeading.trueHeading - course;
        if (abs(delta) <= 10) {
            directionArrow.image = [UIImage imageNamed:@"up_arrow.png"];
        } else {
            if (delta > 180) directionArrow.image = 
				[UIImage imageNamed:@"right_arrow.png"];
            else if (delta > 0) directionArrow.image = 
                [UIImage imageNamed:@"left_arrow.png"];
            else if (delta > -180) directionArrow.image = 
                [UIImage imageNamed:@"right_arrow.png"];
            else directionArrow.image = [UIImage imageNamed:@"left_arrow.png"];
        }
        directionArrow.hidden = NO;
    } else {
        directionArrow.hidden = YES;
    }
	
}


- (void)locationManager:(CLLocationManager *)manager 
	   didFailWithError:(NSError *)error{
	if (error.code == kCLErrorDenied) {
		[manager stopUpdatingLocation];
		[locMan release];
		locMan = nil;
		
	}
	
	waitView.hidden = YES;
	distanceView.hidden = NO;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)startMapViewSwitchTimer{
	SEL methodSelector = @selector(mapViewSwitch);
	
	[NSTimer scheduledTimerWithTimeInterval:2.5
									 target:self
								   selector:methodSelector
								   userInfo:nil
									repeats:NO];
}



- (void)mapViewSwitch {
	MapViewController *mapViewController = [[MapViewController alloc] init];
	[self presentModalViewController:mapViewController animated:YES];
	[mapViewController release];
}



/*
 * According to Ask Dr. Math:
 * http://mathforum.org/library/drmath/view/55417.html
 *
 * y = sin(lon2-lon1)*cos(lat2)
 * x = cos(lat1)*sin(lat2)-sin(lat1)*cos(lat2)*cos(lon2-lon1)
 * if y > 0 then
 *    if x > 0 then tc1 = arctan(y/x)
 *    if x < 0 then tc1 = 180 - arctan(-y/x)
 *    if x = 0 then tc1 = 90
 * if y < 0 then
 *    if x > 0 then tc1 = -arctan(-y/x)
 *    if x < 0 then tc1 = arctan(y/x)-180
 *    if x = 0 then tc1 = 270
 *    if y = 0 then
 * if x > 0 then tc1 = 0
 *    if x < 0 then tc1 = 180
 *    if x = 0 then [the 2 points are the same]
 */
-(double)headingToLocation:(CLLocationCoordinate2D)desired
				   current:(CLLocationCoordinate2D)current {
	
    // Gather the variables needed by the heading algorithm
    double lat1 = current.latitude;
    double lat2 = desired.latitude;
    double lon1 = current.longitude;
    double lon2 = desired.longitude;
    double y = sin(lon2-lon1)*cos(lat2);
    double x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(lon2-lon1);
    
    double heading = -1;
    if (y > 0) {
        if (x > 0) heading = atan(y/x);
        else if (x < 0) heading = 180 - atan((-1 * y)/x);
        else heading = 90;
    } else if (y < 0) {
        if (x > 0) heading = -1 * atan((-1 * y)/x);
        else if (x < 0) heading = atan(y/x) - 180;
        else heading = 270;
    } else {
        if (x > 0) heading = 0;
        else heading = 180;
    }
    return heading;
}



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
	[locMan release];
	[distanceView release];
	[distanceLabel release];
	[waitView release];
	
	[recentLocation release];
	[directionArrow release];
    [super dealloc];
}

@end
