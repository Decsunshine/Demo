//
//  MediaPlaygroundViewController.h
//  MediaPlayground
//
//  Created by 路宏亮 on 12-3-29.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface MediaPlaygroundViewController : UIViewController 
<MPMediaPickerControllerDelegate, AVAudioPlayerDelegate> {
	IBOutlet UISwitch *toggleScaling;
	IBOutlet UIButton *recordButton;
	IBOutlet UIButton *ipodPlayButton;
	IBOutlet UILabel *nowPlaying;
	AVAudioRecorder *soundRecorder;
	MPMusicPlayerController *musicPlayer;
}

- (IBAction)playMedia:(id)sender;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseiPod:(id)sender;
- (IBAction)playiPod:(id)sender;

@property (nonatomic, retain) UISwitch *toggleScaling;
@property (nonatomic, retain) UIButton *recordButton;
@property (nonatomic, retain) UIButton *ipodPlayButton;
@property (nonatomic, retain) UILabel *nowPlaying;
@property (nonatomic, retain) AVAudioRecorder *soundRecorder;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;

@end
