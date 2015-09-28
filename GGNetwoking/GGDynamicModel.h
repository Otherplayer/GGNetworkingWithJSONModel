//
//  GGDynamicModel.h
//  GGNetwoking
//
//  Created by __无邪_ on 15/9/28.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GGDynamicModel : JSONModel

@property (nonatomic, strong)NSString *data_type;
@property (nonatomic, strong)NSString *dateStr;
@property (nonatomic, strong)NSString *favour_behavior_id;
@property (nonatomic, assign)NSInteger favour_count;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, assign)NSInteger image_high;
@property (nonatomic, assign)NSInteger image_width;
@property (nonatomic, strong)NSString *image_url;
@property (nonatomic, assign)NSInteger isFavour;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *play_url;
@property (nonatomic, assign)NSInteger status;
@property (nonatomic, strong)NSString <Optional>*title;
@property (nonatomic, strong)NSString *uid;
@property (nonatomic, strong)NSString *vid;

@property (nonatomic, strong)NSString <Ignore>*customProperty;


@end
