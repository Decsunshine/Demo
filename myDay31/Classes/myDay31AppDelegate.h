//
//  myDay31AppDelegate.h
//  myDay31
//
//  Created by 路宏亮 on 12-3-16.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay31ViewController;

@interface myDay31AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay31ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay31ViewController *viewController;

@end

