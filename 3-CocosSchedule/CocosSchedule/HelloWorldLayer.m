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
    
       // [NSTimer scheduledTimerWithTimeInterval:(5.0) target:<#(id)#> selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>]
        
        [self scheduleOnce:@selector(callMyDelay:) delay:10.0];
        
        
        [self schedule:@selector(tick1:) interval:0.5f];
        
	}
	return self;
}

-(void) callMyDelay:(ccTime)dt{
    
    NSLog(@"my function called");
    printf("hfakjdsfhl");
    
}

-(void) tick1:(ccTime)dt
{
	NSLog(@"tick1");
    
    
}


- (void) dealloc
{
	[super dealloc];
}

@end
