//
//  AddressBookAppDelegate.h
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AddressBookAppDelegate : NSObject <UIApplicationDelegate> {
    
   IBOutlet UIWindow *window;
   IBOutlet UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


@end

