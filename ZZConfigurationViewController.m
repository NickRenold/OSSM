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

@end

@implementation ZZConfigurationViewController
@synthesize recorderToggle;
@synthesize accelerometerSwitch;
@synthesize microphoneSwitch;
@synthesize cameraSwitch;
@synthesize log=_log;
@synthesize accelerometerCounter=_accelerometerCounter;

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
		self.accelerometerSwitch.enabled=YES;
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
	if(self.accelerometerSwitch.isOn){
		[self startAccelerometer];
	}
}

-(void)stopLogging{
	
	// Stop the hardware
	[self stopAccelerometer];
//	[self stopMicrophone];
//	[self stopCamera];
	
	// Save the log
	self.log.endTime=[NSDate date];
	NSError *error=nil;
	[((ZZAppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
//		NSLog(@"Error saving ZZLog object: %@",[error localizedDescription]);
		//TODO show alertview popup with error
//	}
}

#pragma mark - Camera
#pragma mark - Microphone
#pragma mark - Accelerometer
#define kAccelerometerFrequency        50.0 //Hz
-(void)startAccelerometer{
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
	
	ZZAccelerometerLogEntry *accelLogEntry;
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
	self.accelerometerCounter++;
	if(self.accelerometerCounter>kAccelerometerFrequency){
		[self.log.managedObjectContext save:nil];
	}
}

#pragma mark - Table view data source
//NO CODE HERE BECAUSE STATIC CELLS

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
	[accelerometerSwitch release];
	[microphoneSwitch release];
	[cameraSwitch release];
	[recorderToggle release];
	[super dealloc];
}
@end
