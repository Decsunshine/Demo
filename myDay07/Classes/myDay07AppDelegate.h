//
//  myDay07AppDelegate.h
//  myDay07
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDay07ViewController.h"

@interface myDay07AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay07ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay07ViewController *viewController;

@end

