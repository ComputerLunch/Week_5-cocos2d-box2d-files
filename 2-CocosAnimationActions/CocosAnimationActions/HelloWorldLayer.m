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

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        // Size of screen
		CGSize s = [[CCDirector sharedDirector] winSize];
        

        hero = [[CCSprite alloc]initWithFile:@"Icon.png"];
        CGPoint centerPoint = ccp(s.width/2.0f, s.height/2.0);
        hero.position = centerPoint;
        [self addChild:hero ];
        
        


        [CCMenuItemFont setFontSize:28];
		
		// move location 
		CCMenuItem *moveTo = [CCMenuItemFont itemWithString:@"MoveTo" block:^(id sender) {
			
            
            
            
            // reset location
            hero.position = centerPoint;
            
            // Make & run action
            id actionTo = [CCMoveTo actionWithDuration:2.0 position:ccp(50, 50)];
            [hero runAction: actionTo];
		
        
        
        }
        ];

		CCMenuItem *scaleBy = [CCMenuItemFont itemWithString:@"ScaleTo" block:^(id sender) {
			
            id actionTo = [CCScaleBy actionWithDuration:1.0 scale:2.0];
            [hero runAction:actionTo];
			
		}
        ];
        
        CCMenuItem *seqenceAction = [CCMenuItemFont itemWithString:@"Seqence" block:^(id sender) {
			
            id actionTo = [CCRotateTo actionWithDuration: 2 angle:45];
            id actionTo2 = [CCRotateTo actionWithDuration: 2 angle:-45];
            id actionTo0 = [CCRotateTo actionWithDuration:2  angle:0];
            
            [hero runAction: [CCSequence actions:actionTo, actionTo2, actionTo0, nil]];
        }
        ];
		
        
        
		CCMenu *menu = [CCMenu menuWithItems:moveTo, scaleBy,seqenceAction, nil];
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( s.width * 0.5, s.height * 0.9)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        self.isTouchEnabled = true;

	}
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"i touched");
    
}

- (void) dealloc
{
	[super dealloc];
}

@end
