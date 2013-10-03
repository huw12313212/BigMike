//
//  HelloWorldLayer.mm
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/3.
//  Copyright 王 瀚宇 2013年. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"
#import "IntroLayer.h"
// Not included in "cocos2d.h"
#import "CCPhysicsSprite.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"


enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer()
-(void) initPhysics;
-(void) addNewSpriteAtPosition:(CGPoint)p;
-(void) createMenu;

@end

@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
		// enable events
		
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
		CGSize s = [CCDirector sharedDirector].winSize;
		

//#if 1
//		// Use batch node. Faster
//		CCSpriteBatchNode *parent = [CCSpriteBatchNode batchNodeWithFile:@"blocks.png" capacity:100];
//		spriteTexture_ = [parent texture];
//#else
//		// doesn't use batch node. Slower
//		spriteTexture_ = [[CCTextureCache sharedTextureCache] addImage:@"blocks.png"];
//		CCNode *parent = [CCNode node];
//#endif
//		[self addChild:parent z:0 tag:kTagParentNode];
		
		
        
        fly = [CCLabelTTF labelWithString:@"艦" fontName:@"Marker Felt" fontSize:32];
        
        [self addChild:fly];
        [fly setColor:ccc3(0,0,255)];
        fly.position = ccp( s.width/2, s.height-50);
		
		[self scheduleUpdate];
	}
	return self;
}

-(void) dealloc
{
	[super dealloc];
}	

-(void) createMenu
{
	// Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
	
	// Reset Button
	CCMenuItemLabel *reset = [CCMenuItemFont itemWithString:@"Reset" block:
                              ^(id sender){
		[[CCDirector sharedDirector] replaceScene: [IntroLayer scene]];
	}
                              ];

	// to avoid a retain-cycle with the menuitem and blocks
	__block id copy_self = self;

	// Achievement Menu Item using blocks
	CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
		
		
		GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
		achivementViewController.achievementDelegate = copy_self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:achivementViewController animated:YES];
		
		[achivementViewController release];
	}];
	
	// Leaderboard Menu Item using blocks
	CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
		
		
		GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
		leaderboardViewController.leaderboardDelegate = copy_self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:leaderboardViewController animated:YES];
		
		[leaderboardViewController release];
	}];
	
	CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, reset, nil];
	
	[menu alignItemsVertically];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];	
}

-(void) initPhysics
{

}

-(void) draw
{

	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	

}

-(void) addNewSpriteAtPosition:(CGPoint)p
{


}

-(void) update: (ccTime) dt
{
	
    [self correctPlayerPosition];
    
}

-(void)correctPlayerPosition
{
    float nowPositionX = [fly position].x;
    float nowPositionY = [fly position].y;
    
    if(nowPositionX<0)nowPositionX = 0;
    if(nowPositionY<0)nowPositionY = 0;
    
    if(nowPositionX>480)nowPositionX = 480;
    if(nowPositionY>320)nowPositionY = 320;
    
    [fly setPosition:ccp(nowPositionX,nowPositionY)];
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for( UITouch *touch in touches ) {
        CGPoint touchLocation = [touch locationInView: [touch view]];
        CGPoint prevLocation = [touch previousLocationInView: [touch view]];
        
        touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
        prevLocation = [[CCDirector sharedDirector] convertToGL: prevLocation];
        
        CGPoint diff = ccpSub(touchLocation,prevLocation);
        
        [fly setPosition:ccpAdd([fly position], diff)];
        
        CCLOG(@"hello %f,%f",[fly position].x,[fly position].y);
    }
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end
