//
//  myDay29AppDelegate.h
//  myDay29
//
//  Created by 路宏亮 on 12-3-13.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@class MainViewController;

@interface myDay29AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

