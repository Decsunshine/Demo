//
//  myDay01AppDelegate.h
//  myDay01
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDay01ViewController.h"

@interface myDay01AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay01ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay01ViewController *viewController;

@end

