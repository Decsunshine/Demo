//
//  MultipleViewsViewController.h
//  MultipleViews
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;
@class ThirdViewController;

@interface MultipleViewsViewController : UIViewController {
	IBOutlet FirstViewController *firstViewController;
	IBOutlet SecondViewController *secondViewController;
	IBOutlet ThirdViewController *thirdViewController;
}

@property (nonatomic, retain) FirstViewController *firstViewController;
@property (nonatomic, retain) SecondViewController *secondViewController;
@property (nonatomic, retain) ThirdViewController *thirdViewController;

- (IBAction) loadSecondView:(id)sender;
- (IBAction) loadThirdView:(id)sender;
- (IBAction) loadFirstView:(id)sender;

- (void) clearView;

@end

