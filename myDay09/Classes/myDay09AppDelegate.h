//
//  myDay09AppDelegate.h
//  myDay09
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay09ViewController;

@interface myDay09AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay09ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay09ViewController *viewController;

@end

