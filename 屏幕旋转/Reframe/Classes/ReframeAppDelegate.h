//
//  ReframeAppDelegate.h
//  Reframe
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReframeViewController;

@interface ReframeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ReframeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ReframeViewController *viewController;

@end

