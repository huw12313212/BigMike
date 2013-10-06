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
    
    CCLOG(@"Player position:(%f,%f)",newPosition.x,newPosition.y);
}

-(void)update :(ccTime)dt
{
    [self correctPosition];
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
    
@end
