//
//  SwapperViewController.h
//  Swapper
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwapperViewController : UIViewController {
	IBOutlet UIView *portraitView;
	IBOutlet UIView *landscapeView;
	
}

@property (nonatomic, retain) UIView *portraitView;
@property (nonatomic, retain) UIView *landscapeView;

@end

