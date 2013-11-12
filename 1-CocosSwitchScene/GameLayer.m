#import "GameLayer.h"


@implementation GameLayer

- (id)init
{
    self = [super init];
    if (self) {
        
        
        // Get size of screen
        CGSize size = [[CCDirector sharedDirector] winSize];
        // BACKGROUND
        CCSprite *background;
        background = [CCSprite spriteWithFile:@"menu_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];
        
    }
    return self;
}


@end
