//
//  FlipsideViewController.h
//  FlagQuiz
//
//  Created by 路宏亮 on 12-3-31.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	
	IBOutlet UISegmentedControl *choicesControl;
	
	IBOutlet UISwitch *africaSwitch;
	IBOutlet UISwitch *europeSwitch;
	IBOutlet UISwitch *asiaSwitch;
	IBOutlet UISwitch *northAmericaSwitch;
	IBOutlet UISwitch *oceaniaSwitch;
	IBOutlet UISwitch *southAmericaSwitch;
}


@property (nonatomic, retain)IBOutlet UISegmentedControl *choicesControl;
@property (nonatomic, retain)IBOutlet UISwitch *africaSwitch;
@property (nonatomic, retain)IBOutlet UISwitch *europeSwitch;
@property (nonatomic, retain)IBOutlet UISwitch *asiaSwitch;
@property (nonatomic, retain)IBOutlet UISwitch *northAmericaSwitch;
@property (nonatomic, retain)IBOutlet UISwitch *oceaniaSwitch;
@property (nonatomic, retain)IBOutlet UISwitch *southAmericaSwitch;

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;
- (void)setSwitches:(NSDictionary *)dictionary;
- (void)setSelectedIndex:(int)index;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

