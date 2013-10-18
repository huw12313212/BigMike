//
//  BulletManager.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "BulletManager.h"
#import "Constants.h"
#import "Bullet.h"
#import "Enemy.h"

@implementation BulletManager
{
    int currentBulletIndex;
    float TimeCount;
    CCNode* BulletParent;
}

-(id)init:(CCNode*) parent
{
    if(self = [super init])
    {
        BulletParent = parent;
        currentBulletIndex = 0;
        TimeCount = 0;
        
        self.BulletArray = [[NSMutableArray alloc]init];
        
        for(int i = 0; i<BULLET_MAX_COUNT;i++)
        {
            Bullet* bullet = [[Bullet alloc]init : parent];
            [self.BulletArray addObject:bullet];
        }
    
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)update:(ccTime) dt withPoint : (CGPoint)position
{
    TimeCount += dt;

    //CCLOG(@"%f",TimeCount);
    
    float threashold = 1.0f/BULLET_FREQUENCY;
    
    while(TimeCount>threashold)
    {
        TimeCount-= threashold;
        [self ShootABullet:ccpAdd(position,BULLET_OFFSET)];
    }
    
    for(Bullet* bullet in self.BulletArray)
    {
        [bullet update:dt];
    }
}

-(void)checkBulletHitEnemy:(EnemyManager*)enemyManager
{
    NSMutableArray* enemyArray = enemyManager.nowAliveEnemies;
    
    for(Bullet* bullet in self.BulletArray)
    {
        for(Enemy* enemy in enemyArray)
        {
            if(bullet->isShooted)
            {
                if(enemy->isAlive)
                {
                    if([BulletManager isHited:bullet.bulletTexture.boundingBox :enemy.enemyLabel.boundingBox ])
                    {
                        
                            [bullet removeBullet : true];
                            [enemy BulletHit];
                        
                        
                        break;
                    }
                }
            }
        }
    }
}

+(bool)isHited:(CGRect)RecA:(CGRect)RecB
{
    
   return CGRectIntersectsRect(RecA, RecB);
}

-(void)ShootABullet:(CGPoint) position
{
    Bullet* nowBullet = (Bullet*)self.BulletArray[currentBulletIndex];
    
    currentBulletIndex++;
    currentBulletIndex = currentBulletIndex % BULLET_MAX_COUNT;
    
    [nowBullet shootFromPosition:position];
    
}

@end
