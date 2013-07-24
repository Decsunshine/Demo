//
//  FlowerWebAppDelegate.h
//  FlowerWeb
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlowerWebViewController;

@interface FlowerWebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FlowerWebViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FlowerWebViewController *viewController;

@end

