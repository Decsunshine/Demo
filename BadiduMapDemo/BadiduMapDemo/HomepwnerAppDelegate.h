//
//  HomepwnerAppDelegate.h
//  BadiduMapDemo
//
//  Created by lhl on 13-6-8.
//  Copyright (c) 2013年 lhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface HomepwnerAppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager* _mapManager;  
}
@property (strong, nonatomic) UIWindow *window;

@end
