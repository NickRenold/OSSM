//
//  ZZMainViewController.m
//  OpenSleep
//
//  Created by Nicolas Renold on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZZMainViewController.h"

@interface ZZMainViewController ()
@end

@implementation ZZMainViewController

@synthesize tableView=_tableView;

#pragma mark -
#pragma Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma UITableViewDataSource

#define MAIN_SECTION 0
#define MAIN_SECTION_ROWS 1

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	switch (section) {
		case MAIN_SECTION:
			return MAIN_SECTION_ROWS;
			break;
		default:
			break;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"any-cell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"any-cell"] autorelease];
    }

	cell.accessoryView=nil;

	switch ([indexPath section]) {
		case 0:
			cell.accessoryView = [[[UISwitch alloc] init] autorelease];
//TODO			((UISwitch *)cell.accessoryView).isOn=[Session sharedSession].
			break;
		default:
			break;
	}
	
	return cell;
}

#pragma mark -
#pragma UITableViewDelegate

@end

































