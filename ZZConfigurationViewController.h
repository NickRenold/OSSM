//
//  ZZMonitorViewController.h
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "CoreDataModel.h"
#import "ZZAppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>


@interface ZZConfigurationViewController : UITableViewController
<
UIAccelerometerDelegate,
AVAudioRecorderDelegate
>{
	AVAudioPlayer *audioPlayer;
	AVAudioRecorder *audioRecorder;
	int recordEncoding;
	enum
	{
		ENC_AAC = 1,
		ENC_ALAC = 2,
		ENC_IMA4 = 3,
		ENC_ILBC = 4,
		ENC_ULAW = 5,
		ENC_PCM = 6,
	} encodingTypes;
	NSTimer *meteringTimer;
}

@property (retain, nonatomic) IBOutlet UISegmentedControl *recorderToggle;
@property (retain, nonatomic) IBOutlet UISwitch *accelerometerSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *microphoneSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *cameraSwitch;

@property (retain, nonatomic) ZZLog *log;

- (IBAction)switchChanged:(UISwitch *)sender;
- (IBAction)recorderSwitchChanged:(UISegmentedControl *)sender;

-(void) startRecording;
-(void) stopRecording;
-(void) playRecording;
-(void) stopPlaying;
-(void) updateMetering;

@end
