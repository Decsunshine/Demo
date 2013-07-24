//
//  myDay10AppDelegate.h
//  myDay10
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay10ViewController;

@interface myDay10AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay10ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay10ViewController *viewController;

@end

