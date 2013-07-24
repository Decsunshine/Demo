//
//  MediaPlaygroundAppDelegate.h
//  MediaPlayground
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MediaPlaygroundViewController;

@interface MediaPlaygroundAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MediaPlaygroundViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MediaPlaygroundViewController *viewController;

@end

