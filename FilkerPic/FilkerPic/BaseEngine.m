//
//  BaseEngine.m
//  FilkerPic
//
//  Created by lhl on 14-3-9.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import "BaseEngine.h"
#import "MKNetworkOperation.h"
#import "MKNetworkEngine.h"

@interface BaseEngine()
@property (nonatomic, strong) MKNetworkEngine *haodfEngine;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSDictionary *postValues;
@property (nonatomic, strong) NSString *method;
@end

@implementation BaseEngine

-(MKNetworkEngine *)haodfEngine
{
    if (!_haodfEngine) {
        self.haodfEngine = [[MKNetworkEngine alloc] init];
    }
    return _haodfEngine;
}

- (void) startAsynchronous:(ResponseBlock)responseBlock
       andHttpRequestParam:(NSDictionary *)httpRequestParam;
{
    self.urlString = [httpRequestParam objectForKey:@"url"];
    self.method = [httpRequestParam objectForKey:@"method"];
    self.postValues = [httpRequestParam objectForKey:@"postValues"];

    MKNetworkOperation *op = [self.haodfEngine operationWithURLString:self.urlString
                                                               params:self.postValues
                                                           httpMethod:self.method];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // the completionBlock will be called twice.
        // if you are interested only in new values, move that code within the else block
        if([completedOperation isCachedResponse]) {
            DLog(@"Data from cache %@", [completedOperation responseString]);
        }
        else {
            
            [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
                responseBlock(jsonObject[@"content"]);
            }];
            DLog(@"Data from server %@", [completedOperation responseString]);
        }
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    
    [self.haodfEngine enqueueOperation:op];
}
@end
