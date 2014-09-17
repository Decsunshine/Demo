//
//  CityListController.m
//  FilkerPic
//
//  Created by lhl on 14-3-6.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import "CityListController.h"
#import "CityPicListViewController.h"
#import "BaseEngine.h"


@interface CityListController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property(nonatomic, strong) NSMutableDictionary * cityList;
@property(nonatomic, strong) NSMutableArray * cityKey;
@property(strong, nonatomic) BaseEngine *engine;

@end

@implementation CityListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.engine = [[BaseEngine alloc] init];
    self.cityList = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"巴黎", @"Pairs", @"东京", @"Tokyo", @"新加坡", @"Singapore", nil];
    self.cityKey = [NSMutableArray arrayWithObjects:@"Pairs", @"Tokyo", @"Singapore", nil];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cityList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    [[cell textLabel] setText:[self.cityList objectForKey:[self.cityKey objectAtIndex:indexPath.row]]];
    
    return cell;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CityPicListViewController *svc = (CityPicListViewController *) segue.destinationViewController;
    svc.sourceCity = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]].textLabel.text;
}


#pragma mark - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    NSString *urlString = [NSString stringWithFormat:@"http://fanyi.youdao.com/openapi.do?keyfrom=flickr&key=1271827001&type=data&doctype=json&version=1.1&q=%@", searchBar.text];

    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:urlString, @"url", @"POST", @"method", nil];
    
    [self.engine startAsynchronous:^(NSDictionary *RES){
        NSLog(@"%@", RES);
    } andHttpRequestParam:param];
    
}
@end
