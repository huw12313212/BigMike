//
//  EnemyPathManager.h
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyPath.h"

@interface EnemyPathManager : NSObject


-(id)init;
-(EnemyPath*) RandomProducePath;

@property NSMutableArray* candidatePaths;

@end
