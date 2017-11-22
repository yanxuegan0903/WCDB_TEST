//
//  Message.m
//  WCDBDemo
//
//  Created by vsKing on 2017/11/22.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "Message.h"

@implementation Message

WCDB_IMPLEMENTATION(Message);

//  添加对齐数据库 column 的映射
//WCDB_SYNTHESIZE_COLUMN(Message, localID, "db_id");      //  将 localID 映射到 db_id
//WCDB_SYNTHESIZE_COLUMN(Message, content, "db_content"); //  将 content 映射到 db_content

//WCDB_SYNTHESIZE(Message, localID);
WCDB_SYNTHESIZE(Message, content);
WCDB_SYNTHESIZE(Message, createTime);
WCDB_SYNTHESIZE(Message, modifiedTime);

//  定义自增主键
//WCDB_PRIMARY_AUTO_INCREMENT(Message, localID);

//  // 定义数据库的索引属性，它直接定义createTime字段为索引
// 同时 WCDB 会将表名 + "_index" 作为该索引的名称
WCDB_INDEX(Message, "_index", createTime);

- (NSString *)description{
    
    NSString * str = [NSString stringWithFormat:@"message content = %@,createTime = %@,modifiedTime = %@",self.content,self.createTime,self.modifiedTime];
    
    return str;
}



@end
