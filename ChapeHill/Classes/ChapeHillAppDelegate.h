//
//  ChapeHillAppDelegate.h
//  ChapeHill
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChapeHillViewController;

@interface ChapeHillAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ChapeHillViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ChapeHillViewController *viewController;

@end

