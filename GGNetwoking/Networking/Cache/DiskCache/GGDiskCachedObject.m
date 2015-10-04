//
//  GGDiskCachedObject.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/4.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGDiskCachedObject.h"

@implementation GGDiskCachedObject

// Insert code here to add functionality to your managed object subclass


+ (instancetype)saveContent:(NSData *)content identifier:(NSString *)identifier{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key = %@",identifier];
    GGDiskCachedObject *cachedObject = [GGDiskCachedObject MR_findFirstWithPredicate:predicate];
    if (cachedObject == nil) {
        cachedObject = [GGDiskCachedObject MR_createEntity];
        cachedObject.key = identifier;
    }
    cachedObject.content = content;
    cachedObject.lastUpdateTime = [NSDate dateWithTimeIntervalSinceNow:0];
    //save
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    return cachedObject;
}

+ (instancetype)fetchCachedDataWithIdentifier:(NSString *)identifier{
    GGDiskCachedObject *cachedObject = [GGDiskCachedObject MR_findFirstByAttribute:@"key" withValue:identifier];
    return cachedObject;
}

+ (void)deleteCachedObjectWithIdentifier:(NSString *)identifier{
    GGDiskCachedObject *cachedObject = [GGDiskCachedObject MR_findFirstByAttribute:@"key" withValue:identifier];
    if (cachedObject) {
        BOOL isDeleted = [cachedObject MR_deleteEntity];
        NSLog(@"DELETE:[%d]",isDeleted);
    }
}




//- (BOOL)isValid
//{
//    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastUpdateTime];
//    return timeInterval > kGGCacheOutdateTimeSeconds;
//}




//- (void)setContent:(NSData *)content
//{
//    self.content = [content copy];
//}


#pragma mark - public method


@end
