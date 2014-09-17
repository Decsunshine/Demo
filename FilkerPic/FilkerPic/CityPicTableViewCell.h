//
//  CityPicTableViewCell.h
//  FilkerPic
//
//  Created by lhl on 14-3-7.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKNetworkEngine.h"

@interface CityPicTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (assign, nonatomic) IBOutlet UILabel *titlelabel;
@property (assign, nonatomic) IBOutlet UILabel *authorNameLabel;

@property (nonatomic, strong) NSString* loadingImageURLString;
@property (nonatomic, strong) MKNetworkOperation* imageLoadingOperation;
-(void) setFlickrData:(NSDictionary*) thisFlickrImage;
@end
