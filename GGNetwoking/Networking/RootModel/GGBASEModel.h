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

@property (nonatomic, strong) NSString *desc;//避免出现与iOS字段重名这样的问题

@property (nonatomic, strong) NSString *time_stamp;


+ (void)initKeyMapper;

@end
