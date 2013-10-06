//
//  Sin2Path.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Sin2Path.h"
#import "Constants.h"

@implementation Sin2Path

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
    float Y = 160/2 + 140 * fabs(cos(nowTime*2));


    if (cos(nowTime*2)>0){

    }
    else{
        
        if (Y<SCREEN_HEIGHT){
            X += cos(nowTime*2)*100;
            Y += cos(nowTime*2)*60;
        }
        else{
            X -= cos(nowTime*2)*100;
            Y -= cos(nowTime*2)*60;
        }
    }
   return ccp(X,Y);
}


@end
