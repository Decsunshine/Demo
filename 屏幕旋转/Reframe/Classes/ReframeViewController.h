//
//  ReframeViewController.h
//  Reframe
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReframeViewController : UIViewController {
	IBOutlet UIButton *buttonOne;
	IBOutlet UIButton *buttonTwo;
	IBOutlet UILabel *viewLabel;
}

@property (nonatomic, retain) UIButton *buttonOne;
@property (nonatomic, retain) UIButton *buttonTwo;
@property (nonatomic, retain) UILabel *viewLabel;

@end

