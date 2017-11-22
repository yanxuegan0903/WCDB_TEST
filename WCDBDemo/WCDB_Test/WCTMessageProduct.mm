//
//  WCTMessageProduct.m
//  WCDBDemo
//
//  Created by vsKing on 2017/11/22.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "WCTMessageProduct.h"

#define tableName @"message"


@interface WCTMessageProduct ()

@property (nonatomic, strong) WCTDatabase *dataBase;

@end


@implementation WCTMessageProduct

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initMessageTable];
    }
    return self;
}

- (void)initMessageTable{
    
    NSString * filePath = [Documents_Doc stringByAppendingPathComponent:@"message.sqlite"];
    NSLog(@"filePath = %@",filePath);
    
    self.dataBase = [[WCTDatabase alloc] initWithPath:filePath];
    
//    // 数据库加密
//    NSData *password = [@"ComOne" dataUsingEncoding:NSASCIIStringEncoding];
//    [self.dataBase setCipherKey:password];
    
    //  测试数据库是否能打开
    if ([self.dataBase canOpen]) {
        NSLog(@"数据库能被打开");
        // WCDB大量使用延迟初始化（Lazy initialization）的方式管理对象，因此SQLite连接会在第一次被访问时被打开。开发者不需要手动打开数据库。
        // 先判断表是不是已经存在
        
        if ([self.dataBase isTableExists:tableName]) {
            NSLog(@"表已经存在");
        }else{
            NSLog(@"表不存在 创建");
            BOOL result = [self.dataBase createTableAndIndexesOfName:tableName withClass:[Message class]];
            
            if (result) {
                NSLog(@"表创建成功");
            }else{
                NSLog(@"表创建失败");
            }
            
        }
        
    }else{
        NSLog(@"数据库不能打开");
    }
    
}


//  插入一条数据
- (void)insert:(Message *)message{
    [self.dataBase insertObject:message into:tableName];
}

//  查询所有数据
- (NSArray <Message *> *)quaryAllData{
    NSArray <Message *> * arr = [self.dataBase getAllObjectsOfClass:Message.class fromTable:tableName];
    
    for (Message * message in arr) {
        NSLog(@"%@",message);
    }
    
    return arr;
}

//  更新数据
- (void)update:(Message *)message{

    //  更新表中 所有 content字段的值为 message.content
//    BOOL result = [self.dataBase updateAllRowsInTable:tableName onProperty:WCTProperty(Message.content) withObject:message];

    //  更新表中 所有 modifiedTime字段的值为 message.modifiedTime  条件是 (Message.content == message.content)
//    BOOL result = [self.dataBase updateRowsInTable:tableName onProperty:WCTProperty(Message.modifiedTime) withObject:message where:(Message.content == message.content)];
    
    //  更新表中 所有 modifiedTime字段的值为 message.createTime  条件是 (Message.content == message.content)   但是找我的理解 应该是可以同时更新多个属性的 毕竟是一个list onProperties
    BOOL result = [self.dataBase updateRowsInTable:tableName onProperties:WCTPropertyList(Message.createTime) withObject:message where:(Message.content == message.content)];
    
    
    if (result) {
        NSLog(@"更新数据成功");
    }else{
        NSLog(@"更新数据失败");
    }


}




@end
