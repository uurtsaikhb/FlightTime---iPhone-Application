//
//  LegalTool.h
//  Legalinfo
//
//  Created by Mandal Tsaschikher on 7/26/13.
//  Copyright (c) 2013 Mandal Tsaschikher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightTool : NSObject

+ (UIColor *) colorFromHexString:(NSString *)hex;
+ (NSString *) htmlToContent:(NSString *)string;
+ (NSString *) getMonDate:(NSString *)day;
@end
