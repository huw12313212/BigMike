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

-(id)init : (CCNode*) parent:(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        hp = ENEMY_HP;
        maxHP =ENEMY_HP;
        
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
    
    float ratio = (float)hp/maxHP;
    
    ccColor3B color;
    color.r = ENEMY_START_COLOR.r * ratio + ENEMY_DEAD_COLOR.r *(1-ratio);
    color.g = ENEMY_START_COLOR.g * ratio + ENEMY_DEAD_COLOR.g *(1-ratio);
    color.b = ENEMY_START_COLOR.b * ratio + ENEMY_DEAD_COLOR.b *(1-ratio);
    
    [self.enemyLabel setColor:color];
    
    
    
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
