//
//  NormalPath1.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "NormalPath1.h"
#import "Constants.h"
#import "cocos2d.h"

@implementation NormalPath1


-(id)init
{
    if(self = [super init])
    {
        isLimitedLife = true;
        maxLifeTime = 6;

        self.accessPoint = [NSArray arrayWithObjects:
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, 100)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-200, 100)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-200, 200)],
                            [NSValue valueWithCGPoint:CGPointMake(-10, 200)] ,nil];
        
        self.accessTime = [NSArray arrayWithObjects:@(0),@(2),@(4),@(6),nil];
        

        
        return self;
    }
    else
    {
        return nil;
    }
    
    
}

-(CGPoint) GetPosition:(float) nowTime
{


    
    int index = 0;
    
    for(NSNumber* time in self.accessTime)
    {
        if(nowTime<[time floatValue])
        {
            break;
        }
        
        index ++;
    }
    

    
    if(index >= [self.accessPoint count])
    {
        return ccp(-20,0);
    }
    else
    {
        CGPoint nextPoint = [self.accessPoint[index] CGPointValue];
        CGPoint previousPoint = [self.accessPoint[index-1] CGPointValue];
        
        float nextTime = [self.accessTime[index] floatValue];
        float previousTime = [self.accessTime[index-1] floatValue];
        
        float ratio = (nowTime - previousTime)/(nextTime-previousTime);
        
        float positionX =nextPoint.x * ratio + previousPoint.x *(1-ratio);
        
        float positionY =nextPoint.y * ratio + previousPoint.y *(1-ratio);
        
        return ccp(positionX,positionY);
    }
    
    
//    float ratio, tempTime = nowTime;
//    
//    if (X<=SCREEN_WIDTH/3*2 && X>=SCREEN_WIDTH/2){
//        ratio = nowTime/2;
//        Y = SCREEN_HEIGHT/2 + 50*nowTime/maxLifeTime;
//    }
//    else if (X<SCREEN_WIDTH/2 && X>=SCREEN_WIDTH/3){
//
//    }
//    else if (X<SCREEN_WIDTH/3){
//        Y = SCREEN_HEIGHT/2 - 100*nowTime/maxLifeTime;
//    }
//    else {
//    
//    }
    
    
    //return ccp(X,Y);
}


@end
