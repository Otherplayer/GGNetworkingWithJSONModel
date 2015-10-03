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

@end
