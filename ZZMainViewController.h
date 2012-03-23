//
//  ZZMainViewController.h
//  OpenSleep
//
//  Created by Nicolas Renold on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZZMainViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>
{

}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
