//
//  ZZMonitorViewController.h
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataModel.h"
#import "ZZAppDelegate.h"


@interface ZZConfigurationViewController : UITableViewController
<
UIAccelerometerDelegate
>

@property (retain, nonatomic) IBOutlet UISegmentedControl *recorderToggle;
@property (retain, nonatomic) IBOutlet UISwitch *accelerometerSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *microphoneSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *cameraSwitch;

@property (retain, nonatomic) ZZLog *log;

- (IBAction)switchChanged:(UISwitch *)sender;
- (IBAction)recorderSwitchChanged:(UISegmentedControl *)sender;


@end
