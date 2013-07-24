//
//  Best_FriendAppDelegate.h
//  Best Friend
//
//  Created by 路宏亮 on 12-3-30.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Best_FriendViewController;

@interface Best_FriendAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Best_FriendViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Best_FriendViewController *viewController;

@end

