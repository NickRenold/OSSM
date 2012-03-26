//
//  ZZLogsViewController.h
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataModel.h"
#import "ZZAppDelegate.h"
#import	"ZZLogCell.h"

@interface ZZLogsViewController : UITableViewController
<
NSFetchedResultsControllerDelegate
>

@property (nonatomic, retain) NSFetchedResultsController* fetchedResultsController;

@end
