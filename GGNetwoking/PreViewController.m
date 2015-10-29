//
//  PreViewController.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/29.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "PreViewController.h"

@implementation PreViewController








//预览页面 底部Action Items
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *p1 =[UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击了分享");
    }];
    
    UIPreviewAction *p2 =[UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击了收藏");
    }];
    
    NSArray *actions = @[p1,p2];
    return actions;
}



@end
