//
//  BaseEngine.h
//  FilkerPic
//
//  Created by lhl on 14-3-9.
//  Copyright (c) 2014年 lhl. All rights reserved.
//

#import "MKNetworkEngine.h"

typedef void (^ResponseBlock)(NSDictionary *);

@interface BaseEngine : MKNetworkEngine
- (void) startAsynchronous:(ResponseBlock)responseBlock
       andHttpRequestParam:(NSDictionary *)httpRequestParam;
@end
