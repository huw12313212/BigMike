//
//  Enemy.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Enemy.h"



@implementation Enemy


-(void)update:(ccTime)dt
{
    time += dt;
    
    
    if(time<0)
    {
            [self.enemyLabel setPosition: ccp(-100,0)];
    }
    else
    {
    CGPoint position =[self.path GetPosition:time];
    
    [self.enemyLabel setPosition: position];
    }
    
    if(self.path->isLimitedLife)
    {
       
        if(time >= self.path->maxLifeTime)
        {
            isAlive = false;
        }
    }
}

-(id)init : (CCNode*) parent :(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        hp = ENEMY_HP;
        maxHP =ENEMY_HP;
        
        initColor = ENEMY_START_COLOR;
        deadColor = ENEMY_DEAD_COLOR;
        
        self.parentNode = parent;
        self.enemyLabel = [CCLabelTTF labelWithString: str fontName:DEFAULT_FONT fontSize:ENEMY_SIZE];
        
        
        [self RecalculateColor];

 
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)RecalculateColor
{
    float ratio = (float)hp/maxHP;
    
    ccColor3B color;
    color.r = initColor.r * ratio + deadColor.r *(1-ratio);
    color.g = initColor.g * ratio + deadColor.g *(1-ratio);
    color.b = initColor.b * ratio + deadColor.b *(1-ratio);
    
    [self.enemyLabel setColor:color];
}

-(void)BulletHit
{
    hp--;
    

    [self RecalculateColor];
    
    
    
    if(hp==0)
    {
        CCActionTween* scaleAction= [CCActionTween actionWithDuration:ENEMY_PRE_DURATION key:@"scale" from:self.enemyLabel.scale to:ENEMY_HIT_SCALE];
        CCEaseIn* ease =[CCEaseIn actionWithAction:scaleAction rate:2];
        
        CCActionTween* scaleAction2= [CCActionTween actionWithDuration:ENEMY_POST_DURATION key:@"scale" from:ENEMY_HIT_SCALE to:0];
        CCEaseIn* ease2=[CCEaseIn actionWithAction:scaleAction2 rate:2];
        
        
        CCCallFuncN* call = [CCCallBlock actionWithBlock:^
        {
             isAlive = false;
        }
        ];
        
        
        
        CCSequence* sequence = [CCSequence actions:
                                ease,
                                ease2,
                                call,
                                nil];
        
       
         [self.enemyLabel runAction:sequence];
    }
    else
    {
        
        CCActionTween* scaleAction= [CCActionTween actionWithDuration:ENEMY_PRE_DURATION key:@"scale" from:self.enemyLabel.scale to:ENEMY_HIT_SCALE];
        
        CCEaseInOut* ease =[CCEaseInOut actionWithAction:scaleAction rate:2];
        
        CCActionTween* scaleAction2= [CCActionTween actionWithDuration:ENEMY_POST_DURATION key:@"scale" from:ENEMY_HIT_SCALE to:1.0];
        CCEaseInOut* ease2=[CCEaseInOut actionWithAction:scaleAction2 rate:2];


        CCSequence* sequence = [CCSequence actions:
                                ease,
                                ease2,
                                nil];
        
        
        [self.enemyLabel runAction:sequence];
    }
}

@end
