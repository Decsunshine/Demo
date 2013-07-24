//
//  CreateCardViewController.h
//  FlashCards
//
//  Created by 路宏亮 on 12-3-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CreateCardDelegate <NSObject>

- (void) didCancelCardCreation;
- (void) didCreateCardWithQuestion:(NSString *)question
							answer:(NSString *)answer;
@end




@interface CreateCardViewController : UIViewController {

	IBOutlet UITextField *question;
	IBOutlet UITextField *answer;
	id cardDelegate;
}

@property (nonatomic, retain) UITextField *question;
@property (nonatomic, retain) UITextField *answer;
@property (nonatomic, assign) id<CreateCardDelegate> cardDelegate;

- (IBAction) save;
- (IBAction) cancel;

@end
