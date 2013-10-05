//
//  GroundWord.m
//  BigMike
//
//  Created by Ho Jimmy on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "GroundWord.h"

@implementation GroundWord

-(id)init:(int)line {
    if (self = [super init]) {
        
        NSString *ground_word;
        int font_size;
        ccColor3B font_color;
        float moveDuration;
        float positionY;
        float offsetY;
        offsetY = random() % 6;
        if (random() % 5 == 0) {
            ground_word = GROUND_WORD2;
            font_color = GROUND_COLOR2;
        }else {
            ground_word = GROUND_WORD1;
            font_color = GROUND_COLOR1;
        }
        
        if (line==0) {
            font_size = GROUND_SIZE_MORE_BIGGEST;
            moveDuration = 1;
            positionY = 0 + offsetY;
        }else if (line==1) {
            font_size = GROUND_SIZE_BIGGEST;
            moveDuration = 1.2;
            positionY = 30 + offsetY;
        }else if(line==2){
            font_size = GROUND_SIZE_BIG;
            moveDuration = 1.5;
            positionY = 50 + offsetY;
        }else if(line==3){
            font_size = GROUND_SIZE_NORMAL;
            moveDuration = 2.0;
            positionY = 70 + offsetY;
        }else if(line==4){
            font_size = GROUND_SIZE_SMALL;
            moveDuration = 2.5;
            positionY = 90 + offsetY;
        }else if(line==5){
            font_size = GROUND_SIZE_SMALLEST;
            moveDuration = 3.4;
            positionY = 100 + offsetY;
        }
        else if(line==6){
            font_size = GROUND_SIZE_SMALLEST;
            moveDuration = 3.7;
            positionY = 110 + offsetY;
        }
        
      //  [CCDirector sharedDirector].setViewport
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        self.ground = [CCLabelTTF labelWithString:ground_word
                                    fontName:DEFAULT_FONT fontSize:font_size];
        [self.ground setPosition:ccp(screenSize.width+30, positionY)];
        [self.ground setColor:font_color];
        [self addChild:self.ground];
    
        id moveAction = [CCMoveTo actionWithDuration:moveDuration
                                            position:ccp(-50,positionY)];
        [self.ground runAction:moveAction];
        
        [self scheduleUpdate];
        
    }
    return self;
}

-(void)update:(ccTime)dt {
    if (self.ground.position.x < -40) {
        [self removeFromParentAndCleanup:YES];
    }
}

@end
