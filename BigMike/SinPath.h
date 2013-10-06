//
//  SinPath.h
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SinPath : EnemyPath{
@public
}

-(id)init;

-(CGPoint) GetPosition:(float) nowTime;


@end
