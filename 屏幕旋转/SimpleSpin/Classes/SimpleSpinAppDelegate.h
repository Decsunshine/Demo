//
//  SimpleSpinAppDelegate.h
//  SimpleSpin
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleSpinViewController;

@interface SimpleSpinAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleSpinViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleSpinViewController *viewController;

@end

