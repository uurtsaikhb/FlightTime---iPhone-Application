//
//  FlightInfoViewController.m
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/9/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"
#import "FlightInfoViewController.h"


@interface FlightInfoViewController ()

@end

@implementation FlightInfoViewController


@synthesize labelVoyageNum, logoView, labelCompanyName, labelDirection, labelLandingTime, labelTakeOffTime, labelDuration, labelStatus, labelVoyageType, labelCurrentTime, labelAircraftType, labelPlanTime;

@synthesize textVoyageNum, textLogoName, textCompanyName, textDirection, textLandingTime, textTakeOffTime, textDuration, textStatus, textVoyageType, textCurrentDate, textAircraftType, textPlanTime;


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self setCustomTitleOther:@"ДЭЛГЭРЭНГҮЙ"];
    [self createBackButton];
    [self createAboutButton];
    
    
    logoView.image = [UIImage imageNamed:[self returnLogoName:textLogoName ]];
    labelVoyageNum.text = textVoyageNum;
    labelCompanyName.text = textCompanyName;
    labelDirection.text = textDirection;
    labelTakeOffTime.text = textTakeOffTime;
    labelLandingTime.text = textLandingTime;
    labelDuration.text = textDuration;
    labelStatus.text = textStatus;
    labelVoyageType.text = textVoyageType;
    labelCurrentTime.text = textCurrentDate;
    labelPlanTime.text = textPlanTime;
    labelAircraftType.text = textAircraftType;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



// return image name using company icao code
-(NSString *) returnLogoName : (NSString * ) str
{
    
    NSString * name;
    bool is_chapter = true;
    
    if ([str isEqualToString:@"MML"]) {
        
        name = @"hunnu.png";
        is_chapter = false;
        
    }
    if ([str isEqualToString:@"CCA"]) {
        
       name = @"airchina.png";
       is_chapter = false;
        
    }
    if ([str isEqualToString:@"MGL"]) {
        
        name = @"miat.png";
        is_chapter = false;
        
    }
    if ([str isEqualToString:@"MNG"]) {
        
        name = @"aeromongolia.png";
        is_chapter = false;
        
    }
    if ([str isEqualToString:@"EZA"]) {
        
        name = @"eznis.png";
        is_chapter = false;
    }
    if ([str isEqualToString:@"THY"]) {
        
        name = @"turkish.png";
        is_chapter = false;
    }
    if ([str isEqualToString:@"AFL"]) {
        
        name = @"aeroflot.png";
        is_chapter = false;
    }
    if ([str isEqualToString:@"KAL"]) {
        
        name = @"koreanair.png";
        is_chapter = false;
    }
    if ([str isEqualToString:@"TNL"]) {
        
        name = @"sky_horse.png";
        is_chapter = false;
    }
    
    if (is_chapter) {
        name = @"chapter.png";
    }
    return name;
    
}



// return Custom title text with current date.

- (NSString * ) returnCustomTitle
{
    NSString * returnString;
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy.MM.dd"];
    
    returnString = [DateFormatter stringFromDate:[NSDate date]];
    
    return returnString;
    
}

@end
