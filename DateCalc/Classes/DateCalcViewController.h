//
//  DateCalcViewController.h
//  DateCalc
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateCalcViewController : UIViewController {
	IBOutlet UILabel *differenceResult;
}

@property (nonatomic, retain) UILabel *differenceResult;

- (IBAction)showDate:(id)sender;

@end

