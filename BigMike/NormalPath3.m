//
//  NormalPath3.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "NormalPath3.h"
#import "Constants.h"

@implementation NormalPath3

-(id)init : (Boolean)invert
{
    if(self = [super init])
    {
        isLimitedLife = true;
        maxLifeTime = 6;
        _invert = invert;
        
        self.accessPoint = [NSArray arrayWithObjects:
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, 450)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, 100)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-200, 50)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-350, 100)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, 300)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-230, 200)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-350, 50)],
                            [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-350, 100)],
                            [NSValue valueWithCGPoint:CGPointMake(-10, 300)] ,nil];
        
        self.accessTime = [NSArray arrayWithObjects:@(0),@(2),@(3),@(5),@(6),nil];
        
        
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
    
    
    
    if(index >= [self.accessTime count])
    {
        return ccp(-20,0);
    }
    else
    {
        
        P0 = [self.accessPoint[(index-1)*2] CGPointValue];
        P2 = [self.accessPoint[(index-1)*2+2] CGPointValue];
        P1 = [self.accessPoint[(index-1)*2+1] CGPointValue];
        
        float nextTime = [self.accessTime[index] floatValue];
        float previousTime = [self.accessTime[index-1] floatValue];
        t = (nowTime - previousTime)/(nextTime-previousTime);
        
        float X = (1-t)*(1-t)*P0.x + 2*t*(1-t)*P1.x + t*t*P2.x;
        float Y = (1-t)*(1-t)*P0.y + 2*t*(1-t)*P1.y + t*t*P2.y;
        
        if (_invert == false){
            Y = SCREEN_HEIGHT - Y;
        }
        
        return ccp(X, Y);
    }
    
    
}


@end
