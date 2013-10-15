//
//  PathPair.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyPath.h"


@interface PathPair : NSObject

-(id)init : (EnemyPath*) path1 : (EnemyPath*) path2;

@property (nonatomic,strong)EnemyPath* path1;
@property (nonatomic,strong)EnemyPath* path2;
@property (nonatomic,strong)EnemyPath* path3;

@end
