//
//  FlowerDetailViewController.h
//  FlowerInfoNavigator
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FlowerDetailViewController : UIViewController {
	IBOutlet UIWebView *detailWebView;
	NSURL *detailURL;
}

@property (nonatomic, retain) NSURL *detailURL;
@property (nonatomic, retain) UIWebView *detailWebView;

@end
