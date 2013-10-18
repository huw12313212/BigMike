//
//  BulletManager.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyManager.h"

@interface BulletManager : NSObject
{
}

-(id)init :(CCNode*) parent;
-(void)update:(ccTime) dt withPoint : (CGPoint)position;
-(void)checkBulletHitEnemy:(EnemyManager*)enemyManager;
+(bool)isHited:(CGRect)RecA:(CGRect)RecB;

@property (nonatomic,strong)NSMutableArray* BulletArray;

@end
