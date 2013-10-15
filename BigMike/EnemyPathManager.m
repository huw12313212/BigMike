//
//  EnemyPathManager.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPathManager.h"
#import "EnemyPath.h"
#import "SinPath.h"
#import "BezierCurve2Path.h"
#import "CirclePath.h"
#import "Sin2Path.h"
#import "NormalPath1.h"
#import "NormalPath2.h"
#import "NormalPath3.h"

@implementation EnemyPathManager


-(id)init
{
    if(self = [super init])
    {
    
        self.candidatePaths = [[NSMutableArray alloc]init];
        self.candidateInversePairPaths = [[NSMutableArray alloc]init];
        self.middlePaths = [[NSMutableArray alloc]init];

        //for single Path Enemy
        [self.candidatePaths addObject:[[EnemyPath alloc]init:true]];
        [self.candidatePaths addObject:[[SinPath alloc]init]];
        [self.candidatePaths addObject:[[Sin2Path alloc]init]];
        [self.candidatePaths addObject:[[NormalPath1 alloc]init: true]];
        [self.candidatePaths addObject:[[NormalPath1 alloc]init: false]];
        [self.candidatePaths addObject:[[NormalPath2 alloc]init: true]];
        [self.candidatePaths addObject:[[NormalPath2 alloc]init: false]];
        [self.candidatePaths addObject:[[NormalPath3 alloc]init: true]];
        [self.candidatePaths addObject:[[NormalPath3 alloc]init: false]];
        [self.candidatePaths addObject:[[BezierCurve2Path alloc]init]];
        [self.candidatePaths addObject:[[CirclePath alloc]init]];

        //for double path enemy
        [self.candidateInversePairPaths addObject:[[PathPair alloc]init:[[NormalPath3 alloc]init:true]:[[NormalPath3 alloc]init:false]]];
        [self.candidateInversePairPaths addObject:[[PathPair alloc]init:[[NormalPath2 alloc]init:true]:[[NormalPath2 alloc]init:false]]];
        
        //for triple path enemy
        [self.middlePaths addObject:[[EnemyPath alloc]init:false]];
        
        
        return self;
    }
    else
    {
        return nil;
    }
}



-(EnemyPath*) RandomProducePath
{
    int Total = [self.candidatePaths count];
    int randNumber = rand()%Total;
    return (EnemyPath*)self.candidatePaths[randNumber];
}

-(PathPair*) RandomProducePairPath
{
    int Total = [self.candidateInversePairPaths count];
    int randNumber = rand()%Total;
    return (PathPair*)self.candidateInversePairPaths[randNumber];
}

@end
