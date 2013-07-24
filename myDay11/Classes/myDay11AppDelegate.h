//
//  myDay11AppDelegate.h
//  myDay11
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay11ViewController;

@interface myDay11AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay11ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay11ViewController *viewController;

@end

