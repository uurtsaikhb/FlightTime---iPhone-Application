//
//  DateViewController.m
//  Flight Time
//
//  Created by Uurtsaikh Batbileg on 12/23/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"
#import "DateViewController.h"
#import "ShowViewController.h"




@interface DateViewController ()
{
    
    
}
@end

@implementation DateViewController

@synthesize datePicker;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createBackButton];
    [self setCustomTitle:@"Өдрөөр сонгох"];
    
    labelShow.text = [self returnCurrentDate];
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    [self setCustomTitle:@"Өдрөөр харах"];
    
    [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_date.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_date.png"]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)valueChangedDatePicker:(id)sender
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    labelShow.text = [dateFormatter stringFromDate:datePicker.date];
}



- (IBAction)clickButton:(id)sender
{
    
    ShowViewController * showView = [[ShowViewController alloc] init];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    showView.textOfDate = [dateFormatter stringFromDate:datePicker.date];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    showView.textCustomTitle = [dateFormatter stringFromDate:datePicker.date];
    [self.navigationController pushViewController:showView animated:YES];
    
}


// return current date
- (NSString *) returnCurrentDate
{
    
    NSString * returnDate;
    
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    returnDate = [dateFormat stringFromDate:[NSDate date]];
    
    return returnDate;
    
}


@end
