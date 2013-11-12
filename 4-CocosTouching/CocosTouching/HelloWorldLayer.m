// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
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
	if( (self=[super init]) ) {
        
        // Must turn on touching first!!!!
        self.isTouchEnabled = YES;
        
	}
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // Get touch and convert to cocos space
    UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

    
    CCSprite * hero = [[CCSprite alloc]initWithFile:@"Icon.png"];
    CGPoint centerPoint = convertedLocation;
    hero.position = centerPoint;
    [self addChild:hero ];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    // Crazy Particles
    /*
    
    // Get touch and convert to cocos space
    UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
        
    CCParticleFireworks * emitter = [CCParticleFireworks node];
    
    emitter.position = convertedLocation;
	[self addChild:emitter z:10];
    
	// testing "alpha" blending in premultiplied images
    //	emitter_.blendFunc = (ccBlendFunc) {GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA};
	emitter.texture = [[CCTextureCache sharedTextureCache] addImage: @"Icon.png"];
	emitter.blendAdditive = YES;
    */
    
}


- (void) dealloc
{
	[super dealloc];
}

@end
