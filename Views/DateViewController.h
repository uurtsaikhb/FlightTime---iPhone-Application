//
//  DateViewController.h
//  Flight Time
//
//  Created by Uurtsaikh Batbileg on 12/23/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateViewController : UIViewController {
    
    IBOutlet UIDatePicker * datePicker;
    IBOutlet UILabel * labelShow;
    
}

@property (retain, nonatomic) IBOutlet UIDatePicker * datePicker;


- (IBAction)valueChangedDatePicker:(id)sender;

- (IBAction)clickButton:(id)sender;

@end
