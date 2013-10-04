//
//  EnemyPath.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"

//#include <math.h>

@implementation EnemyPath

-(id)init
{
    if(self = [super init])
    {
        isLimitedLife = true;
        maxLifeTime = 6;
    
        return self;
    }
    else
    {
        return nil;
    }
    
}

-(CGPoint) GetPosition:(float) nowTime
{
    float X = -10 + ((480+20) * ((maxLifeTime - nowTime)/maxLifeTime));
    float Y = 160 + 140 * cos(nowTime*2);
    
    return ccp(X,Y);
}
    
@end
