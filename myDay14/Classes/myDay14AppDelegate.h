//
//  myDay14AppDelegate.h
//  myDay14
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay14ViewController;

@interface myDay14AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay14ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay14ViewController *viewController;

@end

