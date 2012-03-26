//
//  ZZLogCell.h
//  OpenSleep
//
//  Created by Nicolas Renold on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZLogCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailTextLabel;
@property (nonatomic, retain) IBOutlet UILabel *emailTextLabel;
@property (nonatomic, retain) IBOutlet UIButton *emailButton;


@end
