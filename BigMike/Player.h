//
//  Player.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HPViewer.h"

@interface Player : NSObject
{
    @public
    BOOL isAlive;
    int HP;
    BOOL IsImmortal;
    
    @private
    float BlinkCounter;
    
}


@property (nonatomic, strong)CCLabelTTF* playerLabel;
@property (nonatomic,assign)CCNode* parentNode;

-(id)init:(CCNode*) parent;
-(void)movePlayerWithDif:(CGPoint)Dif;
-(void)update :(ccTime)dt;
-(void)hitByEnemy:(NSObject*) enemy;
-(void)setHPViewer:(HPViewer*) hpViewer;

-(CGPoint) position;


@end
