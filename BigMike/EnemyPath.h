//
//  EnemyPath.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EnemyPath : NSObject
{
    @public
    Boolean isLimitedLife;
    float maxLifeTime;
}

-(id)init;

-(CGPoint) GetPosition:(float) nowTime;



@end
