//
//  FlashCard.h
//  FlashCardsCoreData
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface FlashCard :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * wrongCount;
@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSNumber * rightCount;
@property (nonatomic, retain) NSString * question;

@end



