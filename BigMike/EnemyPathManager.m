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
    
    NSLog(@"path number %d",randNumber);
    
    return (EnemyPath*)self.candidatePaths[randNumber];
    
    
    
}

@end
