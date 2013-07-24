//
//  ImageHopAppDelegate.h
//  ImageHop
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageHopViewController;

@interface ImageHopAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageHopViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageHopViewController *viewController;

@end

