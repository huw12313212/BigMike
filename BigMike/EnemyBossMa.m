//
//  EnemyBossMa.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/18.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//


#import "EnemyBossMa.h"
#import "Bullet.h"


//#import "HelloWorldLayer.h"


@implementation EnemyBossMa


-(id)init : (CCNode*) parent :(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        hp = ENEMY_HP;
        maxHP =ENEMY_HP;
        
        initColor = BOSS_MA_COLOR;
        deadColor = BOSS_MA_COLOR;
        
        DeathHandShakeCounter = 10;
        
        self.parentNode = parent;
        self.enemyLabel = [CCLabelTTF labelWithString: str fontName:DEFAULT_FONT fontSize:BOSS_MA_SIZE];
        
        
        [self initBullet];
       
        [self RecalculateColor];
        
         self._player = [parent valueForKey:@"player"];
       // NSLog(@"%@",parent);
        
      
        
        BulletIndex = 0;
        MinimumDuration = (float)1/BOSS_MA_BULLET_FREQUENCY;
        BulletTimeCounter = 0;
        
        self.hand =[[DeathHandShake alloc]init:parent:self.enemyLabel:BOSS_MA_HANDSHAKE_TEXT];
        self.hand2 =[[DeathHandShake alloc]init:parent:self.enemyLabel:BOSS_MA_HANDSHAKE_TEXT];
        
        return self;
    }
    else
    {
        return nil;
    }
}


-(void)update:(ccTime)dt
{
    
    [super update:dt];
    
  
    if(DeathHandShakeCounter>0)
    {
       DeathHandShakeCounter -= dt;
    }
    else
    {
        [self.hand shootAt:CGPointMake(-40, -40) andVectorWith:CGPointMake(-1, -0.5f)];
        
         [self.hand2 shootAt:CGPointMake(-40, 40) andVectorWith:CGPointMake(-1, 0.5f)];
    }
    
    if(self.hand->started)
    {
        [self.hand update:dt];
        [self.hand2 update:dt];
    }
    
    
    
    BulletTimeCounter += dt;
    
    if(BulletTimeCounter>MinimumDuration)
    {
        
        
        Bullet* currentBullet = self.BulletArray[BulletIndex];
        
        if(!currentBullet->isShooted)
        {
        BulletTimeCounter = 0;
        
        CGPoint position =self.enemyLabel.position;
        
        CGPoint target = self._player.position;
        
        float VecX = target.x - position.x;
        float VecY = target.y - position.y;
        float length = sqrtf(VecX*VecX + VecY*VecY);
        
        VecX/=length;
        VecY/=length;
        
        CGPoint Vec2 = CGPointMake(VecX*BOSS_MA_BULLET_SPEED*dt, VecY*BOSS_MA_BULLET_SPEED*dt);
        currentBullet->velicity = Vec2;
        [currentBullet shootFromPosition:position];
        }
        
        BulletIndex++;
        BulletIndex = BulletIndex % BOSS_MA_BULLET_NUMBER;
        
        if(BulletIndex== 0)
        {
            BulletTimeCounter = -BOSS_MA_BULLET_COOLDOWN;
        }
    }
    
    
    for(Bullet* bullet in self.BulletArray)
    {
        if(bullet->isShooted)
        {
            [bullet update:dt];
        }
    }
}

-(void)initBullet
{
    self.BulletArray = [[NSMutableArray alloc]init];
    
    int StrLen = [BOSS_MA_BULLET_STRING length];
    
    for(int i = 0; i<BOSS_MA_BULLET_NUMBER ; i++)
    {
        int WordIndex = i % StrLen;
        NSString* character = [BOSS_MA_BULLET_STRING substringWithRange:NSMakeRange(WordIndex, 1)];
        Bullet* bullet = [[Bullet alloc]init:self.parentNode:character];
        [bullet.bulletTexture setColor:BOSS_MA_BULLET_COLOR];
        [self.BulletArray addObject:bullet];
    }
}

-(void)BulletHit
{
    if (NO) {
        [super BulletHit];
    }
}


@end
