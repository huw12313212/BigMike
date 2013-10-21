//
//  Bullet.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//
#import "cocos2d.h"

@interface Bullet : NSObject
{
    @public
    Boolean isShooted;
    CGPoint velicity;
}

@property (nonatomic,strong)CCLabelTTF *bulletTexture;

@property (nonatomic,strong)CCLabelTTF *bulletTextureGray;


-(id)init : (CCNode*)parent;
-(id)init : (CCNode*)parent : (NSString*)character;
-(void)shootFromPosition:(CGPoint) point;
-(void)update: (ccTime) dt;
-(void)removeBullet:(Boolean)grayEffect;

@end
