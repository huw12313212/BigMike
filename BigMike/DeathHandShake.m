//
//  DeathHandShake.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/22.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "DeathHandShake.h"
#import "cocos2d.h"

@implementation DeathHandShake

-(id)init :(CCNode*)game : (CCNode*)parentBoss : (NSString*)labelString
{
    if(self = [super init])
    {
    
        self.Game = game;
        self.Boss = parentBoss;
        self.labelString = labelString;
        started = false;
        initCounter = 0;
        
        self.handArray = [[NSMutableArray alloc]init];
        
        int StrLen = [labelString length];
        
        for(int i = 0 ; i <StrLen;i++)
        {
            NSString* character = [labelString substringWithRange:NSMakeRange(i, 1)];
            
            CCLabelTTF* handlabel = [CCLabelTTF labelWithString: character fontName:DEFAULT_FONT fontSize:BOSS_MA_HANDSHAKE_SIZE];
            
            [self.handArray addObject:handlabel];
            
            [handlabel setColor:BOSS_MA_HANDSHAKE_COLOR];
        }
        
        return self;
    }
    else
    {
        return nil;
    }
}

-(void) shootAt:(CGPoint)position andVectorWith:(CGPoint) vector
{
    if(!started)
    {
        started = true;
        difVector = [self Normalize:vector];
        difPosition = position;
        
        for(CCLabelTTF* label in self.handArray)
        {
            [self.Game addChild:label];
        }
        
        
        [self updatePosition];
        
    }
}

-(void)updatePosition
{
    CGPoint bossPosition = [self.Boss position];
    CGPoint point = CGPointMake(bossPosition.x + difPosition.x, bossPosition.y+difPosition.y);
    
    int counter = 0;
    
    for(CCLabelTTF* label in self.handArray)
    {
        float X =  point.x + difVector.x * counter * initCounter * BOSS_MA_HANDSHAKE_DISTANCE;
        float Y =  point.y + difVector.y * counter * initCounter * BOSS_MA_HANDSHAKE_DISTANCE;
        label.position = CGPointMake(X, Y);
        
        counter++;
    }
}

-(void)update:(ccTime)dt
{
    if(started)
    {
        initCounter += dt;
        if(initCounter>1)initCounter = 1;
        
        [self updatePosition];
    }
}

-(CGPoint)Normalize:(CGPoint)target
{
    float x2 = target.x * target.x;
    float y2 = target.y * target.y;
    float xy2 = x2+y2;
    float length = sqrtf(xy2);
    
    return CGPointMake(target.x/length, target.y/length);
}

@end
