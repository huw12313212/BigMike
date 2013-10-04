//
//  Player.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : NSObject
{
    BOOL isAlive;
}


@property (nonatomic, strong)CCLabelTTF* playerLabel;
@property (nonatomic,assign)CCNode* parentNode;

-(id)init:(CCNode*) parent;
-(void)movePlayerWithDif:(CGPoint)Dif;
-(void)update :(ccTime)dt;
-(void)correctPosition;

-(CGPoint) position;

@end
