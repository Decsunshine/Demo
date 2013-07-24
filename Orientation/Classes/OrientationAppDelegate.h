//
//  OrientationAppDelegate.h
//  Orientation
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrientationViewController;

@interface OrientationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OrientationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet OrientationViewController *viewController;

@end

