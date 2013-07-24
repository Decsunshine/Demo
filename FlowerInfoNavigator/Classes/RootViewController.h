//
//  RootViewController.h
//  FlowerInfoNavigator
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@interface RootViewController : UITableViewController {

	NSMutableArray *flowerData;
	NSMutableArray *flowerSections;
}

- (void) createFlowerData;

@end
