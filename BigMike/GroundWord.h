//
//  GroundWord.h
//  BigMike
//
//  Created by Ho Jimmy on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <cocos2d.h>
#import "Constants.h"
@interface GroundWord : CCSprite {
    
}

@property (nonatomic,strong) CCLabelTTF *ground;

-(id)init:(int)line;

@end
