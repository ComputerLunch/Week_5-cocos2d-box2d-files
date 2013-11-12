#import "AboutLayer.h"
#import "HelloWorldLayer.h"

@implementation AboutLayer

- (id)init
{
    self = [super init];
    if (self) {
        
        
        // Get size of screen
        CGSize size = [[CCDirector sharedDirector] winSize];
        // BACKGROUND
        CCSprite *background;
        background = [CCSprite spriteWithFile:@"sky2.png"];
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];

        
        // LABELS
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"( 20,20 )" fontName:@"Marker Felt" fontSize:10];
		label.position =  ccp( 20,20);
		[self addChild: label];
        
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"( 20,300 )" fontName:@"Marker Felt" fontSize:10];
		label2.position =  ccp( 20,300);
		[self addChild: label2];
        
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"( 420,10 )" fontName:@"Marker Felt" fontSize:10];
        label3.position =  ccp( 420,10);
		[self addChild: label3];
        
        CCLabelTTF *label4 = [CCLabelTTF labelWithString:@"( 420,300 )" fontName:@"Marker Felt" fontSize:10];
		label4.position =  ccp( 420,300);
		[self addChild: label4];
        
    
        // BACK MENU
		CCMenuItem *backItem = [CCMenuItemFont itemWithString:@"BACK" block:^(id sender) {
            
            CCScene * scene = [CCScene node];
            [scene addChild: [HelloWorldLayer node] z:0];
            [[CCDirector sharedDirector] pushScene: [CCTransitionSlideInT transitionWithDuration:1 scene:scene]];
            
		}];
        
        CCMenu *menu = [CCMenu menuWithItems:backItem, nil];
        [self addChild:menu];
        
       
    }
    return self;
}

@end
