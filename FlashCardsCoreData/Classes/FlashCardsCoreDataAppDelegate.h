//
//  FlashCardsCoreDataAppDelegate.h
//  FlashCardsCoreData
//
//  Created by 路宏亮 on 12-3-28.
//  Copyright __MyCompanyName__ 2012. All rights reserved.

//

#import "FlashCardsViewController.h"

@interface FlashCardsCoreDataAppDelegate : NSObject <UIApplicationDelegate> {

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
	
	FlashCardsViewController *viewController;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FlashCardsViewController *viewController;
@property (nonatomic, readonly) NSString *applicationDocumentsDirectory;

//- (NSString *)applicationDocumentsDirectory;


@end

