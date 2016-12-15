//
//  ECViewController.m
//  ECAlertSheet
//
//  Created by Jame on 12/15/2016.
//  Copyright (c) 2016 Jame. All rights reserved.
//

#import "ECViewController.h"
#import "ECAlertSheet.h"

@interface ECViewController ()

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)alertClick:(id)sender
{
    [self showWithStyle:ECAlertSheetStyleAlert twoAction:YES];
}


- (IBAction)sheetClick:(id)sender
{
    [self showWithStyle:ECAlertSheetStyleActionSheet twoAction:YES];
}


- (IBAction)quickAlertClick:(id)sender
{
    [ECAlertSheet showAlertViewWithTitle:@"AlertView" message:@"仿微信的AlertView" preferredStyle:ECAlertSheetStyleAlert titles:@[@"第一项", @"第二项",@"第三项"] destructiveTitle:@"删除" cancelTitle:@"取消" handler:^(ECAlertSheet * _Nonnull alertView, NSInteger index) {
        NSLog(@"index == %zd, title: %@", index, alertView.title);
    }];
}


- (IBAction)quickSheetClick:(id)sender
{
    [ECAlertSheet showActionSheetWithTitle:@"ActionSheet" message:@"仿微信的ActionSheet" titles:@[@"第一项",@"第二项",@"第三项"] destructiveTitle:@"红色选项可以为空" cancelTitle:@"取消" handler:^(ECAlertSheet * _Nonnull alertView, NSInteger index) {
        NSLog(@"index == %zd, title: %@", index, alertView.title);
    }];
}


- (void)showWithStyle:(ECAlertSheetStyle)style twoAction:(BOOL)isTwo
{
    ECAlertSheet *alertView = [ECAlertSheet alertViewWithTitle:@"ECAlertSheetDemo Title" message:@"This is ECAlertSheetDemo message \nIs like wechat alert" preferredStyle:style];
    
    ECAlertSheetAction *action1 = [ECAlertSheetAction actionWithTitle:@"default" style:ECAlertSheetActionStyleDefault handler:^(ECAlertSheetAction * _Nonnull action) {
        NSLog(@"default action");
    }];
    
    ECAlertSheetAction *action2 = [ECAlertSheetAction actionWithTitle:@"cancel" style:ECAlertSheetActionStyleCancel handler:^(ECAlertSheetAction * _Nonnull action) {
        NSLog(@"cancel action");
    }];
    
    ECAlertSheetAction *action3 = [ECAlertSheetAction actionWithTitle:@"destructive" style:ECAlertSheetActionStyleDestructive handler:^(ECAlertSheetAction * _Nonnull action) {
        NSLog(@"destructive action");
    }];
    
    
    if (!isTwo)
    {
        [alertView addActions:@[action1, action2, action3]];
    }else{
        [alertView addActions:@[action1, action2]];
    }
    
    [alertView show];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
