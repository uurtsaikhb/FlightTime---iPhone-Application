//
//  DepartureViewController.h
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/9/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODRefreshControl.h"
#import <QuartzCore/QuartzCore.h>

@interface DepartureViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate> {
    
    IBOutlet UITableView * tableViewDep;
    
    
}

@property (strong, nonatomic) IBOutlet UITableView * tableViewDep;


- (BOOL)connected;


@end
