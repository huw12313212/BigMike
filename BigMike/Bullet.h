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
    Boolean isShooted;
    CGPoint velicity;
}

@property (nonatomic,strong)CCLabelTTF *bulletTexture;


-(id)init : (CCNode*)parent;
-(void)shootFromPosition:(CGPoint) point;
-(void)update: (ccTime) dt;
@end
