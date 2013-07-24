//
//  MatchPickerViewController.m
//  MatchPicker
//
//  Created by 路宏亮 on 12-3-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#define componentCount 2
#define animalComonent 0
#define soundComponent 1

#import "MatchPickerViewController.h"

@implementation MatchPickerViewController

@synthesize lastAction;
@synthesize matchResult;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return componentCount;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (component == animalComonent) {
		return [animalNames objectAtIndex:row];
	} else {
		return [animalSounds objectAtIndex:row];
	}
}
 */

-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	if (component == animalComonent) {
		return [animalImages objectAtIndex:row];
	} else {
		UILabel *soundLable;
		soundLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
		[soundLable autorelease];
		soundLable.backgroundColor = [UIColor clearColor];
		soundLable.text = [animalSounds objectAtIndex:row];
		return soundLable;
	}

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component 
{
	return 55.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
	if (component == animalComonent) {
		return 75.0;
	} else {
		return 150.0;
	}

}


- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component == animalComonent) {
		return [animalNames count];
	}else {
		return [animalSounds count];
	}

}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSString *actionMessage;
	NSString *matchMessage;
	int selectedAnimal;
	int selectedSound;
	int matchedSound;
	
	if (component == animalComonent) {
		actionMessage = [[NSString alloc] initWithFormat:@ "You selected the animal named '%@'", [animalNames objectAtIndex:row]];
	} else {
		actionMessage = [[NSString alloc] initWithFormat:@ "You selected the animal sound '%@'", [animalSounds objectAtIndex:row]];
	}

	selectedAnimal = [pickerView selectedRowInComponent:animalComonent];
	selectedSound = [pickerView selectedRowInComponent:soundComponent];
	
	matchedSound = ([animalSounds count] - 1) - [pickerView selectedRowInComponent:soundComponent];
	
	if (selectedAnimal == matchedSound) {
		matchMessage = [[NSString alloc] initWithFormat:@ "Yes, a %@ does go '%@'!", [animalNames objectAtIndex:selectedAnimal], [animalSounds objectAtIndex:selectedSound]];
	}else {
		matchMessage = [[NSString alloc] initWithFormat:@ "No, a %@ doesn't go '%@'!", [animalNames objectAtIndex:selectedAnimal], [animalSounds objectAtIndex:selectedSound]];
	}
	
	lastAction.text = actionMessage;
	matchResult.text = matchMessage;
	
	[matchMessage release];
	[actionMessage release];
}

- (void) viewDidLoad
{
	animalNames = [[NSArray alloc] initWithObjects:@ "Mouse", @ "Goose", @ "Cat", @ "Dog", @ "Snake", @ "Bear", @ "Pig", nil];
	animalSounds = [[NSArray alloc] initWithObjects:@ "Oink", @ "Rawr", @ "Ssss", @ "Roof", @ "Meow", @ "Honk", @ "Squeak", nil];
	animalImages = [[NSArray alloc] initWithObjects:
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "mouse.png"]],
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "goose.png"]],
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "cat.png"]],					
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "dog.png"]],					
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "snake.png"]],
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "bear.png"]],					
					[[UIImageView alloc] initWithImage:[UIImage imageNamed:@ "pig.png"]],
					nil
					];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[lastAction release];
	[matchResult release];
	[animalNames release];
	[animalSounds release];
	[animalImages release];
    [super dealloc];
}

@end
