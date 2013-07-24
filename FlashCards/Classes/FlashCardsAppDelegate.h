//
//  FlashCardsAppDelegate.h
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlashCardsViewController;

@interface FlashCardsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FlashCardsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FlashCardsViewController *viewController;

@end

