//
//  FlowerColorTableAppDelegate.h
//  FlowerColorTable
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlowerColorTableViewController;

@interface FlowerColorTableAppDelegate : NSObject <UIApplicationDelegate> {
    
	IBOutlet FlowerColorTableViewController *flowerColorTableViewController;
	UIWindow *window;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

