//
//  MultipleViewsAppDelegate.h
//  MultipleViews
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultipleViewsViewController;

@interface MultipleViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MultipleViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MultipleViewsViewController *viewController;

@end

