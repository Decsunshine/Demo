//
//  RootViewController.m
//  FlowerInfoNavigator
//
//  Created by 路宏亮 on 12-3-27.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "RootViewController.h"
#import "FlowerDetailViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
	[self createFlowerData];
	[super viewDidLoad];
}

- (void)createFlowerData {
	NSMutableArray *redFlowers;
	NSMutableArray *blueFlowers;
	
	flowerSections = [[NSMutableArray alloc] initWithObjects:@ "Red Flowers",@ "Blue Flowers",nil];
	
	redFlowers = [[NSMutableArray alloc] init];
	blueFlowers = [[NSMutableArray alloc] init];
	
	[redFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@ "Poppy", @ "name", @ "poppy.png", @ "picture", @ "http://en.wikipedia.org/wiki/Poppy", @ "url", nil]];
	[redFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@ "Tulip", @ "name", @ "tulip.png", @ "picture", @ "http://en.wikipedia.org/wiki/Tulip", @ "url", nil]];
	

	
	
	[redFlowers addObject:[[NSMutableDictionary alloc]
						   initWithObjectsAndKeys:@"Gerbera",@"name",
						   @"gerbera.png",@"picture",
						   @"http://en.wikipedia.org/wiki/Gerbera",@"url",nil]];
	[redFlowers addObject:[[NSMutableDictionary alloc]
						   initWithObjectsAndKeys:@"Peony",@"name",
						   @"peony.png",@"picture",
						   @"http://en.wikipedia.org/wiki/Peony",@"url",nil]];
	[redFlowers addObject:[[NSMutableDictionary alloc]
						   initWithObjectsAndKeys:@"Rose",@"name",
						   @"rose.png",@"picture",
						   @"http://en.wikipedia.org/wiki/Rose",@"url",nil]];
	[redFlowers addObject:[[NSMutableDictionary alloc]
						   initWithObjectsAndKeys:@"Hollyhock",@"name",
						   @"hollyhock.png",@"picture",
						   @"http://en.wikipedia.org/wiki/Hollyhock",
						   @"url",nil]];
	[redFlowers addObject:[[NSMutableDictionary alloc]
						   initWithObjectsAndKeys:@"Straw Flower",@"name",
						   @"strawflower.png",@"picture",
						   @"http://en.wikipedia.org/wiki/Strawflower",
						   @"url",nil]];
	
	[blueFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@ "Hyacinth", @ "name", @ "hyacinth.png", @ "picture", @ "http://en.wikipedia.org/wiki/Hyacinth_(flower)", @ "url", nil]];
	[blueFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@ "Hydrangea", @ "name", @ "hydrangea.png", @ "picture", @ "http://en.wikipedia.org/wiki/Hydrangea", @ "url", nil]];
	
	[blueFlowers addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Sea Holly",@"name",
							@"seaholly.png",@"picture",
							@"http://en.wikipedia.org/wiki/Sea_holly",
							@"url",nil]];
	[blueFlowers addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Grape Hyacinth",@"name",
							@"grapehyacinth.png",@"picture",
							@"http://en.wikipedia.org/wiki/Grape_hyacinth",
							@"url",nil]];
	[blueFlowers addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Phlox",@"name",
							@"phlox.png",@"picture",
							@"http://en.wikipedia.org/wiki/Phlox",@"url",nil]];
	[blueFlowers addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Pin Cushion Flower",@"name",
							@"pincushionflower.png",@"picture",
							@"http://en.wikipedia.org/wiki/Scabious",
							@"url",nil]];
	[blueFlowers addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Iris",@"name",
							@"iris.png",@"picture",
							@"http://en.wikipedia.org/wiki/Iris_(plant)",
							@"url",nil]];	
	
	
	flowerData = [[NSMutableArray alloc] initWithObjects:redFlowers,blueFlowers,nil];
	
	[redFlowers release];
	[blueFlowers release];
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [flowerSections objectAtIndex:section];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [flowerSections count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[flowerData objectAtIndex:section] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	[[cell textLabel] setText:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex: indexPath.row] objectForKey:@"name"]];
	[[cell imageView] setImage:[UIImage imageNamed:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex: indexPath.row] objectForKey:@"picture"]]];
	cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
/*
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	FlowerDetailViewController *flowerDetailViewController = [[FlowerDetailViewController alloc] initWithNibName:@ "FlowerDetailViewController" bundle:nil];
	flowerDetailViewController.detailURL = [[NSURL alloc] initWithString:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:nil]];
	flowerDetailViewController.title = [[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@ "name"];
											[self.navigationController pushViewController:flowerDetailViewController animated:YES];
											[flowerDetailViewController release];
}
*/
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	FlowerDetailViewController *flowerDetailViewController = 
	[[FlowerDetailViewController alloc] initWithNibName:
	 @"FlowerDetailViewController" bundle:nil];
	flowerDetailViewController.detailURL=
	[[NSURL alloc] initWithString: 
	 [[[flowerData objectAtIndex:indexPath.section] objectAtIndex: 
	   indexPath.row] objectForKey:@"url"]];
	flowerDetailViewController.title=
	[[[flowerData objectAtIndex:indexPath.section] objectAtIndex: 
	  indexPath.row] objectForKey:@"name"];
	[self.navigationController pushViewController:
	 flowerDetailViewController animated:YES];
	[flowerDetailViewController release];
}
- (void)dealloc {
	[flowerData release];
	[flowerSections release];
    [super dealloc];
}


@end

