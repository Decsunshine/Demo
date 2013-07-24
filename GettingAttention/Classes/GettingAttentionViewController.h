//
//  GettingAttentionViewController.h
//  GettingAttention
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GettingAttentionViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>{
	IBOutlet UILabel *statusMessage;
}
@property (strong, nonatomic) IBOutlet UILabel *statusMessage;

- (IBAction)doAlert:(id)sender;
- (IBAction)doActionSheet:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;

@end

