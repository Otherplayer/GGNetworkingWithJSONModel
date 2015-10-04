//
//  ViewController.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/8/26.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGTopDataSource.h"

@interface ViewController ()
@property (nonatomic, strong)GGTopDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [[GGTopDataSource alloc] init];
    
    
//    https://121.201.63.217:8089/api/0106/photo/getPhotos.doapp_id=4C648A69-E29D-4465-8677-3B9D90178333&app_name=%E7%BA%A2%E6%BC%94%E5%9C%88&app_os=ios&app_os_ver=8.4&app_token=7f891ce8b443674fc1dc70dd8a093496&app_type=iPhone%20Simulator&app_ver=1.24&d_uid=112478&mark=4C648A69-E29D-4465-8677-3B9D90178333&page=1&size=12&uid=112478
//    https://121.201.63.217:8089/api/0106/photo/getPhotos.doapp_id=4C648A69-E29D-4465-8677-3B9D90178333&app_name=%E7%BA%A2%E6%BC%94%E5%9C%88&app_os=ios&app_os_ver=8.4&app_token=7f891ce8b443674fc1dc70dd8a093496&app_type=iPhone%20Simulator&app_ver=1.24&d_uid=112478&mark=4C648A69-E29D-4465-8677-3B9D90178333&page=1&size=12&uid=112478
    
    NSString *str = @"https://121.201.63.217:8089/api/0106/photo/getPhotos.doapp_id=4C648A69-E29D-4465-8677-3B9D90178333&app_name=%E7%BA%A2%E6%BC%94%E5%9C%88&app_os=ios&app_os_ver=8.4&app_token=7f891ce8b443674fc1dc70dd8a093496&app_type=iPhone%20Simulator&app_ver=1.24&d_uid=112478&mark=4C648A69-E29D-4465-8677-3B9D90178333&page=1&size=12&uid=112478";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadDataAction:(id)sender {
    
    [self.dataSource loadData];
}
- (IBAction)loadDynamicAction:(id)sender {
    
    [self.dataSource loadDynamic];
}

@end
