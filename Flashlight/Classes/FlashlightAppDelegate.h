//
//  FlashlightAppDelegate.h
//  Flashlight
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlashlightViewController;

@interface FlashlightAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FlashlightViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FlashlightViewController *viewController;

@end

