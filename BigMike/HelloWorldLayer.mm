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
#import "Constants.h"



enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer(){
    float creatTime;
}


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
		
        self.bulletManager = [[BulletManager alloc]init:self];
        self.player = [[Player alloc]init:self];
        //self.articleAnalysis = [[ArticleAnalysis alloc]init];
        self.enemyManager = [[EnemyManager alloc]init:self];
        [self.enemyManager setNowArticleAnaysis:self.articleAnalysis];
        
        
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
        
		
		[self scheduleUpdate];
	}
	return self;
}

-(void) dealloc
{

}	


-(void) draw
{

	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
}



-(void) update: (ccTime) dt
{
    creatTime += dt;
	if (creatTime>0.2) {
        creatTime = 0;
        [self creatGround:0];
        [self creatGround:1];
        [self creatGround:2];
        [self creatGround:3];
        [self creatGround:4];
        [self creatGround:5];
        [self creatGround:6];
    }
    
    [self.bulletManager update:dt withPoint:[self.player position]];
    [self.player update:dt];
    [self.enemyManager update:dt];
    [self.bulletManager checkBulletHitEnemy:self.enemyManager];
    
}

-(void)creatGround:(int)line{
    //GroundWord *ground = [[GroundWord alloc] init:line];
    //[self addChild:ground z:-100];
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
        
        [self.player movePlayerWithDif:diff];
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
