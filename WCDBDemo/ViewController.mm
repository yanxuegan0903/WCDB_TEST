//
//  ViewController.m
//  WCDBDemo
//
//  Created by vsKing on 2017/11/22.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"
#import "WCTMessageProduct.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WCTMessageProduct * messageProduct = [[WCTMessageProduct alloc] init];

    [messageProduct quaryAllData];
    
    Message * message_1 = [[Message alloc] init];
    message_1.content = @"333";
    message_1.createTime = [NSDate date];
    message_1.modifiedTime = [NSDate date];
//
//    [messageProduct insert:message_1];
//
//
//    Message * message_2 = [[Message alloc] init];
//    message_2.content = @"222";
//    message_2.createTime = [NSDate date];
//    message_2.modifiedTime = [NSDate date];
//
//    [messageProduct insert:message_2];
//    message content = 111,createTime = 2017-11-22 09:50:26 +0000,modifiedTime = 2017-11-22 09:50:26 +0000
//    message content = 222,createTime = 2017-11-22 09:50:26 +0000,modifiedTime = 2017-11-22 09:50:26 +0000
    
    
    [messageProduct update:message_1];
    
    [messageProduct quaryAllData];

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
