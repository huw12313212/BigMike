//
//  Bullet.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Bullet.h"
#import "CCNode.h"

#import "Constants.h"
#import "cocos2d.h"


@implementation Bullet
{
    CCNode* bulletparent;

    
}

-(id)init :(CCNode*)parent
{
   if( self = [super init])
   {
    
    
    isShooted = false;
    velicity = ccp(BULLET_SPEED,0);
    
    bulletparent = parent;
    
    self.bulletTexture = [CCLabelTTF labelWithString:BULLET_WORD
                                            fontName:DEFAULT_FONT
                                            fontSize:BULLET_SIZE];
    [self.bulletTexture  setColor:BULLET_COLOR];
    
    
    self.bulletTextureGray = [CCLabelTTF labelWithString:BULLET_GRAY_WORD
                                                fontName:DEFAULT_FONT
                                                fontSize:BULLET_SIZE];
   
    
    
    return self;
   }
    else
    {
    return nil;
    }
}

-(void)shootFromPosition:(CGPoint) point
{
    if(!isShooted)
    {
        self.bulletTexture.position = point;
        isShooted = true;
        [bulletparent addChild:self.bulletTexture];
        //CCLOG(@"test");
    }
}

-(void)removeBullet :(Boolean)grayEffect
{
    isShooted = false;
    
    
    [self.bulletTextureGray  setColor:BULLET_GRAY_COLOR];
    
    
    [self.bulletTexture removeFromParent];
    
    if(grayEffect)
    {
        [bulletparent addChild:self.bulletTextureGray];
        
        
        self.bulletTextureGray.position = self.bulletTexture.position;
        
        CCActionTween* scaleAction= [CCActionTween actionWithDuration:0.5 key:@"scale" from:1 to:0];
        CCEaseIn* ease =[CCEaseIn actionWithAction:scaleAction rate:2];
        
        
        CCCallFuncN* call = [CCCallBlock actionWithBlock:^
                             {
                                 [self.bulletTextureGray removeFromParent];
                             }
                             ];
        
        CCSequence* sequence = [CCSequence actions:
                                ease,
                                call,
                                nil];
        
        [self.bulletTextureGray runAction:sequence];
    }
    
    
    
    
}

-(void)update: (ccTime) dt
{

    
    if(isShooted)
    {
        CGPoint result =
        self.bulletTexture.position =
        ccpAdd(self.bulletTexture.position,velicity);
        
        if(result.x > SCREEN_WIDTH+BULLET_OUTSIDE_PADDING)
        {
         
            [self removeBullet: false];
            
        }
    }
}






@end
