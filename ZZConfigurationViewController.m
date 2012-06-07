//
//  ZZMonitorViewController.m
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZZConfigurationViewController.h"

@interface ZZConfigurationViewController ()
@property int accelerometerCounter;
@property (nonatomic, retain) NSMutableArray* accelerometerBuffer;
@end

@implementation ZZConfigurationViewController
@synthesize recorderToggle;
@synthesize accelerometerSwitch;
@synthesize microphoneSwitch;
@synthesize cameraSwitch;
@synthesize log=_log;
@synthesize accelerometerCounter=_accelerometerCounter;
@synthesize accelerometerBuffer=_accelerometerBuffer;
	
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.accelerometerCounter=0;
	recordEncoding = ENC_PCM
	;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
	[self stopLogging];

	[self setAccelerometerSwitch:nil];
	[self setMicrophoneSwitch:nil];
	[self setCameraSwitch:nil];
	[self setRecorderToggle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBActions
- (IBAction)switchChanged:(UISwitch *)sender{
	if(sender==self.cameraSwitch){
		
	}else if(sender==self.accelerometerSwitch){
		
	}else if(sender==self.microphoneSwitch){
		
	}
}

#define RECORDING_INDEX	1
#define PAUSED_INDEX	0

- (IBAction)recorderSwitchChanged:(UISegmentedControl *)sender{
	if(self.recorderToggle.selectedSegmentIndex==RECORDING_INDEX){
		if([self setupLoggers]){
			[self startLogging];		
		}else{
			// Abort, couldn't start log
			self.recorderToggle.selectedSegmentIndex=PAUSED_INDEX;			
		}
	}else if(self.recorderToggle.selectedSegmentIndex==PAUSED_INDEX){
		[self stopLogging];
	}
}

#pragma mark - Logging Control

// Take time to setup the camera and microphone objects
-(BOOL)setupLoggers{
	// Disable switches during logging
	self.cameraSwitch.enabled=NO;
	self.accelerometerSwitch.enabled=NO;
	self.microphoneSwitch.enabled=NO;
	
	// Create log object
	self.log=[NSEntityDescription insertNewObjectForEntityForName:@"ZZLog" inManagedObjectContext:((ZZAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext];
//	[ZZLog insertInManagedObjectContext:
//			  ((ZZAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext];
	self.log.startTime=[NSDate date];
	
	NSError *error;
	if(![((ZZAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext save:&error]){
		NSLog(@"Error saving new ZZLog object: %@",[error localizedDescription]);
		// TODO show alertview popup with error
		return NO;
	}
	
	// Set up hardware interfaces
	if(self.microphoneSwitch.isOn){
		//[self setupMicrophone];
	}
	if(self.cameraSwitch.isOn){
		//[self setupCamera];
	}
	if(self.accelerometerSwitch.isOn){
		// Accelerometer setup takes no time, done in startAccelerometer
	}

	return YES;
}

//Instantly start the logging
-(void)startLogging{
	//Keep app from being idle and locking
	[UIApplication sharedApplication].idleTimerDisabled = YES;
	
	if(self.accelerometerSwitch.isOn){
		[self startAccelerometer];
	}
	
	if(self.microphoneSwitch.isOn){
		[self startRecording];
	}
}

-(void)stopLogging{
	//Keep app from being idle and locking
	[UIApplication sharedApplication].idleTimerDisabled = NO;
	
	// Stop the hardware
	[self stopAccelerometer];
	[self stopRecording];
//	[self stopCamera];
	
	// Save the log
	self.log.endTime=[NSDate date];
	NSError *error=nil;
	[((ZZAppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
//		NSLog(@"Error saving ZZLog object: %@",[error localizedDescription]);
		//TODO show alertview popup with error
//	}
	
	self.accelerometerSwitch.enabled=YES;
	self.microphoneSwitch.enabled=YES;
}

#pragma mark - Camera
#pragma mark - Microphone

-(void) startRecording
{
	NSLog(@"startRecording");
	[audioRecorder release];
	audioRecorder = nil;
	
	// Init audio with record capability
	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryRecord error:nil];
	
	NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] initWithCapacity:10];
	if(recordEncoding == ENC_PCM)
	{
		[recordSettings setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
		[recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
		[recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
		[recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
		[recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey]; 
	}
	else
	{
		NSNumber *formatObject;
		
		switch (recordEncoding) {
			case (ENC_AAC): 
				formatObject = [NSNumber numberWithInt: kAudioFormatMPEG4AAC];
				break;
			case (ENC_ALAC):
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleLossless];
				break;
			case (ENC_IMA4):
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
				break;
			case (ENC_ILBC):
				formatObject = [NSNumber numberWithInt: kAudioFormatiLBC];
				break;
			case (ENC_ULAW):
				formatObject = [NSNumber numberWithInt: kAudioFormatULaw];
				break;
			default:
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
		}
		
		[recordSettings setObject:formatObject forKey: AVFormatIDKey];
		[recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
		[recordSettings setObject:[NSNumber numberWithInt:12800] forKey:AVEncoderBitRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
		[recordSettings setObject:[NSNumber numberWithInt: AVAudioQualityHigh] forKey: AVEncoderAudioQualityKey];
	}
	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *recDir = [paths objectAtIndex:0];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/recordTest.caf", recDir]];
	
	NSError *error = nil;
	audioRecorder = [[ AVAudioRecorder alloc] initWithURL:url settings:recordSettings error:&error];
	audioRecorder.meteringEnabled=YES;
	audioRecorder.delegate=self;
	
	if ([audioRecorder prepareToRecord] == YES){
		[audioRecorder record];
		// Create the timer object
		meteringTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self 
											   selector:@selector(updateMetering) userInfo:nil repeats:YES];
		
	}else {
		int errorCode = CFSwapInt32HostToBig ([error code]); 
		NSLog(@"Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode); 
		NSLog(@"Error: %@",[error description]);
		
	}
	NSLog(@"recording");
}

-(void)updateMetering
{
	[audioRecorder updateMeters];
	NSLog(@"Average: %f",[audioRecorder averagePowerForChannel:0]);
	NSLog(@"Peak: %f",[audioRecorder peakPowerForChannel:0]);
}

-(void) stopRecording
{
	[meteringTimer invalidate];
	NSLog(@"stopRecording");
	[audioRecorder stop];
	NSLog(@"stopped");
}

#pragma mark - AVAudioRecorder Delegate


//-(void) playRecording
//{
//	NSLog(@"playRecording");
//	// Init audio with playback capability
//	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//	[audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
//	
//	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/recordTest.caf", [[NSBundle mainBundle] resourcePath]]];
//	NSError *error;
//	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//	audioPlayer.numberOfLoops = 0;
//	[audioPlayer play];
//	NSLog(@"playing");
//}
//
//-(void) stopPlaying
//{
//	NSLog(@"stopPlaying");
//	[audioPlayer stop];
//	NSLog(@"stopped");
//}

#pragma mark - Accelerometer
#define kAccelerometerFrequency        50.0 //Hz
-(void)startAccelerometer{
	self.accelerometerBuffer=[NSMutableArray arrayWithCapacity:kAccelerometerFrequency];
	
	UIAccelerometer*  theAccelerometer = [UIAccelerometer sharedAccelerometer];
	theAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
	theAccelerometer.delegate = self;
	// Delegate events begin immediately
}

-(void)stopAccelerometer{
	UIAccelerometer*  theAccelerometer = [UIAccelerometer sharedAccelerometer];
	theAccelerometer.delegate = nil;
	// Delegate events begin immediately
}

//When the accelerometer gives data,
// do filtering math using the previous log entry, and create a new log entry
// TODO: aggregate data for each second
#define kFilteringFactor 0.1
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
//	double prevAccelX=0.0;
//	double prevAccelY=0.0;
//	double prevAccelZ=0.0;
	
//	ZZAccelerometerLogEntry *accelLogEntry;
	//TODO set is not ordered
//	if((accelLogEntry = [self.log.accelerometerLogEntries anyObject])){
//		prevAccelX=accelLogEntry.xValue;
//		prevAccelY=accelLogEntry.yValue;
//		prevAccelZ=accelLogEntry.zValue;
//	}
	
    // Subtract the low-pass value from the current value to get a simplified high-pass filter
	// copied from iOS developer docs
//    double accelX = acceleration.x - ( (acceleration.x * kFilteringFactor) + (prevAccelX * (1.0 - kFilteringFactor)) );
//    double accelY = acceleration.y - ( (acceleration.y * kFilteringFactor) + (prevAccelY * (1.0 - kFilteringFactor)) );
//    double accelZ = acceleration.z - ( (acceleration.z * kFilteringFactor) + (prevAccelZ * (1.0 - kFilteringFactor)) );
	
	// Use the acceleration data.
	ZZAccelerometerLogEntry* accelEvent = [ZZAccelerometerLogEntry insertInManagedObjectContext:self.log.managedObjectContext];
//	accelEvent.valueValue = sqrtf(powf(accelX,2.0) + powf(accelY,2.0) + powf(accelZ,2.0));
//	accelEvent.filteredXValue = accelX;
//	accelEvent.filteredYValue = accelY;
//	accelEvent.filteredZValue = accelZ;
	accelEvent.xValue = acceleration.x;
	accelEvent.yValue = acceleration.y;
	accelEvent.zValue = acceleration.z;
	accelEvent.endTime=[NSDate date];
	
	[self.log.accelerometerLogEntriesSet addObject:accelEvent];	

//	[self.accelerometerBuffer addObject:acceleration];
	self.accelerometerCounter++;
	if(self.accelerometerCounter>kAccelerometerFrequency){
		self.accelerometerCounter=0;
		[self.log.managedObjectContext save:nil];
	}
}

#pragma mark - Table view data source
//NO CODE HERE BECAUSE STATIC CELLS

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)dealloc {
	[meteringTimer invalidate];
	[meteringTimer release];
	[audioPlayer release];
	[audioRecorder release];
	[accelerometerSwitch release];
	[microphoneSwitch release];
	[cameraSwitch release];
	[recorderToggle release];
	[super dealloc];
}
@end
