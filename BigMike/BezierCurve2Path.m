//
//  EnemyPath1.m
//  BigMike
//
//  Created by Thomas on 13/10/5.
//  Copyright 2013年 王 瀚宇. All rights reserved.
//


//Bézier curve

#import "BezierCurve2Path.h"
#import "Constants.h"


@implementation BezierCurve2Path

-(id)init
{
    if(self = [super init])
    {
        isLimitedLife = true;
        maxLifeTime = 6;
        
        srandom(time(NULL));
        P0.x = SCREEN_WIDTH, P0.y = rand()%SCREEN_HEIGHT;
        P2.x = 0, P2.y = rand()%SCREEN_HEIGHT;
        P1.x = rand()%SCREEN_WIDTH, P1.y = rand()%SCREEN_HEIGHT;
        
        return self;
    }
    else
    {
        return nil;
    }
    
}

-(CGPoint) GetPosition:(float) nowTime
{
    
    if (nowTime>0){
//        if (abs(nowTime)<=maxLifeTime)
//            t = fabs(nowTime)/maxLifeTime;
//        else
//            t = (fabs(nowTime)-maxLifeTime)/maxLifeTime;
        t = nowTime/maxLifeTime;
        float X = (1-t)*(1-t)*P0.x + 2*t*(1-t)*P1.x + t*t*P2.x;
        float Y = (1-t)*(1-t)*P0.y + 2*t*(1-t)*P1.y + t*t*P2.y;
        
        //    float X = -10 + ((480+20) * ((maxLifeTime - nowTime)/maxLifeTime));
        //    float Y = 160 + 140 * cos(nowTime*2);
        return ccp(X,Y);
    }

}


@end
