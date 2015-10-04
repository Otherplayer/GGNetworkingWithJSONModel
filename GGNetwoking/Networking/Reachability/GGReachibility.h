//
//  GGReachibility.h
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/4.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGReachibility : NSObject

@property (nonatomic, unsafe_unretained) BOOL isReachable;
@property (nonatomic, unsafe_unretained) BOOL isReachableWifi;
//@property (nonatomic, strong) NSString *wifiName;

+ (GGReachibility *)sharedInstance;
- (void)startMonitoringInternetStates;

@end
