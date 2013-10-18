//
//  SinglePathEnemyGroup.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyGroup.h"



@interface SinglePathEnemyGroup : EnemyGroup


-(id)init:(NSString*)target;

@property (nonatomic,assign)NSString* line;



@end
