//
//  FlightListCell.h
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/11/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightListCell : UITableViewCell

@property (strong, nonatomic ) UIImageView * logo;
@property (strong, nonatomic ) UILabel * voyage_number;
@property (strong, nonatomic ) UILabel * direction;
@property (strong, nonatomic ) UILabel * status;
@property (strong, nonatomic ) UILabel * takeOffTime;
@property (strong, nonatomic ) UILabel * landedTime;
@property (strong, nonatomic ) UILabel * line;


@end
