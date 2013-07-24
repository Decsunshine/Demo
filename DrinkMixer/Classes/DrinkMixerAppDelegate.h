//
//  DrinkMixerAppDelegate.h
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@interface DrinkMixerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

