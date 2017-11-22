//
//  WCTMessageProduct.h
//  WCDBDemo
//
//  Created by vsKing on 2017/11/22.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"


@interface WCTMessageProduct : NSObject

- (void)insert:(Message *)message;

- (NSArray <Message *> *)quaryAllData;



- (void)update:(Message *)message;

@end
