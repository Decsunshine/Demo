//
//  myDay14ViewController.m
//  myDay14
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay14ViewController.h"

@implementation myDay14ViewController

@synthesize scrollView1, scrollView2;

const CGFloat kScrollObjHeight = 175.0;
const CGFloat kScrollObjWidth = 280.0;
const NSUInteger kNumImages = 5;

-(void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView1 subviews];
	
	CGFloat curXLoc = 0;
	for (view in subviews) 
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0) 
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
			
		}
	}
	[scrollView1 setContentSize:CGSizeMake((kNumImages *kScrollObjWidth),[scrollView1 bounds].size.height)];
	
}

-(void) viewDidLoad{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
	
	NSUInteger i;
	for (i = 1; i <= kNumImages; i++) {
		NSString *imageName = [NSString stringWithFormat:@"image0%d.jpg",i];
		
		UIImage *image = [UIImage imageNamed:imageName];
		
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		
		CGRect rect = imageView.frame;
		
		rect.size.height = kScrollObjHeight;
		
		rect.size.width = kScrollObjWidth;
		
		imageView.frame = rect;
		
		imageView.tag = i;
		
		[scrollView1 addSubview:imageView];
		
		[imageView release];
	}
	[self layoutScrollImages];
	
	scrollView2.clipsToBounds = YES;
	
	scrollView2.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "image00.jpg"]];
	[scrollView2 addSubview:imageView];
	[scrollView2 setContentSize:CGSizeMake(imageView.frame.size.width,imageView.frame.size.height)];
	[scrollView2 setScrollEnabled:YES];
	
	scrollView2.backgroundColor = [UIColor clearColor];
	[imageView release];

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
	[scrollView1 release];
	[scrollView2 release];
    [super dealloc];
}

@end
