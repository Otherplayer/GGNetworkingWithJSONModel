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
#import "TDCell.h"
#import "PreViewController.h"

static NSString *TDCellIdentifier = @"TDCellIdentifier";

@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (nonatomic, strong)GGTopDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [[GGTopDataSource alloc] init];
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    filePath = [filePath stringByAppendingPathComponent:@"Application Support"];
    NSLog(@"%lld M \n %@ \n %lld",[UIDevice freeDiskSpaceInBytes],filePath,[NSFileManager fileSizeAtPath:filePath]);
    
    [self.tableView registerClass:[TDCell class] forCellReuseIdentifier:TDCellIdentifier];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self check3DTouch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods LoadData
- (IBAction)loadDataAction:(id)sender {
    
    [self.dataSource loadData];
}
- (IBAction)loadDynamicAction:(id)sender {
    
    [self.dataSource loadDynamic];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TDCell *cell = [tableView dequeueReusableCellWithIdentifier:TDCellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:@"中国"];
    return cell;
}




#pragma mark - private

//检测页面是否开启了3DTouch
- (void)check3DTouch{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        NSLog(@"3DTouch已开启");
    }else{
        NSLog(@"3DTouch未开启");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"3DTouch未开启" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"", nil];
        [alertView show];
    }
}


// If you return nil, a preview presentation will not be performed
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    PreViewController *childVC = [[PreViewController alloc] init];
    //    childVC.preferredContentSize = CGSizeMake(0.0f,300);
    UIImageView *er = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1xbVZ8.jpg"]];
    //    CGRect rect = CGRectMake(10, location.y - 10, self.view.frame.size.width - 20,20);
    childVC.view.frame = self.view.frame;
    childVC.view = er;
    return childVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
     [self showViewController:viewControllerToCommit sender:self];
}

@end
