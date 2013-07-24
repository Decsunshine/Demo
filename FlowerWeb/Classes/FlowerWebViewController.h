//
//  FlowerWebViewController.h
//  FlowerWeb
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlowerWebViewController : UIViewController {
    IBOutlet UISegmentedControl *colorChoice;
	IBOutlet UIWebView *flowerView;
	IBOutlet UIWebView *flowerDetailView;
}

@property (nonatomic, retain) UISegmentedControl *colorChoice;
@property (nonatomic, retain) UIWebView *flowerView;
@property (nonatomic, retain) UIWebView *flowerDetailView;

- (IBAction) getFlower:(id)sender;
- (IBAction) toggleFlowerDetail:(id)sender;

@end

