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
    
    if(time >= self.path->maxLifeTime)
    {
        isAlive = false;
    }
}

-(id)init : (CCNode*) parent:(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        
        self.parentNode = parent;
        self.enemyLabel = [CCLabelTTF labelWithString: str fontName:DEFAULT_FONT fontSize:PLAYER_SIZE];
 
        return self;
    }
    else
    {
        return nil;
    }
}

@end
