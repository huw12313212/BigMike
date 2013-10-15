//
//  EnemyPathManager.h
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyPath.h"
#import "PathPair.h"

@interface EnemyPathManager : NSObject


-(id)init;
-(EnemyPath*) RandomProducePath;

-(PathPair*) RandomProducePairPath;



@property NSMutableArray* candidatePaths;
@property NSMutableArray* candidateInversePairPaths;
@property NSMutableArray* middlePaths;

@end
