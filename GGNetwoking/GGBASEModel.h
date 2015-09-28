//
//  GGBASEModel.h
//  GGNetwoking
//
//  Created by __无邪_ on 15/9/28.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GGBASEModel : JSONModel
@property (nonatomic, assign) NSInteger state_code;

@property (nonatomic, strong) NSDictionary <Optional>*data;       //数据

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *time_stamp;


@end
