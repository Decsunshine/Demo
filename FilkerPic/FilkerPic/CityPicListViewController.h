//
//  CityPicListViewController.h
//  FilkerPic
//
//  Created by lhl on 14-3-6.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityPicListViewController : UITableViewController

@property (nonatomic) NSString *sourceCity;
@property (strong, nonatomic) NSMutableArray *flickrImage;

@end
