//
//  Fugitive.h
//  iBountyHunter
//
//  Created by 路宏亮 on 12-3-6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Fugitive :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDecimalNumber * bounty;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * fugtiveID;

@end



