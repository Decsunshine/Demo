//
//  GettingAttentionAppDelegate.h
//  GettingAttention
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GettingAttentionViewController;

@interface GettingAttentionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GettingAttentionViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet GettingAttentionViewController *viewController;

@end

