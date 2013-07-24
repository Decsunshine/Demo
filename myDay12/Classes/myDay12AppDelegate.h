//
//  myDay12AppDelegate.h
//  myDay12
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myDay12ViewController;

@interface myDay12AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay12ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay12ViewController *viewController;

@end

