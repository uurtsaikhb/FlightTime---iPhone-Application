//
//  FlightInfoViewController.h
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/9/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightInfoViewController : UIViewController {
    
    
    
}


@property (nonatomic , strong) IBOutlet UIImageView * logoView;

@property (nonatomic , strong) IBOutlet UILabel * labelVoyageNum;
@property (nonatomic , strong) IBOutlet UILabel * labelCompanyName;
@property (nonatomic , strong) IBOutlet UILabel * labelDirection;
@property (nonatomic , strong) IBOutlet UILabel * labelTakeOffTime;
@property (nonatomic , strong) IBOutlet UILabel * labelLandingTime;
@property (nonatomic , strong) IBOutlet UILabel * labelDuration;
@property (nonatomic , strong) IBOutlet UILabel * labelStatus;
@property (nonatomic , strong) IBOutlet UILabel * labelVoyageType;
@property (nonatomic , strong) IBOutlet UILabel * labelCurrentTime;
@property (nonatomic , strong) IBOutlet UILabel * labelPlanTime;
@property (nonatomic , strong) IBOutlet UILabel * labelAircraftType;

@property(strong, nonatomic)NSString * textVoyageNum;
@property(strong, nonatomic)NSString * textLogoName;
@property(strong, nonatomic)NSString * textCompanyName;
@property(strong, nonatomic)NSString * textDirection;
@property(strong, nonatomic)NSString * textTakeOffTime;
@property(strong, nonatomic)NSString * textLandingTime;
@property(strong, nonatomic)NSString * textDuration;
@property(strong, nonatomic)NSString * textStatus;
@property(strong, nonatomic)NSString * textVoyageType;
@property(strong, nonatomic)NSString * textCurrentDate;
@property(strong, nonatomic)NSString * textPlanTime;
@property(strong, nonatomic)NSString * textAircraftType;






@end
