//
//  EnemyPathManager.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPathManager.h"
#import "EnemyPath.h"
#import "EnemyPath1.h"
#import "EnemyPath2.h"
//#import "EnemyPath3.h"

@implementation EnemyPathManager


-(id)init
{
    if(self = [super init])
    {
    
    self.candidatePaths = [[NSMutableArray alloc]init];
    
    
    [self.candidatePaths addObject:[[EnemyPath alloc]init]];
    [self.candidatePaths addObject:[[EnemyPath1 alloc]init]];
     //[self.candidatePaths addObject:[[EnemyPath2 alloc]init]];
        
        
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

@end
