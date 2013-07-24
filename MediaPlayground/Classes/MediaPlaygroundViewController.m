//
//  MediaPlaygroundViewController.m
//  MediaPlayground
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "MediaPlaygroundViewController.h"

@implementation MediaPlaygroundViewController

@synthesize toggleScaling;
@synthesize soundRecorder;
@synthesize recordButton;
@synthesize musicPlayer;
@synthesize ipodPlayButton;
@synthesize nowPlaying;

- (void)viewDidLoad
{
	NSString *tempDir;
	NSURL *soundFile;
	NSDictionary *soundSetting;
	
	tempDir = NSTemporaryDirectory();
	soundFile = [NSURL fileURLWithPath:
				 [tempDir stringByAppendingString:@ "sound.caf"]];
	
	soundSetting = [NSDictionary dictionaryWithObjectsAndKeys:
					[NSNumber numberWithFloat:44100.0], AVSampleRateKey,
					[NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,
					[NSNumber numberWithInt:2], AVNumberOfChannelsKey,
					[NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
					nil];
	
	soundRecorder = [[AVAudioRecorder alloc] initWithURL:soundFile settings:soundSetting error:nil];
	[super viewDidLoad];
	
	
	
	
	musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
}

-(IBAction)chooseiPod:(id)sender
{
	MPMediaPickerController *musicPicker;
	
	[musicPlayer stop];
	nowPlaying.text = @ "No Song Playing";
	[ipodPlayButton setTitle:@ "Play iPod Music" forState:UIControlStateNormal];
	
	musicPicker = [[MPMediaPickerController alloc] 
				   initWithMediaTypes:MPMediaTypeMusic];
	musicPicker.prompt = @ "Choose Songs to Play";
	musicPicker.allowsPickingMultipleItems = YES;
	musicPicker.delegate = self;
	
	[self presentModalViewController:musicPicker animated:YES];
	
	[musicPicker release];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker
  didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
	[musicPlayer setQueueWithItemCollection:mediaItemCollection];
	[self dismissModalViewControllerAnimated:YES];
	[mediaPicker release];
}

- (IBAction)playiPod:(id)sender
{
	if ([ipodPlayButton.titleLabel.text isEqualToString:@ "Play iPod Music"]) {
		[musicPlayer play];
		[ipodPlayButton setTitle:@ "Pause iPod Music" forState:UIControlStateNormal];
		nowPlaying.text = [musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
	} else {
		[musicPlayer pause];
		[ipodPlayButton setTitle:@ "Play iPod Music" forState:UIControlStateNormal];
		nowPlaying.text = @ "No Song Playing";
	}

}

- (IBAction)recordAudio:(id)sender
{
	if ([recordButton.titleLabel.text isEqualToString:@ "Record Audio"]) {
		[soundRecorder record];
		[recordButton setTitle:@ "Stop Recording"
					  forState:UIControlStateNormal];
	} else {
		[soundRecorder stop];
		[recordButton setTitle:@ "Record Audio" forState:UIControlStateNormal];
	}

}

- (IBAction)playAudio:(id)sender
{
	NSURL *soundFile;
	NSString *tempDir;
	AVAudioPlayer *audioPlayer;
	
	tempDir = NSTemporaryDirectory();
	soundFile = [NSURL fileURLWithPath:
				 [tempDir stringByAppendingString:@ "sound.caf"]];
	
	audioPlayer = [[AVAudioPlayer alloc]
				   initWithContentsOfURL:soundFile error:nil];
	
	[audioPlayer setDelegate:self];
	[audioPlayer play];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	[player release];
}

- (IBAction)playMedia:(id)sender
{
	NSString *movieFile;
	MPMoviePlayerController *moviePlayer;
	
	movieFile =[[NSBundle mainBundle] pathForResource:@ "movie" ofType:@ "m4v"];
	moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:movieFile]];
	
	if ([toggleScaling isOn]) {
		moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
	} else {
		moviePlayer.scalingMode = MPMovieScalingModeNone;
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(playMediaFinished:)
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:moviePlayer];
	[moviePlayer play];
}

- (void)playMediaFinished:(NSNotification *)theNotification
{
	MPMoviePlayerController *moviePlayer = [theNotification object];
	[[NSNotificationCenter defaultCenter] removeObserver:self 
													name:MPMoviePlayerPlaybackDidFinishNotification 
												  object:moviePlayer];
	[moviePlayer release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[toggleScaling release];
	[soundRecorder release];
	[recordButton release];
	[musicPlayer release];
	[ipodPlayButton release];
	[nowPlaying release];
    [super dealloc];
}

@end
