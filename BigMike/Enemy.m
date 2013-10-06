//
//  Enemy.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Enemy.h"
#import "cocos2d.h"
#import "Constants.h"

@implementation Enemy

-(void)update:(ccTime)dt
{
    time += dt;
    
    CGPoint position =[self.path GetPosition:time];
    
    [self.enemyLabel setPosition: position];
    
    if(self.path->isLimitedLife)
    {
    
        if(time >= self.path->maxLifeTime)
        {
            isAlive = false;
        }
    }
}

-(id)init : (CCNode*) parent:(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        hp = ENEMY_HP;
        
        
        self.parentNode = parent;
        self.enemyLabel = [CCLabelTTF labelWithString: str fontName:DEFAULT_FONT fontSize:ENEMY_SIZE];
        [self.enemyLabel setColor:ENEMY_START_COLOR];
 
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)BulletHit
{
    hp--;
    
    float ratio = (float)hp/ENEMY_HP;
    
    ccColor3B color;
    color.r = ENEMY_START_COLOR.r * ratio + ENEMY_DEAD_COLOR.r *(1-ratio);
    color.g = ENEMY_START_COLOR.g * ratio + ENEMY_DEAD_COLOR.g *(1-ratio);
    color.b = ENEMY_START_COLOR.b * ratio + ENEMY_DEAD_COLOR.b *(1-ratio);
    
    
    [self.enemyLabel setColor:color];
    
    if(hp==0)
    {
        isAlive = false;
    }
}

@end
