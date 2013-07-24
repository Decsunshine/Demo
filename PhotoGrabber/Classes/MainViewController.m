//
//  MainViewController.m
//  PhotoGrabber
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController
@synthesize iPhoto;
@synthesize cameraRoll;
@synthesize camera;
@synthesize photo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		 iPhoto.enabled = NO;
		 
	 }
	 if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
		 cameraRoll.enabled = NO;
	 }
	 if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		 camera.enabled = NO;
		 
	 }
 }
 
- (void)pickPhoto:(UIImagePickerControllerSourceType)sourceType {
	UIImagePickerController *picker = [[UIImagePickerController alloc]init];
	picker.delegate = self;
	picker.sourceType = sourceType;
	[self presentModalViewController:picker animated:YES];
	[picker release];
}

- (IBAction)iPhotoPressed:(id)sender
{
	[self pickPhoto:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cameraRollPressed:(id)sender
{
	[self pickPhoto:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
	
}

- (IBAction)cameraPressed :(id)sender
{
	[self pickPhoto:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image 
				  editingInfo:(NSDictionary *)editingInfo{
	photo.image = image;
	[picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker dismissModalViewControllerAnimated:YES];
}

#pragma mark -

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
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
	[iPhoto release];
	[camera release];
	[cameraRoll release];
	[photo release];
    [super dealloc];
}


@end
