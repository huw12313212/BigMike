//
//  MenuLayer.m
//  BigMike
//
//  Created by Ho Jimmy on 13/10/9.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "MenuLayer.h"
#import "HelloWorldLayer.h"

@implementation MenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
    
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [MenuLayer node];
    
    //BackGround Color
    // CCLayerColor *colorLayer = [CCLayerColor layerWithColor:ccc4(255, 255, 255,255)];
    //[scene addChild:colorLayer];
	
	// add layer as a child to scene
	[scene addChild: layer];

	// return the scene
	return scene;
}

-(id)init {
    if (self = [super init]) {
        
        CGSize screen = [[CCDirector sharedDirector] winSize];
        CCMenu *menu;
        
        startLabel =
            [CCLabelTTF labelWithString:@"開始遊戲" fontName:DEFAULT_FONT fontSize:32];
        CCLabelTTF *startLabelChange =
            [CCLabelTTF labelWithString:@"開始遊戲" fontName:DEFAULT_FONT fontSize:32];
        [startLabelChange setColor:ccc3(0, 255, 255)];

        creditLabel =
        [CCLabelTTF labelWithString:@"開發人員" fontName:DEFAULT_FONT fontSize:32];
        CCLabelTTF *creditLabelChange =
            [CCLabelTTF labelWithString:@"開發人員" fontName:DEFAULT_FONT fontSize:32];
        [creditLabelChange setColor:ccc3(0, 255, 255)];
        
        CCMenuItemLabel *start = [CCMenuItemImage itemWithNormalSprite:startLabel selectedSprite:startLabelChange disabledSprite:nil target:self selector:@selector(start)];
        CCMenuItemLabel *credit = [CCMenuItemImage itemWithNormalSprite:creditLabel selectedSprite:creditLabelChange disabledSprite:nil target:self selector:@selector(credit)];
        
        menu = [CCMenu menuWithItems:start,credit, nil];
        [menu alignItemsVerticallyWithPadding:20.0];
        menu.position = ccp(screen.width/2, screen.height/2 - 50);
        [self addChild:menu];
        
        titleLabel = [CCLabelTTF labelWithString:@"進擊的新聞"
                                                    fontName:DEFAULT_FONT fontSize:50];
        titleLabel.position = ccp(screen.width/2, screen.height*0.75);
        [self addChild:titleLabel];
        
        id scaleUpAction = [CCScaleTo actionWithDuration:0.3 scale:1.2];
        id scaleDownAction = [CCScaleTo actionWithDuration:0.3 scale:1];
        id holdAction = [CCDelayTime actionWithDuration:1];
        id sequence = [CCSequence actions:scaleUpAction,scaleDownAction,scaleUpAction,scaleDownAction,holdAction, nil];
        id repeatAction = [CCRepeatForever actionWithAction:sequence];
        [titleLabel runAction:repeatAction];
    }
    return self;
}

-(void)start {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5
                                                        scene:[HelloWorldLayer scene] ]];
}

-(void)credit {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5
                                                        scene:[HelloWorldLayer scene] ]];
}

@end
