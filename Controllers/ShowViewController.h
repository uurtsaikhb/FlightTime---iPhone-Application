//
//  ShowViewController.h
//  Flight Time
//
//  Created by Uurtsaikh Batbileg on 12/24/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODRefreshControl.h"
#import <QuartzCore/QuartzCore.h>

@interface ShowViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
{
    
    IBOutlet UITableView * tableViewShow;
    
}



@property (strong, nonatomic) IBOutlet UITableView * tableViewShow;

@property(strong, nonatomic) NSString * textCustomTitle;
@property(strong, nonatomic) NSString * textOfDate;

@end
