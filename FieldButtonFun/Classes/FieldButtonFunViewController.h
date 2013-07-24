//
//  FieldButtonFunViewController.h
//  FieldButtonFun
//
//  Created by 路宏亮 on 12-3-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FieldButtonFunViewController : UIViewController {
	IBOutlet UITextField *thePlace;
	IBOutlet UITextField *theVerb;
	IBOutlet UITextField *theNumber;
	IBOutlet UITextView *theStory;
	IBOutlet UITextView *theTemplate;
	IBOutlet UIButton *generateStory;
}

@property (nonatomic, retain) UITextField *thePlace;
@property (nonatomic, retain) UITextField *theVerb;
@property (nonatomic, retain) UITextField *theNumber;
@property (nonatomic, retain) UITextView *theStory;
@property (nonatomic, retain) UITextView *theTemplate;
@property (nonatomic, retain) UIButton *generateStory;

- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end

