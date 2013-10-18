//
//  Player.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Player.h"
#import "Constants.h"


@implementation Player
{
    
}



-(id)init:(CCNode*) parent;
{
    if(self = [super init])
    {
    IsImmortal = NO;
    HP = PLAYER_HP;
    BlinkCounter = 0;
        
    self.parentNode = parent;
    self.playerLabel = [CCLabelTTF labelWithString: PLAYER_WORD fontName:DEFAULT_FONT fontSize:PLAYER_SIZE];
    [parent addChild:self.playerLabel ];
    
    [self.playerLabel setColor:PLAYER_COLOR];
    self.playerLabel.position = PLAYER_POSITION;
    
    isAlive = true;
    
    return self;
    }
    else
    {
        return nil;
    }
}

-(void)movePlayerWithDif:(CGPoint)Dif
{
    CGPoint newPosition = ccpAdd([self position],Dif);
    [self.playerLabel setPosition:newPosition];
    
   // CCLOG(@"Player position:(%f,%f)",newPosition.x,newPosition.y);
}

-(void)update :(ccTime)dt
{
    [self correctPosition];
    [self manageHitEffect:dt];
}

-(void)manageHitEffect:(ccTime)dt
{
    if(IsImmortal)
    {
        BlinkCounter += dt;
        
        if(BlinkCounter >= PLAYER_BLINK_DURATION)
        {
            BlinkCounter = 0;
            IsImmortal = false;
            [self.playerLabel setColor:PLAYER_COLOR];
            
        }
        else
        {
            //NSLog(@"%f",BlinkCounter);
            float blinkSlot = 1/ (float) PLAYER_BLINK_FREQUENCY;
            
            int slotNumber = BlinkCounter / blinkSlot;
            
            int colorFlag = slotNumber%2;
            
            if(colorFlag == 0)
            {
                [self.playerLabel setColor:PLAYER_COLOR];
            }
            else
            {
                [self.playerLabel setColor:PLAYER_BLINK_COLOR];
            }
            
        }
        
    }
}

-(void)correctPosition
{
    float nowPositionX = [self position].x;
    float nowPositionY = [self position].y;
    
    if(nowPositionX<0)nowPositionX = 0;
    if(nowPositionY<0)nowPositionY = 0;
    
    if(nowPositionX>SCREEN_WIDTH)nowPositionX = SCREEN_WIDTH;
    if(nowPositionY>SCREEN_HEIGHT-PLAYER_SIZE/2)nowPositionY = SCREEN_HEIGHT-PLAYER_SIZE/2;
    
    [self.playerLabel setPosition:ccp(nowPositionX,nowPositionY)];
}

-(CGPoint)position
{
    return [self.playerLabel position];
}

-(void)hitByEnemy:(NSObject*) enemy
{
   
    
    if(IsImmortal)
    {
        
        return;
    }
    else
    {
         NSLog(@"hit by enemy");
        IsImmortal = true;
        HP--;
        if(HP<=0)
        {
            NSLog(@"拳四郎：你已經死了。");
        }
    }
}



-(void)setHPViewer:(HPViewer*) hpViewer
{
#warning should finish
    
}
    
@end
