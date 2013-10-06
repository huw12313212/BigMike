//
//  NormalPath2.h
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"

@interface NormalPath2 : EnemyPath{
@public
    CGPoint P0, P1, P2;
    float t;
    Boolean _invert;
}

@property (nonatomic, retain)NSArray* accessPoint;

@property (nonatomic, retain)NSArray* accessTime;

-(id)init: (Boolean)invert;

@end
