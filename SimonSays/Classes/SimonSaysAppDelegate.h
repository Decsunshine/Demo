//
//  SimonSaysAppDelegate.h
//  SimonSays
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimonSaysViewController;

@interface SimonSaysAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimonSaysViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimonSaysViewController *viewController;

@end

