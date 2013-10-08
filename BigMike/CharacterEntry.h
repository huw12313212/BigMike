//
//  CharacterEntry.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/8.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h";
#import "cocos2d.h"

@interface CharacterEntry : NSObject
{
    @public
    int count;
}

@property (nonatomic,strong) NSString* character;

-(id)init:(NSString*) SingleCharacter;
- (NSComparisonResult)compare:(CharacterEntry *)otherObject;



@end
