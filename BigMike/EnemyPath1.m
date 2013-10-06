//
//  EnemyPath1.m
//  BigMike
//
//  Created by Thomas on 13/10/5.
//  Copyright 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath1.h"
#import "Constants.h"


@implementation EnemyPath1

-(id)init
{
    if(self = [super init])
    {
        isLimitedLife = true;
        maxLifeTime = 6;
/*
        srandom(time(NULL));
        P0.x = 480, P0.y = rand()%320;
        P2.x = 0, P2.y = rand()%320;
        P1.x = rand()%480, P1.y = rand()%320;
    */
        
        return self;
    }
    else
    {
        return nil;
    }
    
}

-(CGPoint) GetPosition:(float) nowTime
{
    float radius = 100;
    
    CGPoint center = ccp(SCREEN_WIDTH/2,SCREEN_HEIGHT/2);
    
    float X = radius * cos(nowTime)+center.x;
    float Y = radius * sin(nowTime)+center.y;
    
    /*
    if (abs(nowTime)<=maxLifeTime)
        t = fabs(nowTime);
    else
        t = fabs(nowTime)-maxLifeTime;
    
    float X = (1-t)*(1-t)*P0.x + 2*t*(1-t)*P1.x + t*t*P2.x;
    float Y = (1-t)*(1-t)*P0.y + 2*t*(1-t)*P1.y + t*t*P2.y;
    
    
//    float X = -10 + ((480+20) * ((maxLifeTime - nowTime)/maxLifeTime));
//    float Y = 160 + 140 * cos(nowTime*2);
    */
    
    
    return ccp(X,Y);
}


@end
