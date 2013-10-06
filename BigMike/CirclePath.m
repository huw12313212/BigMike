//
//  EnemyPath1.m
//  BigMike
//
//  Created by Thomas on 13/10/5.
//  Copyright 2013年 王 瀚宇. All rights reserved.
//

#import "CirclePath.h"
#import "Constants.h"


@implementation CirclePath

-(id)init
{
    if(self = [super init])
    {
        isLimitedLife = false;
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
    float EnterTime = 2;
    
    float radius = 100;
      CGPoint center = ccp(SCREEN_WIDTH/2,SCREEN_HEIGHT/2);
    
    if(nowTime>EnterTime)
    {
  
    
    float X = radius * cos(nowTime)+center.x;
    float Y = radius * sin(nowTime)+center.y;
           return ccp(X,Y);
    }
    else
    {
        float TargetX =radius * cos(EnterTime)+center.x;
        float TargetY =radius * sin(EnterTime)+center.y;
        
        float ShootX = SCREEN_WIDTH;
        float ShootY = SCREEN_HEIGHT;
        
        float ratio = nowTime/EnterTime;
        
        float nowX = TargetX * ratio + (1-ratio)*ShootX;
        float nowY = TargetY * ratio + (1-ratio)*ShootY;
        
           return ccp(nowX,nowY);
    }
 
}


@end
