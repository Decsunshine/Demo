//
//  myDay03AppDelegate.h
//  myDay03
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDay03ViewController.h"

@interface myDay03AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay03ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay03ViewController *viewController;

@end

