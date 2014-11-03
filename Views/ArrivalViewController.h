//
//  ArrivalViewController.h
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/9/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODRefreshControl.h"
#import <QuartzCore/QuartzCore.h>


@interface ArrivalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate> {
    
    IBOutlet UITableView * uiTableview;
    
}


@property (strong, nonatomic) IBOutlet UITableView * uiTableview;



@end
