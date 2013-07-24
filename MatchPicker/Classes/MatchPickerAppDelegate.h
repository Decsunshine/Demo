//
//  MatchPickerAppDelegate.h
//  MatchPicker
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MatchPickerViewController;

@interface MatchPickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MatchPickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MatchPickerViewController *viewController;

@end

