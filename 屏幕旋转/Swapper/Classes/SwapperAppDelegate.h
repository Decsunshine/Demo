//
//  SwapperAppDelegate.h
//  Swapper
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwapperViewController;

@interface SwapperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SwapperViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwapperViewController *viewController;

@end

