# GGNetworking
Network with JSONModel、memoryCache and diskCache



## Use  ##
```objective-c

extern NSString *const kIMGKey;


@interface GGBaseNetwork : AFHTTPRequestOperationManager
//*(+ (instancetype)sharedNetwork;)*//

/// post 请求
- (void)POST:(NSString *)URLString params:(id)parameters memoryCache:(BOOL)memoryCache diskCache:(BOOL)diskCache completed:(GGRequestCallbackBlock)completed isNotReachable:(GGNetNotReachabilityBlock)notRBlock;

/// post 上传图片 (/** 数组images里面数据为dictionary{kIMGKey:image} **/)
- (void)POST:(NSString *)URLString params:(id)parameters images:(NSArray *)images imageSConfig:(NSString *)serviceName completed:(GGRequestCallbackBlock)completed isNotReachable:(GGNetNotReachabilityBlock)notRBlock;

/// get 请求
- (void)GET:(NSString *)URLString params:(id)parameters memoryCache:(BOOL)memoryCache diskCache:(BOOL)diskCache completed:(GGRequestCallbackBlock)completed isNotReachable:(GGNetNotReachabilityBlock)notRBlock;

@end



```
