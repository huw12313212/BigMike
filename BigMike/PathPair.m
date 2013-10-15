//
//  PathPair.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "PathPair.h"
@implementation PathPair

-(id)init : (EnemyPath*) path1 : (EnemyPath*) path2
{
    if(self = [super init])
    {
        self.path1 = path1;
        self.path2 = path2;
        
        return self;
    }
    else
    {
        return nil;
    }
}

@end
