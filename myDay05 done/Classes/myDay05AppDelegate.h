//
//  myDay05AppDelegate.h
//  myDay05
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myDay05ViewController.h"

@interface myDay05AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myDay05ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myDay05ViewController *viewController;

@end

