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

#pragma mark - Methods Action
- (IBAction)loadDataAction:(id)sender {
    
    [self.dataSource loadData];
}
- (IBAction)loadDynamicAction:(id)sender {
    
    [self.dataSource loadDynamic];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TDCell *cell = [tableView dequeueReusableCellWithIdentifier:TDCellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:@"Touch Me, Baby !"];
    return cell;
}
//- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
//    NSLog(@"canFocusRowAtIndexPath");
//    return NO;
//}
//- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0){
//    NSLog(@"shouldUpdateFocusInContext");
//    return NO;
//}
//- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0){
//    NSLog(@"didUpdateFocusInContext");
//}
////- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0){
////    return <#expression#>
////}

#pragma mark - UIViewControllerPreviewingDelegate

// If you return nil, a preview presentation will not be performed
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    //注意这里我因为测试，没做具体的位置处理，如果需要定位到具体的图片Cell位置的话，可以用location通过tableView的convertPoint来取到指定Cell
    PreViewController *childVC = [[PreViewController alloc] init];
    
    //预览时视图的大小
    //    childVC.preferredContentSize = CGSizeMake(0.0f,300);
    
    
    UIImageView *er = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1xbVZ8.jpg"]];
    childVC.view.frame = self.view.frame;
    childVC.view = er;
    
    
    CGPoint inPoint = [self.view convertPoint:location toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:inPoint];
    TDCell *cell = (TDCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%ld %@",indexPath.row,cell);
    
    CGPoint outPoint = [self.tableView convertPoint:cell.frame.origin toView:self.view];
    CGRect rect;
    rect.origin = CGPointMake(0, outPoint.y);
    rect.size = cell.frame.size;
    rect.size.height = rect.size.height - 1; //去掉cell下面的那条线
    previewingContext.sourceRect = rect;
    
    
    return childVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}


#pragma mark - private

//检测页面是否开启了3DTouch
- (void)check3DTouch{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        // 注册
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        NSLog(@"3DTouch已开启");
    }else{
        NSLog(@"3DTouch未开启");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"3DTouch未开启" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}



@end
