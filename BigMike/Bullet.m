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
    isShooted = false;
    velicity = ccp(BULLET_SPEED,0);
    
    bulletparent = parent;
    
    self.bulletTexture = [CCLabelTTF labelWithString:@"彈" fontName:DEFAULT_FONT fontSize:BULLET_SIZE];
    [self.bulletTexture  setColor:ccc3(0,0,255)];
    return self;
}

-(void)shootFromPosition:(CGPoint) point
{
    if(!isShooted)
    {
        self.bulletTexture.position = point;
        isShooted = true;
        [bulletparent addChild:self.bulletTexture];
        CCLOG(@"test");
    }
}

-(void)removeBullet
{
    isShooted = false;
    [self.bulletTexture removeFromParent];
}

-(void)update: (ccTime) dt
{
    if(isShooted)
    {
        CGPoint result = self.bulletTexture.position = ccpAdd(self.bulletTexture.position,velicity);
        
        
        if(result.x > SCREEN_WIDTH+BULLET_OUTSIDE_PADDING)
        {
         
            [self removeBullet];
            
        }
    }
    
    
}






@end
