//
//  SpotOnAppDelegate.h
//  SpotOn
//
//  Created by 路宏亮 on 12-4-3.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpotOnViewController;

@interface SpotOnAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpotOnViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpotOnViewController *viewController;

@end

