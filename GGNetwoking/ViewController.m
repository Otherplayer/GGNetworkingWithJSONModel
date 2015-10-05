//
//  ViewController.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/8/26.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGTopDataSource.h"
#import "UIDevice+GGNetworkingMethods.h"
#import "NSFileManager+GGNetworkingMethods.h"
@interface ViewController ()
@property (nonatomic, strong)GGTopDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [[GGTopDataSource alloc] init];
    
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%lld M \n %@ \n %lld",[UIDevice freeDiskSpaceInBytes],NSHomeDirectory(),[NSFileManager fileSizeAtPath:filePath]);
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
