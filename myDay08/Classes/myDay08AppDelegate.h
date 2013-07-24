//
//  myDay08AppDelegate.h
//  myDay08
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay08ViewController;

@interface myDay08AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay08ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay08ViewController *viewController;

@end

