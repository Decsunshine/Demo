//
//  DateCalcAppDelegate.h
//  DateCalc
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateCalcViewController;

@interface DateCalcAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DateCalcViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DateCalcViewController *viewController;

@end

