//
//  ColorTiltAppDelegate.h
//  ColorTilt
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorTiltViewController;

@interface ColorTiltAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ColorTiltViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ColorTiltViewController *viewController;

@end

