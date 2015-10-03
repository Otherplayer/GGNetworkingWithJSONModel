//
//  GGDiskCachedObject+CoreDataProperties.h
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/3.
//  Copyright © 2015年 __无邪_. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GGDiskCachedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface GGDiskCachedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *content;
@property (nonatomic) NSDate *lastUpdateTime;
@property (nonatomic, retain) NSString *key;

@end

NS_ASSUME_NONNULL_END
