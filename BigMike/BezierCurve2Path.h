//
//  EnemyPath1.h
//  BigMike
//
//  Created by Thomas on 13/10/5.
//  Copyright 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyPath.h"

@interface BezierCurve2Path : EnemyPath {
    
@public
    
    CGPoint P0, P1, P2;
    float t;
}


@end

