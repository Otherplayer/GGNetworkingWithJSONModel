//
//  GGDiskCache.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/3.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGDiskCache.h"
#import "GGNTConfiguration.h"
#import "NSDictionary+GGNetworkingMethods.h"
#import "UIDevice+GGNetworkingMethods.h"
#import "NSFileManager+GGNetworkingMethods.h"

@interface GGDiskCache ()

@end

@implementation GGDiskCache

#pragma mark - life cycle
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static GGDiskCache *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GGDiskCache alloc] init];
    });
    return sharedInstance;
}




#pragma mark - public methods

- (NSData *)fetchCachedDataWithURLStr:(NSString *)urlStr params:(NSDictionary *)requestParams{
    NSString *identifier = [self keyWithURLStr:urlStr params:requestParams];
    GGDiskCachedObject *cachedObject = [GGDiskCachedObject fetchCachedDataWithIdentifier:identifier];
    if (cachedObject == nil) {
        return nil;
    }
    return cachedObject.content;
}

- (void)saveCacheWithData:(NSData *)cachedData
                   URLStr:(NSString *)urlStr params:(NSDictionary *)requestParams{
    NSString *identifier = [self keyWithURLStr:urlStr params:requestParams];
    
    if ([self couldNotHandleCapicaty]) {//当不可以通过操作手机容量获取存储空间时，直接返回不再保存
        return;
    }
    
    [GGDiskCachedObject saveContent:cachedData identifier:identifier];
}

- (void)deleteCacheWithURLStr:(NSString *)urlStr params:(NSDictionary *)requestParams{
    NSString *identifier = [self keyWithURLStr:urlStr params:requestParams];
    [GGDiskCachedObject deleteCachedObjectWithIdentifier:identifier];
}








#pragma mark - private

- (NSString *)keyWithURLStr:(NSString *)urlStr params:(NSDictionary *)requestParams{
    return [NSString stringWithFormat:@"%@%@", urlStr, [requestParams urlParamsStringSignature:NO]];
}

- (BOOL)couldNotHandleCapicaty{
    NSLog(@"当前手机存储空间： %lld KB \n当前手机数据空间：%lld M",[self deviceFreeDiskSpace],[self dataSpace]);
    
    if ([self dataSpace] > kGGDiskCacheCapacityLimitM * 1024.0 || [self deviceFreeDiskSpace] <= 10 * 1024) {// 手机存储空间过小，删除两天前的数据
        
        NSDate *beforeYesterday = [NSDate dateWithTimeIntervalSinceNow:- 2 * 3600];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lastUpdateTime > %@",beforeYesterday];
        [GGDiskCachedObject MR_deleteAllMatchingPredicate:predicate];
        
        //删除后，空间还是太小，提示用户空间过小
        if ([self deviceFreeDiskSpace] <= 10 * 1024) {
            //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key != %@",[NSNull null]];
            //[GGDiskCachedObject MR_deleteAllMatchingPredicate:predicate];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"手机存储空间不足！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
            return YES;
        }
    }
    
    return NO;
}

- (long long)deviceFreeDiskSpace{
    return [UIDevice freeDiskSpaceInBytes];
}

- (long long)dataSpace{
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    return [NSFileManager fileSizeAtPath:filePath];
}

@end
