//
//  myDay17AppDelegate.h
//  myDay17
//
//  Created by 路宏亮 on 12-2-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay17ViewController;

@interface myDay17AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay17ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay17ViewController *viewController;

@end

