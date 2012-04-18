//
//  ZZLogsViewController.m
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZZLogsViewController.h"

@interface ZZLogsViewController ()

@end

@implementation ZZLogsViewController
@synthesize fetchedResultsController=_fetchedResultsController;

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
	
	if(![self.fetchedResultsController performFetch:nil]){
		NSLog(@"Fetch Logs Failed");
	}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.fetchedResultsController.delegate=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - FetchedResultsController

-(NSFetchedResultsController *)fetchedResultsController{
	if(_fetchedResultsController){
		return _fetchedResultsController;
	}
	
	NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[ZZLog entityName]];
	
	NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:NO]];
	[request setSortDescriptors:sortDescriptors];
	
	_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:((ZZAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext sectionNameKeyPath:nil cacheName:@"ZZLogsViewControllerCache"];
	
	_fetchedResultsController.delegate=self;

	[request release];
	return _fetchedResultsController;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.fetchedResultsController.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ZZLogCell";
    ZZLogCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

-(void) configureCell:(UITableViewCell *)aCell
		  atIndexPath:(NSIndexPath *)indexPath{
	
	assert([aCell isKindOfClass:[ZZLogCell class]]);
	ZZLogCell *cell = (ZZLogCell *)aCell;
	
	ZZLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	NSString *startDate = [dateFormatter stringFromDate:log.startTime];
	NSString *endDate = @"now";
	if(log.endTime){
		endDate = [dateFormatter stringFromDate:log.endTime];
	}
	
	cell.textLabel.text=[NSString stringWithFormat:
						 @"%@ to %@",
						 startDate,
						 endDate];
	
	if(log.endTime){
		// complete log
		NSTimeInterval duration = [log.endTime timeIntervalSinceDate:log.startTime];
		duration = duration/3600.0;
		cell.detailTextLabel.text=[NSString stringWithFormat:@"%.1f hour%@",duration,(duration>1)?@"s":@""];
		cell.emailButton.enabled=YES;
		cell.emailTextLabel.text=@"Email log file";
		cell.emailTextLabel.hidden=NO;
	}else {
		// log in progress
		cell.detailTextLabel.text=@"recording ...";
		cell.emailButton.enabled=NO;
		cell.emailTextLabel.hidden=YES;
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ZZLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *logPath = [NSString stringWithFormat:@"%@",[documentsDir stringByAppendingPathComponent:@"log.csv"]];
	[[NSFileManager defaultManager] createFileAtPath:logPath contents:nil attributes:nil];
	NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:logPath];
	[fileHandler seekToEndOfFile];
	
	NSString *headers = [NSString stringWithString:@"\"Time (in seconds since start)\" accelX accelY accelZ\n"];
	[fileHandler writeData:[headers dataUsingEncoding:NSASCIIStringEncoding]];
	
	for(ZZAccelerometerLogEntry *logEntry in log.accelerometerLogEntries){
		NSString *logEntryString = [NSString stringWithFormat:@"%f %f %f %f\n",(double)[logEntry.endTime timeIntervalSinceDate:log.startTime],logEntry.xValue,logEntry.yValue,logEntry.zValue];
		[fileHandler writeData:[logEntryString dataUsingEncoding:NSASCIIStringEncoding]];
	}
	[fileHandler closeFile];
	[self displayComposerSheet];
}

#pragma mark - Data Handling

-(void)displayComposerSheet 
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"Sleep log"];
	
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *logPath = [NSString stringWithFormat:@"%@",[documentsDir stringByAppendingPathComponent:@"log.csv"]];
	
    // Attach an image to the email
	[picker addAttachmentData:[NSData dataWithContentsOfFile:logPath]  mimeType:nil fileName:@"log.csv"];
	 
    // Fill out the email body text
    NSString *emailBody = @"My sleep log is attached";
    [picker setMessageBody:emailBody isHTML:NO];
    [self presentModalViewController:picker animated:YES];
	
    [picker release];
}

#pragma mark - MFMailComposeViewController Delegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{   
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - Fetched results controller delegate
/*
 Assume self has a property 'tableView' -- as is the case for an instance of a UITableViewController
 subclass -- and a method configureCell:atIndexPath: which updates the contents of a given cell
 with information from a managed object at the given index path in the fetched results controller.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
						  withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
						  withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath {
	
    UITableView *tableView = self.tableView;
	
    switch(type) {
			
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath]
					atIndexPath:indexPath];
            break;
			
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


@end
