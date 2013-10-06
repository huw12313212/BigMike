//
//  EnemyPath.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"
#import "Constants.h"

//#include <math.h>

@implementation EnemyPath

-(id)init: (Boolean)invert
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
    float X = SCREEN_WIDTH-nowTime/maxLifeTime*SCREEN_WIDTH;
    float Y = SCREEN_HEIGHT/2;
    
    return ccp(X,Y);
}
    
@end
