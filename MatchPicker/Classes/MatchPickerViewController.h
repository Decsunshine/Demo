//
//  MatchPickerViewController.h
//  MatchPicker
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	NSArray *animalNames;
	NSArray *animalSounds;
	NSArray *animalImages;
	IBOutlet UILabel *lastAction;
	IBOutlet UILabel *matchResult;
}

@property (nonatomic, retain) UILabel *lastAction;
@property (nonatomic, retain) UILabel *matchResult;

@end

