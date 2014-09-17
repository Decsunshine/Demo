//
//  CityPicTableViewCell.m
//  FilkerPic
//
//  Created by lhl on 14-3-7.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import "CityPicTableViewCell.h"
#import "FlickrEngine.h"

@interface CityPicTableViewCell ()

@property (strong, nonatomic) FlickrEngine *flickrEngine;

@end

@implementation CityPicTableViewCell

+ (BOOL)automaticallyNotifiesObserversForKey: (NSString *)theKey
{
    BOOL automatic;
    
    if ([theKey isEqualToString:@"thumbnailImage"]) {
        automatic = NO;
    } else {
        automatic = [super automaticallyNotifiesObserversForKey:theKey];
    }
    
    return automatic;
}

-(void) prepareForReuse {
    
    self.thumbnailImage.image = nil;
    [self.imageLoadingOperation cancel];
}


-(void) setFlickrData:(NSDictionary*) thisFlickrImage {
    
    self.flickrEngine = [[FlickrEngine alloc] initWithHostName:@"api.flickr.com"
                                            customHeaderFields:nil];
    [self.flickrEngine useCache];
    
    self.titlelabel.text = thisFlickrImage[@"title"];
	self.authorNameLabel.text = thisFlickrImage[@"owner"];
    self.loadingImageURLString =
    [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg",
     thisFlickrImage[@"farm"], thisFlickrImage[@"server"],
     thisFlickrImage[@"id"], thisFlickrImage[@"secret"]];
    
    self.imageLoadingOperation = [self.flickrEngine imageAtURL:[NSURL URLWithString:self.loadingImageURLString]
                                                                         size:self.thumbnailImage.frame.size
                                                            completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                                                
                                                                if([self.loadingImageURLString isEqualToString:[url absoluteString]]) {
                                                                    
                                                                    [UIView animateWithDuration:isInCache?0.0f:0.4f delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
                                                                        self.thumbnailImage.image = fetchedImage;
                                                                    } completion:nil];
                                                                }
                                                            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                                                
                                                            }];
}

@end
