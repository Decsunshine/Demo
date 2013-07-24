//
//  FieldButtonFunAppDelegate.h
//  FieldButtonFun
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FieldButtonFunViewController;

@interface FieldButtonFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FieldButtonFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FieldButtonFunViewController *viewController;

@end

