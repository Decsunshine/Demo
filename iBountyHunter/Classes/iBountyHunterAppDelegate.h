//
//  iBountyHunterAppDelegate.h
//  iBountyHunter
//
//  Created by 路宏亮 on 12-3-6.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@interface iBountyHunterAppDelegate : NSObject <UIApplicationDelegate> {

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
	
	UITabBarController *tabcontroller;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabcontroller;

- (NSString *)applicationDocumentsDirectory;

- (void)createEditableCopyOfDatabaseIfNeeded;

@end

