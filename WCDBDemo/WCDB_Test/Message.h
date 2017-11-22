//
//  Message.h
//  WCDBDemo
//
//  Created by vsKing on 2017/11/22.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>
//   获取Documents目录路径
#define Documents_Doc [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//对于表：CREATE TABLE message (localID INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, createTime INTEGER, modfiedTime INTEGER)

//索引：CREATE INDEX message_index ON message(createTime)

@interface Message : NSObject <WCTTableCoding>

//@property(nonatomic,assign)int localID;

@property(nonatomic,copy) NSString * content;

@property (nonatomic, strong) NSDate *createTime;

@property (nonatomic, strong) NSDate *modifiedTime;

//这里表字段都加了"db_"的前缀，并且使用了不一样的字段名。通过 WCDB 的 ORM，可以映射为

//WCDB_PROPERTY(localID);
WCDB_PROPERTY(content);
WCDB_PROPERTY(createTime);
WCDB_PROPERTY(modifiedTime);

@end
