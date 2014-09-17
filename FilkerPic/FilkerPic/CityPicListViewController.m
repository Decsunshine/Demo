//
//  CityPicListViewController.m
//  FilkerPic
//
//  Created by lhl on 14-3-6.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import "CityPicListViewController.h"
#import "FlickrEngine.h"
#import "CityPicTableViewCell.h"

@interface CityPicListViewController ()

@property (strong, nonatomic) FlickrEngine *flickrEngine;

@end

@implementation CityPicListViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.flickrEngine = [[FlickrEngine alloc] initWithHostName:@"api.flickr.com"
                                            customHeaderFields:nil];
    [self.flickrEngine useCache];
    [self.flickrEngine imagesForTag:@"Tokyo"
                  completionHandler:^(NSMutableArray *image){
                      self.flickrImage = image;
                      [self.tableView reloadData];
                  }
                       errorHandler:^(NSError *error){
                           
                       }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.flickrImage count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityPicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityPicCell" forIndexPath:indexPath];
    
    NSDictionary *thisFlickrImage = (self.flickrImage)[indexPath.row];
    
    [cell setFlickrData:thisFlickrImage];
    
    return cell;
}


@end
